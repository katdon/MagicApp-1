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
    
    @IBOutlet weak var edit: UIButton!
    
    var todo = [String: Any]()
    
    var taskID: String = "#"
    
    func getTask() {
        let defaults = UserDefaults.standard
        let url = defaults.value(forKey: "url") as! String
        let myUrl = url + taskID
        let urlRequest = URL(string: myUrl)
        
        URLSession.shared.dataTask(with: urlRequest!, completionHandler: {
            (data, response, error) in
            
            if(error != nil) {
                print("Error: error calling GET on task")
                print(error.debugDescription)
            } else {
                do {
                    guard let todo = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject] else {
                        print("Error: error trying to convert data to JSON")
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self.nameLabel.text = (todo["name"] as? String)!
                        self.noteLabel.text = (todo["note"] as? String)!
                        self.completedLabel.text = (todo["completed"] as? String)!
                        self.priotityLabel.text = (todo["priority"] as? String)!
                        self.createdAtLabel.text = (todo["createdAt"] as? String)!
                        self.updatedAtLabel.text = (todo["updatedAt"] as? String)!
                        self.idLabel.text = (todo["_id"] as? String)!
                    }
                    
                    print(todo.description)
                } catch let error as NSError{
                    print(error)
                }
            }
        }).resume()
    }
    
    
    func loadTask() {
        taskID = todo["_id"] as! String!
        getTask()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTask()
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
        let url:String = "https://magic-todo.herokuapp.com/api/todos/" + taskID
        
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
                    let message = parseJSON["message"] as! String
                    print("message: " + message)
                    
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
            _ in _ = self.navigationController?.popViewController(animated: true)
        })
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    
    }
    func style() {
        Style.loadTheme()
        
        self.view.backgroundColor = Style.backgroundColor
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
        self.navigationController?.navigationBar.barStyle = Style.barStyle
        self.navigationController?.navigationBar.tintColor = Style.navigationBarTintColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Style.navigationBarTitleColor]
        self.navigationController?.navigationBar.barTintColor = Style.navigationBarColor
        self.edit.backgroundColor = Style.buttonColor
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTask()
        style()
    }
}

