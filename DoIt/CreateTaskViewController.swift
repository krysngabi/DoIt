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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task =  Task(context: context)
        task.name = txtName.text!
        task.important = impSwitch.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //Pob bck
        
        navigationController?.popViewController(animated: true)
        
    }

}
