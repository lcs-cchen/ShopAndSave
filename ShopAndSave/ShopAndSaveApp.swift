//
//  ShopAndSaveApp.swift
//  ShopAndSave
//
//  Created by Cyrus Chen on 1/6/2023.
//
import Blackbird
import SwiftUI

@main
struct ShopAndSaveApp: App {
    
    var body: some Scene {
        WindowGroup {
            ShopAndSaveView()
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
