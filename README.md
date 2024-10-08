# SKHelperDemo

![](./readme-assets/skhelper-demo.png)

- [SKHelper Documentation Landing Page](https://russell-archer.github.io/SKHelper/documentation/skhelper) - `SKHelper` documentation landing page
- [SKHelper Quick Start](https://russell-archer.github.io/SKHelper/tutorials/quickstart) - `SKHelper` quick-start guide 
- [SKHelper In-Depth Guide](https://russell-archer.github.io/SKHelper/documentation/skhelper/guide) - `SKHelper` and `StoreKit2` in-depth guide
- [SKHelper Demo Project](https://github.com/russell-archer/SKHelperDemo) - This example Xcode `SKHelper` project
    
---

## Overview of SKHelperDemo

`SKHelperDemo` is an Xcode 16 project that provides a bare-bones example of how to use the `SKHelper` package to create a
SwiftUI project that supports in-app purchases.

Refer to the [SKHelper Quick Start](https://russell-archer.github.io/SKHelper/tutorials/quickstart) for a step-by-step walk-through
of how to create a SwiftUI app that supports in-app purchases in the form of subscriptions and non-consumable products.

---

## Overview of SKHelper

`SKHelper` is a Swift Package Manager (SPM) package that enables developers using **Xcode 16** to easily add in-app purchase 
support to **iOS 16.4+** and **macOS 14.6+** SwiftUI apps. 

`SKHelper` provides the following features:

- Multi-platform (iOS, macOS) SwiftUI support for purchasing **Consumable** (not yet implemented), **Non-consumable** and **Subscription** products
- Makes use of Apple's **StoreKit Views** to provide a standard and easily customizable UI
- Designed to be **lightweight**, simple and an easier-to-use refactoring of the `StoreHelper` package
- Detailed **documentation** and an example project
- Supports **transaction validation**, **pending ("ask to buy") transactions**, **cancelled** and **failed** transactions
- Supports customer **refunds** and management of **subscriptions** (not yet implemented)
- Provides detailed **transaction information and history** for non-consumables and subscriptions (not yet implemented)
- Support for direct App Store purchases of **promoted in-app purchases** via Purchase Intents
- Supports Xcode 16's "complete" **Strict Concurrency Checking** 

## License

MIT license, copyright (c) 2024 Russell Archer. This software is provided "as-is" without warranty and may be freely used, copied, 
modified and redistributed, including as part of commercial software. 

See [License](https://russell-archer.github.io/SKHelper/documentation/skhelper/license) for details.

## Requirements

`SKHelper` uses the newest features of Apple's `StoreKit2` and which requires **iOS 16.4+**, **macOS 14.6+** and **Xcode 16**.

## Getting Started

Jump to the [SKHelper Quick Start](https://russell-archer.github.io/SKHelper/tutorials/quickstart) guide.
