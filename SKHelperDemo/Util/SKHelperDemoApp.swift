//
//  SKHelperDemoApp.swift
//  SKHelperDemo
//
//  Created by Russell Archer on 06/08/2024.
//

import SwiftUI
import SKHelper

@main
struct SKHelperDemoApp: App {
    @State private var store = SKHelper()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(store)
        }
    }
}
