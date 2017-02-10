//
//  LoginViewController.swift
//  ToDoApp
//
//  Created by Klaudia on 09.02.2017.
//  Copyright © 2017 Klaudia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url:String = "https://magic-todo.herokuapp.com/api/todos/"
        defaults.set(url, forKey: "url")
        loginField.text = defaults.value(forKey: "login") as! String?
    }

    @IBAction func checkLoginField(_ sender: UITextField) {
        defaults.set(loginField.text, forKey: "login")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func style() {
        self.view.backgroundColor = Style.backgroundColor
    }
    override func viewWillLayoutSubviews() {
        Style.loadTheme()
        
        style()
    }

}
