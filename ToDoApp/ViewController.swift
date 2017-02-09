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
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    }

}

