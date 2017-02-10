//
//  AddViewController.swift
//  ToDoApp
//
//  Created by Klaudia on 28.01.2017.
//  Copyright © 2017 Klaudia. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var priorityField: UITextField!
    @IBOutlet weak var noteField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var silderValueLabel: UILabel!
    @IBOutlet weak var completedSlider: UISlider!
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        silderValueLabel.text = "\(Int(sender.value)) %"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func wyslij() {
        let url = defaults.value(forKey: "url") as! String
        let login = defaults.value(forKey: "login") as! String
        
        let myUrl = URL(string: url)
        
        var request = URLRequest(url: myUrl!)
        request.httpMethod = "POST"
        
        let completed = String(Int(completedSlider.value))
        
        guard let name = nameField.text,
            let note = noteField.text,
            let priority = priorityField.text
            else {
                print("Guard is coming..")
                return
            }
        
        let mapDict = ["note" : "First", "completed" : "Second"]
        let json = [ "name" : name, "note" : note, "login": login, "completed" : completed, "priority" : priority, "dict" : mapDict] as [String : Any]
        
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
        if (priorityField.text != "" && nameField.text != "" && noteField.text != "")
        {
            wyslij()
            let myAlert = UIAlertController(title: "Success", message: "Added!", preferredStyle: .actionSheet)
        
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {
                _ in _ = self.navigationController?.popViewController(animated: true)
            })
        
            myAlert.addAction(okAction)
        
            self.present(myAlert, animated: true, completion: nil)
        }
        else {
            let myAlert1 = UIAlertController(title: "Warning", message: "No added! Fill in the blanks!", preferredStyle: .actionSheet)
            let noOkAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            myAlert1.addAction(noOkAction)
            self.present(myAlert1, animated: true, completion: nil)
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Style.loadTheme()
        
        self.view.backgroundColor = Style.backgroundColor
        self.navigationController?.navigationBar.barStyle = Style.barStyle
        self.navigationController?.navigationBar.tintColor = Style.navigationBarTintColor
        self.nameLabel.textColor = Style.textColor
        self.noteLabel.textColor = Style.textColor
        self.completedLabel.textColor = Style.textColor
        self.priorityLabel.textColor = Style.textColor
        self.sliderValue.textColor = Style.textColor
    }

}
