//
//  CurrentEntitlementTestView.swift
//  SKHelperDemo
//
//  Created by Russell Archer on 04/09/2024.
//

import SwiftUI
import StoreKit
import SKHelper

struct CurrentEntitlementTestView: View {
    @Environment(SKHelper.self) private var store
    @State private var isPurchased = false
    let productId = "com.rarcher.nonconsumable.flowers.large"
    
    var body: some View {
        VStack {
            if isPurchased { Text("Enjoy the large flowers 🌺 😋") }
            else { Text("You have NOT purchased the large flowers 🙁") }
        }
        .currentEntitlementTask(for: productId) { state in
  
            if store.hasCurrentEntitlement(for: state.transaction) == .verifiedEntitlement {
                isPurchased = true
            }
        }
    }
}

#Preview {
    CurrentEntitlementTestView()
}
