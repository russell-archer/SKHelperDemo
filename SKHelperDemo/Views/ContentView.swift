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
                    SKStoreView()
                } label: {
                    VStack(alignment: .leading) {
                        Label("SKStoreView", systemImage: "storefront").font(.headline)
                        Text("Lists all available products for this app.\n\nProducts that have been purchased will be grayed-out. Tapping on the product's image shows details for the product.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .padding(.top, 5)
                    }
                }
                
                NavigationLink {
                    SKSubscriptionStoreView()
                } label: {
                    VStack(alignment: .leading) {
                        Label("SKSubscriptionStoreView", systemImage: "cart.fill").font(.headline)
                        Text("Lists all subscription products for this app.\n\nTrials, upgrades and downgrades are handled automatically.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .padding(.top, 5)
                    }
                }
                
                NavigationLink {
                    SKPurchasesView()
                } label: {
                    VStack(alignment: .leading) {
                        Label("SKPurchasesView", systemImage: "purchased").font(.headline)
                        Text("Lists all products that have been purchased, including subscriptions.\n\nDetails of the purchase or subscription can be displayed if the \"Manage Purchase\" button is tapped.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .padding(.top, 5)
                    }
                }
                
                NavigationLink {
                    PurchaseTestView()
                } label: {
                    VStack(alignment: .leading) {
                        Label("PurchaseTestView", systemImage: "purchased").font(.headline)
                        Text("A simple purchase test using the SwiftUI-specific PurchaseAction.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .padding(.top, 5)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView().environment(SKHelper())
}
