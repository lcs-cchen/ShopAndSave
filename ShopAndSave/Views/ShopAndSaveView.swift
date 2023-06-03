//
//  ShopAndSaveView.swift
//  ShopAndSave
//
//  Created by Cyrus Chen on 1/6/2023.
//
import Blackbird
import SwiftUI

struct ShopAndSaveView: View {
    
    @State var initialBudget = ""
    
    @State var searchText = ""
    
    @State var showingAddItemView = false
    
    @Environment(\.blackbirdDatabase) var db:Blackbird.Database?
    
    @BlackbirdLiveModels var ShopAndSaveItems: Blackbird.LiveResults<ShopAndSaveItem>
    
    @BlackbirdLiveModels({db in
        try await ShopAndSaveItem.read(from: db)
    }) var ShopAndSaves
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 20.0){
                HStack{
                    Text("Overall Budget :")
                        .font(.title2)
                        
                        
                    
                    TextField("Add Budget . . .", text: $initialBudget)
                        .textFieldStyle(.roundedBorder)
                        .font(.body)
                       
                }
                .padding(.top)
                HStack(spacing: 20){
                    Text("Groceries")
                        .font(.title)
                    
                    TextField("Search . . .                       \(Image(systemName: "magnifyingglass"))", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                        .font(.body)
                    
                }
                .padding(.bottom,-20)
               
                
                
                .font(.caption)
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
                .cornerRadius(20)
                .listStyle(.plain)
                ZStack{
                    Rectangle()
                        .frame(width:360, height: 100)
                        .cornerRadius(20)
                        .foregroundColor(.gray)
                    VStack{
                        Text("Budget left: $40")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal,20)
            .navigationTitle("Shopping Calculator")
            .toolbar{
                ToolbarItem(placement: .primaryAction){
                    Button(action: {
                        showingAddItemView = true
                    }, label:{ Image(systemName: "plus")})
                    .sheet(isPresented: $showingAddItemView){
                        AddItemView()
                            .presentationDetents([.fraction(0.3)])
                    }
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

struct ShopAndSaveView_Previews: PreviewProvider {
    static var previews: some View {
        ShopAndSaveView(filteredOn: "Banana")
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
