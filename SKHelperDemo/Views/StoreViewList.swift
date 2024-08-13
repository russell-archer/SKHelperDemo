//
//  StoreViewList.swift
//  StoreKitViewsDemo
//
//  Created by Russell Archer on 13/02/2024.
//

import SwiftUI
import StoreKit
import SKHelper

struct StoreViewList: View {
    @Environment(SKHelper.self) private var store
    @State private var selectedProductId = ""
    @State private var productSelected = false
    
    var body: some View {
        StoreView(ids: store.allProductIds) { product in
            VStack {
                Image(product.id)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.circle)
                    .onTapGesture {
                        selectedProductId = product.id
                        productSelected.toggle()
                    }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom))
        .productViewStyle(.automatic)
        .storeButton(.visible, for: .restorePurchases, .policies)
        .storeButton(.hidden, for: .cancellation)  // Hides the close "X" at the top-right of the view
        .sheet(isPresented: $productSelected) {
            ProductViewDetails(selectedProductId: $selectedProductId)
        }
    }
}

#Preview {
    StoreViewList().environment(SKHelper())
}
