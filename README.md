# WWUserDefaults

[![Swift-5.7](https://img.shields.io/badge/Swift-5.7-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-14.0](https://img.shields.io/badge/iOS-14.0-pink.svg?style=flat)](https://developer.apple.com/swift/) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/) ![](https://img.shields.io/github/v/tag/William-Weng/WWUserDefaults)

Use the "property wrapper" to make an enhanced version of UserDefaults.

利用「屬性包裝器」做成UserDefaults加強版。

![WWUserDefaults](./Example.png)

### [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)
```swift
dependencies: [
    .package(url: "https://github.com/William-Weng/WWUserDefaults.git", .upToNextMajor(from: "1.0.0"))
]
```

### Example
```swift
import UIKit
import WWPrint
import WWUserDefaults

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaultsTest()
    }
    
    /// WWUserDefaults測試
    func userDefaultsTest() {
        
        let urlString = "https://developer.apple.com/videos/play/wwdc2019/262/"
        let newValue = "https://www.appcoda.com.tw/app-security/"
        
        @WWUserDefaults("PASSWORD") var password: String?
        
        password = urlString
        wwPrint(password)
        
        password = newValue
        wwPrint(password)
        
        password = nil
        wwPrint(password)
    }
}
```
