//
//  PurchasedProductsView.swift
//  StoreKitViewsDemo
//
//  Created by Russell Archer on 14/07/2024.
//

import SwiftUI
import StoreKit
import SKHelper

struct PurchasedProductsView: View {
    @Environment(SKHelper.self) private var store
    @State private var purchasedProducts: [String] = []
    
    var body: some View {
        VStack {
            List(store.products) { product in
                if purchasedProducts.contains(product.id) {
                    Text("Purchased: \(product.id)")
                } else {
                    Text("Not Purchased: \(product.id)")
                }
            }
        }
        .task {
            for product in store.products {
                if let purchased = try? await store.isPurchased(productId: product.id), purchased {
                    purchasedProducts.append(product.id)
                }
            }
        }
    }
}

#Preview {
    PurchasedProductsView().environment(SKHelper())
}
