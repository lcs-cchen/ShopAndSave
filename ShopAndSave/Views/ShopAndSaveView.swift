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
    
    
    @BlackbirdLiveModels({db in
        try await ShopAndSaveItem.read(from: db)
    }) var ShopAndSaveItems
    //"select sum(?) FROM ShopAndSaveItem", "\(totalPrice)"
    
    var initialBudgetAsInt: Int {
        guard let unwrapped = Int(initialBudget) else {
            return 0
        }
        
        return unwrapped
    }
    
    
    var budgetLeft: Int{
        
        let BudgetLeft = initialBudgetAsInt-calculateTotal()
        return BudgetLeft
    }
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 15.0){
                
                    HStack{
                        Text("Overall Budget :")
                            .font(Font.custom("Futura", size: 20 ))
                            .font(.title2)
                        
                        
                        
                        TextField("Add Budget . . .", text: $initialBudget)
                            .textFieldStyle(.roundedBorder)
                            .font(.body)
                        
                    }
                    
                    HStack(spacing: 20){
                        Text("Groceries")
                            .font(Font.custom("Futura", size: 30 ))
                            
                            .bold()
                        
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
                        .foregroundColor(Color("Color"))
                    VStack{
                        Text("Budget lef\(budgetLeft)")
                            .font(Font.custom("Futura", size: 40 ))
                            .lineLimit(1)
                            .minimumScaleFactor(0.7)
                            .bold()
                    }
                }
                
                Spacer()
            }
            
            .padding(.horizontal,20)
            .navigationTitle(Text("Shopping Calculator"))
            
           
            
            
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
 
    func calculateTotal() -> Int {
        var total = 0
        for currentItem in ShopAndSaveItems.results {
            if currentItem.ticked {
                total += currentItem.totalPrice
            }
        }
        return total
    }
    

}

struct ShopAndSaveView_Previews: PreviewProvider {
    static var previews: some View {
        ShopAndSaveView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
