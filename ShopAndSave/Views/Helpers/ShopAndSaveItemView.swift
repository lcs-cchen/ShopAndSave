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
                .padding(.leading, 10)
                
                Spacer()
                
                
                
                        
            
         
           
            
            Text("\(quantity)")
                .frame(width: 20)
                .minimumScaleFactor(0.6)
                .padding(.trailing,20)
            Text("$\(price)")
                .frame(width: 30)
                .minimumScaleFactor(0.6)
                .padding(.trailing,20)
                
            
            Text("$\(totalPrice)")
                .frame(width: 30)
                .minimumScaleFactor(0.6)
                .padding(.trailing, 10)
            
        }
        .font(Font.custom("Futura", size: 20 ))
        .multilineTextAlignment(.center)
        .lineLimit(1)
        .minimumScaleFactor(0.6)
        .font(.title3)
    }
}

struct ShopAndSaveItemView_Previews: PreviewProvider {
    static var previews: some View {
        ShopAndSaveItemView(name: "Banana", quantity: 2, price: 2, totalPrice: 4)
    }
}
