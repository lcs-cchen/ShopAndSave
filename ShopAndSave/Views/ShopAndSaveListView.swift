//
//  ShopAndSaveListView.swift
//  ShopAndSave
//
//  Created by Cyrus Chen on 5/6/2023.
//
import Blackbird
import SwiftUI

struct ShopAndSaveListView: View {
    
    @Environment(\.blackbirdDatabase) var db:Blackbird.Database?
    
    @BlackbirdLiveModels var ShopAndSaveItems: Blackbird.LiveResults<ShopAndSaveItem>
    
    @BlackbirdLiveModels({db in
        try await ShopAndSaveItem.read(from: db)
    }) var ShopAndSaves
    
    var body: some View {
        List{
            
                Section{
                    ForEach(ShopAndSaves.results){ currentItem in
                        Label(title: {
                            ShopAndSaveItemView(name: currentItem.name, quantity: currentItem.quantity, price: currentItem.price)
                        }, icon: {
                            if currentItem.ticked == true {
                                Image (systemName: "checkmark.circle")
                                    .scaledToFit()
                            } else {
                                Image(systemName: "circle")
                            }
                        })
                        .onTapGesture {
                            Task{
                                try await db!.transaction{ core in
                                    try core.query("UPDATE ShopAndSaveItem SET ticked = (?) WHERE ID = (?)",
                                                   !currentItem.ticked,currentItem.id)
                                }
                            }
                        }
                        
                    }
                    .onDelete(perform: removeRows)
                } header: {
                    HStack{
                        
                        Text("Items")
                            .padding(.leading,50)
                        Spacer()
                        Text("Quantity")
                            .padding(.leading, 40)
                        Spacer()
                        Text("Price")
                            
                        
                    }
                
            }
        }
    }
    init(filteredOn searchText: String){
        _ShopAndSaveItems = BlackbirdLiveModels({ db in
            try await ShopAndSaveItem.read(from: db,
            sqlWhere: "name LIKE ?", "%\(searchText)%")
        })
    }
    func removeRows(at offsets: IndexSet){
        
        Task{
            try await db!.transaction{ core in
                var idlist = ""
                for offset in offsets{
                    idlist += "\(ShopAndSaveItems.results[offset].id),"
                }
                print(idlist)
                idlist.removeLast()
                print(idlist)
                
                try core.query("DELETE FROM ShopAndSaveItem Where id IN (?)",idlist)
            }
        }
    }
}

struct ShopAndSaveListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopAndSaveListView(filteredOn: "Banana")
    }
}
