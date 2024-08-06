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
                    .cornerRadius(15)
                    .aspectRatio(contentMode: .fit)
                
                Button(action: {
                    selectedProductId = product.id
                    productSelected.toggle()
                    
                }, label: {
                    HStack {
                        Image(systemName: "info.circle")
                        Text("More info")
                    }
                })
            }
        }
        .productViewStyle(.large)
        .storeButton(.visible, for: .restorePurchases)
        .storeButton(.hidden, for: .cancellation)  // Hides the close "X" at the top-right of the view
        .sheet(isPresented: $productSelected) {
            ProductViewDetails(selectedProductId: $selectedProductId)
        }
    }
}

#Preview {
    StoreViewList().environment(SKHelper())
}
