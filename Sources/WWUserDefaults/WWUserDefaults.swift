import UIKit

// MARK: - [利用「屬性包裝器」做成UserDefaults加強版](https://medium.com/jeremy-xue-s-blog/swift-程式語言-property-wrappers-574e25cdcd44)
// [=> @WWUserDefault("KEY") static var userDefault: String?](https://ithelp.ithome.com.tw/articles/10223820)
@propertyWrapper
public struct WWUserDefault<T> {
    
    let key: String
    
    public var wrappedValue: T? {
        get { return UserDefaults.standard.object(forKey: key) as? T }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
    
    /// 初始化
    /// - Parameter key: 要存入值的key值
    public init(_ key: String) { self.key = key }
}
