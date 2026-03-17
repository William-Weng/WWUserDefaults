//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2026/3/17.
//

import UIKit
import WWUserDefaults

final class ViewController: UIViewController {

    struct User: Codable {
        let id: UUID
        let name: String
        let settings: [String: Bool]
    }
    
    @WWUserDefaults("Password") var password: String?
    @WWUserDefaultsCodable("Current.User") var currentUser: User?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        valueTest()
        structTest()
    }
    
    func valueTest() {
        
        let urlString = "https://developer.apple.com/videos/play/wwdc2019/262/"
        let newValue = "https://www.appcoda.com.tw/app-security/"
        
        password = urlString
        print(password!)
        
        password = newValue
        print(password!)
        
        password = nil
        print($password)
    }
    
    func structTest() {
        
        let user = User(id: UUID(), name: "William", settings: ["darkMode": true])
        currentUser = user
        
        if let user = currentUser {
            print("ID: \(user.id)")
            print("Name: \(user.name)")
            print("Dark: \(user.settings)")
        }
        
        currentUser = nil
        print($currentUser)
    }
}
