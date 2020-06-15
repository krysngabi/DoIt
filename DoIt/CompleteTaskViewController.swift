//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Krys Ngabi on 6/15/20.
//  Copyright © 2020 Krys Ngabi. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var lblTaskName: UILabel!
   
    var previousVC = TasksViewController()
    var task = Task()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTaskName.text = task.name
        
        if task.important {
                   lblTaskName.text = "❗️\(task.name)"
               }else {
                   lblTaskName.text = task.name
               }
        // Do any additional setup after loading the view.
    }
    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tabView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
