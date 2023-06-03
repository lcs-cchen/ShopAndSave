//
//  ShopAndSaveView.swift
//  ShopAndSave
//
//  Created by Cyrus Chen on 1/6/2023.
//

import SwiftUI

struct ShopAndSaveView: View {
    
    @State var initialBudget = ""
    
    @State var searchText = ""
    
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
                ShopAndSaveListView()
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
        }
        
    }
}

struct ShopAndSaveView_Previews: PreviewProvider {
    static var previews: some View {
        ShopAndSaveView()
    }
}
