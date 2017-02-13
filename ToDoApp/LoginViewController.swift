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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        style()
    }

    @IBAction func checkLoginField(_ sender: UITextField) {
        defaults.set(loginField.text, forKey: "login")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func style() {
        Style.loadTheme()
        self.view.backgroundColor = Style.backgroundColor
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        if let ident = identifier {
            if ident == "login" {
                if (loginField.text == "") {
                    print("Fail login")
                    
                    let emptyLoginAlert = UIAlertController(title: "Fail login", message: "You have to fill the field!", preferredStyle: .actionSheet)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    
                    emptyLoginAlert.addAction(okAction)
                    
                    self.present(emptyLoginAlert, animated: true, completion: nil)
                    
                    return false
                } else if (loginField.text!.characters.count < 3) {
                    print("Fail login")
                    
                    let shortLoginAlert = UIAlertController(title: "Too short login", message: "Please make sure that your login has a minimum of 3 characters.", preferredStyle: .actionSheet)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    
                    shortLoginAlert.addAction(okAction)
                    
                    self.present(shortLoginAlert, animated: true, completion: nil)
                    
                    return false
                }
                else {
                    
                    return true
                }
            }
        }
        return true
    }
    
    /*
    // MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func viewWillLayoutSubviews() {
        style()
    }

}
