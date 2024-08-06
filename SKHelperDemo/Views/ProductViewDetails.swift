//
//  ProductViewDetails.swift
//  StoreKitViewsDemo
//
//  Created by Russell Archer on 13/02/2024.
//

import SwiftUI
import StoreKit

struct ProductViewDetails: View {
    @Binding var selectedProductId: String
    
    var body: some View {
        ProductView(id: selectedProductId) {
            Image(selectedProductId)
                .resizable()
                .cornerRadius(15)
                .aspectRatio(contentMode: .fit)
            
            Text("Here's some details about why you should buy this product...")
        }
        .padding()
        .productViewStyle(.large)
    }
}

