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
    
    var todo = [String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            idLabel.text = todo["_id"] as! String?
            nameLabel.text = todo["name"] as! String?
            noteLabel.text = todo["note"] as! String?
            completedLabel.text = todo["completed"] as! String?
            priotityLabel.text = todo["priority"] as! String?
            createdAtLabel.text = todo["createdAt"] as! String?
            updatedAtLabel.text = todo["updatedAt"] as! String?
        // Do any additional setup after loading the view.
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

