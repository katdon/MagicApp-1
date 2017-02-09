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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        if (loginField.text == "") {
            
            let myInfoAlert = UIAlertController(title: "", message: "All fields must be filled out!", preferredStyle: .actionSheet)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            myInfoAlert.addAction(okAction)
            
            self.present(myInfoAlert, animated: true, completion: nil)
            
            
        } else {
            
            let myAlert = UIAlertController(title: "", message: "Successful log on!", preferredStyle: .actionSheet)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated: true, completion: nil)
            
            
        }
        
        

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
