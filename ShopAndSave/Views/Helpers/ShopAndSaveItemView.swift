//
//  ShopAndSaveItemView.swift
//  ShopAndSave
//
//  Created by Cyrus Chen on 1/6/2023.
//

import SwiftUI


struct ShopAndSaveItemView: View {
    
    let name: String
    let quantity: Int
    let price: Int
    let totalPrice: Int
   
    
   
    var body: some View {
        HStack(){

            Text(name)
                .font(.title3)
                .padding(.leading, 10)
                Spacer()
                
                
                
                        
            
         
           
            
            Text("\(quantity)")
                .font(.title3)
                .padding(.trailing,15)
                .minimumScaleFactor(0.6)
            Text("$\(price)")
                .font(.title3)
                .minimumScaleFactor(0.6)
                
                .padding(.trailing,15)
            Text("$\(totalPrice)")
                .font(.title3)
                .padding(.trailing, 15)
                .minimumScaleFactor(0.6)
            
        }
        .lineLimit(1)
        .minimumScaleFactor(0.6)
        
    }
}

struct ShopAndSaveItemView_Previews: PreviewProvider {
    static var previews: some View {
        ShopAndSaveItemView(name: "Banana", quantity: 2, price: 2, totalPrice: 4)
    }
}
