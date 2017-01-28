//
//  AddViewController.swift
//  ToDoApp
//
//  Created by Klaudia on 28.01.2017.
//  Copyright © 2017 Klaudia. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var priorityField: UITextField!
    @IBOutlet weak var completedFIeld: UITextField!
    @IBOutlet weak var noteField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func wyslij() {
        let url:String = "https://secret-badlands-37403.herokuapp.com/api/todos"
        
        let myUrl = URL(string: url)
        
        var request = URLRequest(url: myUrl!)
        request.httpMethod = "POST"
        
        guard let name = nameField.text,
            let note = noteField.text,
            let completed = completedFIeld.text,
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
    
    
    
    @IBAction func addNewTask(_ sender: Any) {
        
        wyslij()
        
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
