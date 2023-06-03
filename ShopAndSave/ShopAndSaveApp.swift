//
//  ShopAndSaveApp.swift
//  ShopAndSave
//
//  Created by Cyrus Chen on 1/6/2023.
//

import SwiftUI

@main
struct ShopAndSaveApp: App {
    var body: some Scene {
        WindowGroup {
            ShopAndSaveView(filteredOn: "banana")
        }
    }
}
