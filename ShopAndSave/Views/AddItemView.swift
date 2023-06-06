//
//  AddItemView.swift
//  ShopAndSave
//
//  Created by Cyrus Chen on 3/6/2023.
//
import Blackbird
import SwiftUI

struct AddItemView: View {
    
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    @State var name = ""
    @State var quantity = ""
    @State var price = ""
    
    var quantityAsInt: Int {
        guard let unwrapped = Int(quantity) else {
            return 0
        }
        
        return unwrapped
    }
    var priceAsInt: Int {
        guard let unwrapped = Int(price) else {
            return 0
        }
        
        return unwrapped
    }
    
    var totalPrice: Int{
        quantityAsInt * priceAsInt
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter the item name", text: $name)
                    .textFieldStyle(.roundedBorder)
                TextField("Enter the item quantity", text: $quantity)
                    .textFieldStyle(.roundedBorder)
                TextField("Enter the item price", text: $price)
                    .textFieldStyle(.roundedBorder)
                Spacer()
            }
            .padding(5)
            .toolbar{
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                      AddItem()
                    }, label:{ Text("Add")
                        
                    })
                }
            }
        }
    }
    func AddItem() {
        Task{
            try await db!.transaction {
                core in
                try core.query("""
INSERT INTO ShopAndSaveItem(
name,
quantity,
price,
totalPrice

)
VALUES (
?,
?,
?,
?
)
""",
                name,
                quantity,
                price,
                totalPrice
              
                               
                )
            }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
