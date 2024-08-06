//
//  ContentView.swift
//  SKHelperDemo
//
//  Created by Russell Archer on 06/08/2024.
//

import SwiftUI
import SKHelper

struct ContentView: View {
    @Environment(SKHelper.self) private var store
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    StoreViewList()
                } label: {
                    Label("StoreView", systemImage: "storefront.circle")
                }
                
                NavigationLink {
                    SubStoreViewList()
                } label: {
                    Label("SubscriptionStoreView", systemImage: "storefront.circle.fill")
                }
                
                NavigationLink {
                    PurchasedProductsView()
                } label: {
                    Label("Purchased Products", systemImage: "square.and.pencil")
                }
            }
        }
    }
}

#Preview {
    ContentView().environment(SKHelper())
}
