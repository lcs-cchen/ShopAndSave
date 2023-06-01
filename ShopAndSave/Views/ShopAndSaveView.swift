//
//  ShopAndSaveView.swift
//  ShopAndSave
//
//  Created by Cyrus Chen on 1/6/2023.
//

import SwiftUI

struct ShopAndSaveView: View {
    
    @State var initialBudget = ""
    
    @State var searchBar = ""
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 20.0){
                HStack{
                    Text("Overall Budget :")
                        .font(.title2)
                        
                        
                    
                    TextField("Add Budget . . .", text: $initialBudget)
                        .textFieldStyle(.roundedBorder)
                       
                }
                .padding(.top)
                HStack(spacing: 20){
                    Text("Groceries")
                        .font(.title)
                    
                    TextField("Search . . .                      \(Image(systemName: "magnifyingglass"))", text: $searchBar)
                        .textFieldStyle(.roundedBorder)
                    
                }
                HStack{
                    Spacer()
                    Text("Items")
                    Spacer(minLength: 100)
                    Text("Quantity")
                    Spacer()
                    Text("Price")
                    Spacer()
                }
                
                .padding(.bottom,-40)
                .font(.caption)
                List{
                    
                    ShopAndSaveItemView(name: "Apple", quantity: 2, price: 2)
                        
                    ShopAndSaveItemView(name: "Apple", quantity: 2, price: 2)
                    ShopAndSaveItemView(name: "Apple", quantity: 2, price: 2)
                    ShopAndSaveItemView(name: "Apple", quantity: 2, price: 2)
                    
                }
                .cornerRadius(20)
                ZStack{
                    Rectangle()
                        .frame(width:360, height: 100)
                        .cornerRadius(20)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding(.horizontal,20)
            .navigationTitle("Shopping Calculator")
        }
        
    }
}

struct ShopAndSaveView_Previews: PreviewProvider {
    static var previews: some View {
        ShopAndSaveView()
    }
}
