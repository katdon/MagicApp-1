//
//  ViewController.swift
//  ToDoApp
//
//  Created by Klaudia on 27.01.2017.
//  Copyright © 2017 Klaudia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InitialNavigationViewController") as UIViewController
    
    @IBAction func logOutAction(_ sender: UIButton) {
        self.show(vc, sender: self)
    }
    
    override func viewDidLoad() {
        let defaults = UserDefaults.standard
        super.viewDidLoad()
         let login = defaults.value(forKey: "login") as! String
        
        print("SIemkaaa  " + login)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        Style.loadTheme()
        
        self.view.backgroundColor = Style.backgroundColor
        self.navigationController?.navigationBar.barStyle = Style.barStyle
        self.navigationController?.navigationBar.tintColor = Style.navigationBarTintColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Style.navigationBarTitleColor]
        self.navigationController?.navigationBar.barTintColor = Style.navigationBarColor
    }

}

