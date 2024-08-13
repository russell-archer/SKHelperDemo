//
//  PurchasesView.swift
//  SKHelperDemo
//
//  Created by Russell Archer on 12/08/2024.
//

import SwiftUI
import StoreKit
import SKHelper

struct PurchasesView: View {
    @Environment(SKHelper.self) private var store
    @State private var purchasedProducts: [ProductId] = []
    @State private var selectedProductId = ""
    @State private var productSelected = false
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(purchasedProducts, id: \.self) { pid in
                    
                    ProductView(id: pid) {
                        Image(pid)
                            .resizable()
                            .clipShape(.circle)
                            .shadow(color: .secondary, radius: 5, x: 10, y: 10)
                            .scaledToFit()
                    }
                    .padding(.all, 10)
                    .productViewStyle(SKHelperCustomProductViewStyle( selectedProduct: $selectedProductId, productSelected: $productSelected))
                    Divider().padding()

                }
            }
        }
//        .storeProductsTask(for: purchasedProducts) { state in
//            // Get [Product] from the App Store
//            products = state.products
//        }
        
        .task { purchasedProducts = store.allPurchasedProductIds }
        .background(LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom))
        .sheet(isPresented: $productSelected) {
            
            ProductViewDetails(selectedProductId: $selectedProductId)
        }
    }
}

#Preview {
    PurchasesView()
        .environment(SKHelper())
}
