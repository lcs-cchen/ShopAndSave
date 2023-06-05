//
//  ShopAndSaveItem.swift
//  ShopAndSave
//
//  Created by Cyrus Chen on 3/6/2023.
//
import Blackbird
import Foundation

struct ShopAndSaveItem: BlackbirdModel {
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var name: String
    @BlackbirdColumn var quantity: Int
    @BlackbirdColumn var price: Int
    @BlackbirdColumn var totalPrice: Int
    @BlackbirdColumn var ticked: Bool
}
