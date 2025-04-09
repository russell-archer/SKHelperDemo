import SwiftUI
import SKHelper

struct ContentView: View {
    @Environment(SKHelper.self) private var store
    
    var body: some View {
        VStack {
            
            SKHelperStoreView(allowManagement: true) { productId in
                VStack {
                    Image("\(productId).info").resizable().scaledToFit()
                    Text("Here is some text about why you might want to buy this product.")
                }
                .padding()
            }
            
            Spacer()
            Button("Clear cached entitlements") { store.clearCachedEntitlements() }.font(.caption).padding()
        }
    }
    
}

#Preview { ContentView().environment(SKHelper()) }

