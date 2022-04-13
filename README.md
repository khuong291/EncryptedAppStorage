# 🥷❌ EncryptedAppStorage
> @AppStorage is built on top of UserDefaults, which is not secure storage. Which mean, you should not save your sensitive data using @AppStorage, because it’s easy for hacker to attack. Which @EncryptedAppStorage, your sensitive data will be saved in KeyChain. Once stored in Keychain this information is only available to your app, other apps can't see it. Besides that, operating system makes sure this information is kept and processed securely.

[![Twitter](https://img.shields.io/badge/contact-%40khuong291-blue)](http://twitter.com/khuong291)
[![Swift](https://img.shields.io/badge/swift-5-orange)](https://swift.org)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager)

## Usage

@EncryptedAppStorage can work with any types of value. If you assign the default value, then that value will be stored in KeyChain if it has no value there.

```swift
@EncryptedAppStorage(<#StoreKey#>)
var sensitiveString = "Sensitive String"
```

```swift
@EncryptedAppStorage(<#StoreKey#>)
var sensitiveInt = 100
```

```swift

struct MyObject: Codable {
    var name: String
}

@EncryptedAppStorage(<#StoreKey#>)
var myObject: MyObject? = nil
```

## 🛠 Compatibility

- macOS 11.0+
- iOS 14.0+
- iPadOS 14.0+
- tvOS 14.0+
- watchOS 7.0+

## ⚙️ Installation

#### Only available with [Swift Package Manager](https://github.com/apple/swift-package-manager)

## 🍻 PRs are welcome

## 👨‍💻 Author

Khuong – [@khuong291](https://twitter.com/khuong291)
