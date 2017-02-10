//
//  Style.swift
//  ToDoApp
//
//  Created by Katarzyna Donaj on 28.01.2017.
//  Copyright © 2017 Katarzyna Donaj. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

struct Style{
    
    static var backgroundColor = UIColor.white
    static var barStyle = UIBarStyle.default
    static var textColor = UIColor.black
    
    static var tableViewCellBackgroundColor = UIColor.white
    static var contentViewBackgroundColor = UIColor.white
    
    static var valueTextColor = UIColor.darkGray
    
    static var navigationBarTintColor = UIColor.init(netHex: 0x007AFF)//przyciski
    
    static var toolBarBarStyle = UIBarStyle.blackTranslucent
    static var toolBarTintColor = UIColor.white
    static var toolBarBackgroundColor = UIColor.black
    
    static var pickerBackgroundColor = UIColor.groupTableViewBackground
    
    static var navigationBarTitleColor = UIColor.init(netHex: 0x0064ee) //naglowek
    static var navigationBarColor = UIColor.init(netHex: 0x0064ee) //tlo
    
    static func whiteMode() {
        backgroundColor = UIColor.white
        barStyle = UIBarStyle.black
        textColor = UIColor.black
        tableViewCellBackgroundColor = UIColor.white
        contentViewBackgroundColor = UIColor.white
        navigationBarTintColor = UIColor.init(netHex: 0x007AFF)
        toolBarBarStyle = UIBarStyle.blackTranslucent
        toolBarTintColor = UIColor.white
        toolBarBackgroundColor = UIColor.black
        pickerBackgroundColor = UIColor.groupTableViewBackground
        navigationBarTitleColor = UIColor.init(netHex: 0x0064ee)
        navigationBarColor = UIColor.init(netHex: 0xb1ebf0)
    }
    
    static func darkMode() {
        backgroundColor = UIColor.init(netHex: 0x0D0D0D)
        barStyle = UIBarStyle.black
        textColor = UIColor.white
        tableViewCellBackgroundColor = UIColor.init(netHex: 0x171717)
        contentViewBackgroundColor = UIColor.init(netHex: 0x171717)
        navigationBarTintColor = UIColor.init(netHex: 0xFF9500)
        toolBarBarStyle = UIBarStyle.default
        toolBarTintColor = UIColor.black
        toolBarBackgroundColor = UIColor.white
        pickerBackgroundColor = UIColor.white
        navigationBarTitleColor = UIColor.orange
        navigationBarColor = UIColor.init(netHex: 0x000004)
    }
    
    
    static func loadTheme() {
        let defaults = UserDefaults.standard
        
        if let name = defaults.string(forKey: "Theme") {
            if name == "White Mode" { whiteMode() }
            if name == "Dark Mode"  { darkMode()  }
        } else {
            defaults.set("White Mode", forKey: "Theme")
            whiteMode()
        }
    }
}

