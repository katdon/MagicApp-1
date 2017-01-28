//
//  AddViewController.swift
//  ToDoApp
//
//  Created by Klaudia on 28.01.2017.
//  Copyright © 2017 Klaudia. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func addNewTask(_ sender: Any) {
        let myAlert = UIAlertController(title: "Alert", message: "Are you sure?", preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
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
