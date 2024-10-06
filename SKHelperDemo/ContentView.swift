//
//  ContentView.swift
//  SKHelperDemo
//

import SwiftUI
import SKHelper

struct ContentView: View {
    @Environment(SKHelper.self) private var store
    
    var body: some View {
        NavigationStack {
            List {
                // SKHelperStoreView() lists all available products for this app.
                // Products that have been purchased will be grayed-out.
                // Tapping on the product's image shows details for the product.
                NavigationLink("List all products") {
                    SKHelperStoreView() { productId in
                        Group {
                            Image(productId + ".info").resizable().scaledToFit()
                            Text("Here is some text about why you might want to buy this product.")
                        }
                        .padding()
                    }
                }
                
                // SKHelperSubscriptionStoreView() lists all subscription products for this app.
                // Trials, upgrades and downgrades are handled automatically.
                NavigationLink("List all subscriptions") {
                    SKHelperSubscriptionStoreView(
                        subscriptionHeader: {
                            VStack {
                                Image("plant-services").resizable().scaledToFit()
                                Text("Services to make your plants happy!").font(.headline)
                            }
                        },
                        subscriptionControl: { productId in
                            VStack {
                                Image(productId).resizable().scaledToFit()
                                Text("We'll visit \(productId == "com.rarcher.subscription.vip.gold" ? "weekly" : "monthly") to water your plants.").font(.caption2)
                            }
                        },
                        subscriptionDetails: { productId in
                            VStack {
                                Image(productId + ".info").resizable().scaledToFit()
                                Text("Here is some text about why you might want to buy this product.")
                            }
                        })
                    .onSubscriptionChange() { productId, transactionId, renewalState, hasExpired  in
                        print("The status of subscription \(productId) changed to \(renewalState.localizedDescription)")
                    }
                }
                
                // Show all purchases the user has made.
                NavigationLink("List all purchases") {
                    SKHelperPurchasesView()
                }
                
                // Show the small flowers purchase-related view
                NavigationLink("Access Small Flowers") {
                    SmallFlowersView()
                }
            }
        }
        
        Spacer()
        Button("Clear cached entitlements") { store.clearCachedEntitlements() }.font(.caption).padding()
    }
}

#Preview {
    ContentView().environment(SKHelper())
}
