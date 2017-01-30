//
//  DetailsViewController.swift
//  ToDoApp
//
//  Created by Klaudia on 27.01.2017.
//  Copyright © 2017 Klaudia. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var priotityLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var updatedAtLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameLabel1: UILabel!
    
    @IBOutlet weak var noteLabel1: UILabel!
    
    @IBOutlet weak var priorityLabel1: UILabel!
    
    @IBOutlet weak var completedLabel1: UILabel!
    
    @IBOutlet weak var viewId: UIView!
    
    @IBOutlet weak var viewEmpty: UIView!
    
    var todo = [String: Any]()
    
    var taskID = "#"
    
    func wczytaj() {
        taskID = todo["_id"] as! String!
        idLabel.text = taskID
        nameLabel.text = todo["name"] as! String!
        noteLabel.text = todo["note"] as! String!
        completedLabel.text = todo["completed"] as! String!
        priotityLabel.text = todo["priority"] as! String!
        createdAtLabel.text = todo["createdAt"] as! String!
        updatedAtLabel.text = todo["updatedAt"] as! String!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wczytaj()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "EditTask" {
            if let editViewController = segue.destination as? EditViewController {
                
            editViewController.taskID = idLabel.text!
            editViewController.note = noteLabel.text!
            editViewController.name = nameLabel.text!
            editViewController.priority = priotityLabel.text!
            editViewController.completed = completedLabel.text!
                
            }
        }
    }
    
    func deleteTask() {
        let url:String = "https://secret-badlands-37403.herokuapp.com/api/todos/" + taskID
        
        let myUrl = URL(string: url)
        
        var request = URLRequest(url: myUrl!)
        request.httpMethod = "DELETE"
        
        
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
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        deleteTask()
        
        let myAlert = UIAlertController(title: "", message: "Deleted!", preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            action in self.performSegue(withIdentifier: "deletedTask", sender: self)
        })
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Style.loadTheme()
        
        self.view.backgroundColor = Style.backgroundColor
        self.navigationController?.navigationBar.barStyle = Style.barStyle
        self.navigationController?.navigationBar.tintColor = Style.navigationBarTintColor
        self.nameLabel.textColor = Style.textColor
        self.noteLabel.textColor = Style.textColor
        self.completedLabel.textColor = Style.textColor
        self.priotityLabel.textColor = Style.textColor
        self.nameLabel1.textColor = Style.textColor
        self.noteLabel1.textColor = Style.textColor
        self.completedLabel1.textColor = Style.textColor
        self.priorityLabel1.textColor = Style.textColor
        self.viewId.backgroundColor = Style.backgroundColor
        self.viewEmpty.backgroundColor = Style.backgroundColor
    }
}

