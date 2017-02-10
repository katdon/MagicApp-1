//
//  SettingsViewController.swift
//  ToDoApp
//
//  Created by Katarzyna Donaj on 25/01/2017.
//  Copyright © 2017 Katarzyna Donaj. All rights reserved.
//

import UIKit

class SettingsViewController : UIViewController {
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    @IBOutlet weak var darkModeLabel: UILabel!
    
    @IBOutlet weak var authors: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var smallView: UIView!
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        darkModeSwitch.addTarget(self, action: #selector(SettingsViewController.switchChanged), for: UIControlEvents.valueChanged)
        
        if let name = defaults.string(forKey: "Theme") {
            if name == "White Mode" { darkModeSwitch.isOn = false }
            if name == "Dark Mode"  { darkModeSwitch.isOn = true  }
        } else {
            defaults.set("White Mode", forKey: "Theme")
            darkModeSwitch.isOn = false
        }
    }
    
    func switchChanged() {
        let value = darkModeSwitch.isOn
        
        switch(value) {
        case true:
            defaults.set("Dark Mode", forKey: "Theme")
        case false:
            defaults.set("White Mode", forKey: "Theme")
        }
        
        Style.loadTheme()
        style()
        
        
    }
    
    func style() {
        self.view.backgroundColor = Style.backgroundColor
        self.darkModeLabel.textColor = Style.textColor
        self.authors.textColor = Style.textColor
        self.stackView.backgroundColor = Style.backgroundColor
        self.smallView.backgroundColor = Style.backgroundColor
        self.navigationController?.navigationBar.barStyle = Style.barStyle
        self.navigationController?.navigationBar.tintColor = Style.navigationBarTintColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Style.navigationBarTitleColor]
        self.navigationController?.navigationBar.barTintColor = Style.navigationBarColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Style.loadTheme()
        
        style()
    }
    
}
