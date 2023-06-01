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
        HStack(spacing: 40){
            Text(name)
                
            Spacer()
            
            Text("\(quantity)")
                
            
            Text("$\(price)")
        }
        .font(.title)
    }
}

struct ShopAndSaveItemView_Previews: PreviewProvider {
    static var previews: some View {
        ShopAndSaveItemView(name: "Apple", quantity: 2, price: 2)
    }
}
