//
//  ShopAndSaveListView.swift
//  ShopAndSave
//
//  Created by Cyrus Chen on 3/6/2023.
//
import Blackbird
import SwiftUI

struct ShopAndSaveListView: View {
    @Environment(\.blackbirdDatabase) var db:Blackbird.Database?
    
    @BlackbirdLiveModels var todoItems: Blackbird.LiveResults<ShopAndSaveItem>
    
    var body: some View {
        List{
            Section{
                
                
                ShopAndSaveItemView(name: "Apple", quantity: 2, price: 2)
                ShopAndSaveItemView(name: "Apple", quantity: 2, price: 2)
                ShopAndSaveItemView(name: "Apple", quantity: 2, price: 2)
                
            } header: {
                HStack{
                    Spacer()
                    Text("Items")
                    Spacer(minLength: 120)
                    Text("Quantity")
                    Spacer(minLength: 30)
                    Text("Price")
                    Spacer()
                    
                }
            }
        }
        .cornerRadius(20)
        .listStyle(.plain)
    }
    init(filteredOn searchText: String){
        _todoItems = BlackbirdLiveModels({ db in
            try await ShopAndSaveItem.read(from: db,
                                    sqlWhere: "description LIKE ?", "%\(searchText)%")
        })
    }
    func removeRows(at offsets: IndexSet){
        
        Task{
            try await db!.transaction{ core in
                var idlist = ""
                for offset in offsets{
                    idlist += "\(todoItems.results[offset].id),"
                }
                print(idlist)
                idlist.removeLast()
                print(idlist)
                
                try core.query("DELETE FROM TodoItem Where id IN (?)",idlist)
            }
        }
    }
}

struct ShopAndSaveListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopAndSaveListView(filteredOn: "testing")
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
