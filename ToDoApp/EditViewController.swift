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
    
    func editTask() {
        let url:String = "https://secret-badlands-37403.herokuapp.com/api/todos/" + taskID
        print(taskID)
        
        let myUrl = URL(string: url)
        
        var request = URLRequest(url: myUrl!)
        request.httpMethod = "PUT"
        
        let completed = String(Int(completedValue.value))
        
        guard let name = nameField.text,
            let note = noteField.text,
            let priority = priorityField.text
            else {
                print("Guard is coming..")
                return
        }
        
        let mapDict = ["note" : "First", "completed" : "Second"]
        let json = [ "name" : name, "note" : note, "completed" : completed, "priority" : priority, "dict" : mapDict] as [String : Any]
        
        let postString = try! JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        
        request.httpBody = postString
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            print("response = \(response)")
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                if let parseJSON = json {
                    let message = parseJSON["message"] as? String
                    print("message: \(message)")
                    
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    @IBAction func editButtontapped(_ sender: Any) {
        
        editTask()
        
        let myAlert = UIAlertController(title: "", message: "Edited!", preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            action in self.performSegue(withIdentifier: "backEdit", sender: self)
        })
        
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Style.loadTheme()
        
        self.view.backgroundColor = Style.backgroundColor
        self.navigationController?.navigationBar.barStyle = Style.barStyle
        self.navigationController?.navigationBar.tintColor = Style.navigationBarTintColor
    }

}


