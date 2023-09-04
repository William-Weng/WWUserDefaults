//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2022/12/15.
//  ~/Library/Caches/org.swift.swiftpm/
//  file:///Users/william/Desktop/WWCropViewController

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
