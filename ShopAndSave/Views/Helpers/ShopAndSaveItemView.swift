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
    
    var body: some View {
        HStack(){

            Text(name)
                .font(.title3)
                .padding(.leading, 10)
                .minimumScaleFactor(0.5)
                
            Spacer()
            
            
            
           
            
            Text("\(quantity)")
                .font(.title3)
            Spacer()
            Text("$\(price)")
                .font(.title3)
                .padding(.trailing, 10)
            
        }
        
    }
}

struct ShopAndSaveItemView_Previews: PreviewProvider {
    static var previews: some View {
        ShopAndSaveItemView(name: "Banana", quantity: 2, price: 2)
    }
}
