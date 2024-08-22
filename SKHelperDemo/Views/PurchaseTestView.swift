//
//  PurchaseTestView.swift
//  SKHelperDemo
//
//  Created by Russell Archer on 20/08/2024.
//

import SwiftUI
import StoreKit
import SKHelper

struct PurchaseTestView: View {
    @Environment(\.purchase) private var purchase: PurchaseAction  // Get a `PurchaseAction` instance for this Environment
    @Environment(SKHelper.self) private var store
    
    var body: some View {
        let purchaseAction = purchase
        // This fixes a bug in Xcode 16. Without copying the PurchaseAction you get an error:
        // "Sending main actor-isolated value of type 'PurchaseAction' with later accesses to nonisolated context
        // risks causing data races; this is an error in the Swift 6 language mode"
        
        if let product = store.product(from: "com.rarcher.nonconsumable.flowers.large") {
            Text("Purchase \(product.displayName)")

            Button {
                Task {
                    let purchaseResult = try? await purchaseAction(product, options: [])
                    
                    // Process the purchase by checking and finishing the transaction and updating our purchased products cache
                    let verifiedResult = await store.purchaseCompletion(for: product, with: purchaseResult)
                    if verifiedResult.purchaseState == .purchased {
                        print("You now have access to \(product.id)")
                    }
                }
            } label: {
                Text(product.displayPrice)
            }
        }
    }
}
