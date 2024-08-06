//
//  SubStoreViewList.swift
//  StoreKitViewsDemo
//
//  Created by Russell Archer on 13/02/2024.
//

import SwiftUI
import StoreKit
import SKHelper

struct SubStoreViewList: View {
    @Environment(SKHelper.self) private var store
    
    var body: some View {
        SubscriptionStoreView(productIDs: store.allSubscriptionProductIdsByLevel(for: "vip"))
            .subscriptionStoreButtonLabel(.action)
            .subscriptionStoreControlStyle(.prominentPicker)
            #if os(iOS)
            .storeButton(.visible, for: .restorePurchases, .redeemCode)
            #elseif os(macOS)
            .storeButton(.visible, for: .restorePurchases)
            #endif
            .subscriptionStoreControlIcon { subscription, info in
                Image(subscription.id)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
    }
}

#Preview {
    SubStoreViewList().environment(SKHelper())
}
