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
}

struct ShopAndSaveListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopAndSaveListView()
    }
}
