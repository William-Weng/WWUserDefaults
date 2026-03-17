//
//  WWUserDefaults.swift
//  WWUserDefaults
//
//  Created by William.Weng on 2026/3/17.
//

import UIKit

// MARK: - [利用「屬性包裝器」做成UserDefaults加強版](https://medium.com/jeremy-xue-s-blog/swift-程式語言-property-wrappers-574e25cdcd44)
// [=> @WWUserDefault("KEY") static var userDefault: String?](https://ithelp.ithome.com.tw/articles/10223820)
@propertyWrapper
public struct WWUserDefaults<T> {
    
    let key: String
    
    /// 主要值：讀取 / 寫入 UserDefaults
    public var wrappedValue: T? {
        get { return UserDefaults.standard.object(forKey: key) as? T }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
    
    /// 投射值：檢查「是否存在有效值」
    public var projectedValue: Bool {
        UserDefaults.standard.object(forKey: key) != nil
    }
    
    /// 初始化
    /// - Parameter key: 要存入值的key值
    public init(_ key: String) { self.key = key }
}

/// WWUserDefaultsCodable：Codable 型別 Property Wrapper (用於 struct/class/enum（自動 JSON 編碼）)
/// => @WWUserDefault("User") static var user: User?
@propertyWrapper
public struct WWUserDefaultsCodable<T: Codable> {
    
    public let key: String
    
    /// 主要值：讀取 / 寫入 UserDefaults（JSON 編碼）
    public var wrappedValue: T? {
        get { getter() }
        set { setter(newValue) }
    }
    
    /// 投射值：檢查「是否存在有效值」
    public var projectedValue: Bool {
        UserDefaults.standard.object(forKey: key) != nil
    }
    
    /// 初始化
    /// - Parameter key: 要存入值的key值
    public init(_ key: String) { self.key = key }
}

/// MARK: - 小工具
private extension WWUserDefaultsCodable {
    
    /// 取值
    /// - Returns: T?
    func getter() -> T? {
        
        guard let data = UserDefaults.standard.data(forKey: key),
              let value = try? JSONDecoder().decode(T.self, from: data)
        else {
            return nil
        }
        
        return value
    }
    
    /// 存值
    /// - Parameter newValue: T?
    func setter(_ newValue: T?) {
        
        guard let newValue = newValue,
              let data = try? JSONEncoder().encode(newValue)
        else {
            UserDefaults.standard.removeObject(forKey: key); return
        }

        UserDefaults.standard.set(data, forKey: key)
    }
}
