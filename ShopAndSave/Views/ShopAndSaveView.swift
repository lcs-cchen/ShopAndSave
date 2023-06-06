//
//  ShopAndSaveView.swift
//  ShopAndSave
//
//  Created by Cyrus Chen on 1/6/2023.
//
import Blackbird
import SwiftUI

struct ShopAndSaveView: View {
    
    @Environment(\.blackbirdDatabase) var db:Blackbird.Database?
    
    @State var initialBudget = ""
    
    @State var searchText = ""
    
    @State var showingAddItemView = false
    
    
    

    
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
                        
                    }
                    .padding(.bottom,-20)
                    
                
                
                .font(.caption)
                ShopAndSaveListView(filteredOn: searchText)
                .searchable(text: $searchText)
                
    
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
 


}

struct ShopAndSaveView_Previews: PreviewProvider {
    static var previews: some View {
        ShopAndSaveView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
