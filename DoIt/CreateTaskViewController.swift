//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Krys Ngabi on 6/15/20.
//  Copyright © 2020 Krys Ngabi. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var impSwitch: UISwitch!
    
    var previousVC  = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let task =  Task()
        task.name = txtName.text!
        task.important = impSwitch.isOn
        
        previousVC.tasks.append(task)
        previousVC.tabView.reloadData()
        
        navigationController?.popViewController(animated: true)
        
    }

}
