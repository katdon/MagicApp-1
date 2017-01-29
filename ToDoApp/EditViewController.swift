//
//  EditViewController.swift
//  ToDoApp
//
//  Created by Klaudia on 29.01.2017.
//  Copyright © 2017 Klaudia. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var priorityField: UITextField!
    @IBOutlet weak var completedValue: UISlider!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var noteField: UITextField!

    
    var taskID: String = "#"
    var name: String = ""
    var note: String = ""
    var priority: String = "0"
    var completed: String = "0"
    
    @IBAction func changeValueSlider(_ sender: UISlider) {
       completedLabel.text = "\(Int(sender.value)) %"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        idLabel.text = "TaskID: \(taskID)"
        priorityField.text = priority
        noteField.text = note
        nameField.text = name
        completedLabel.text = "\(completed) %"
        completedValue.value = Float(completed)!
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

}


