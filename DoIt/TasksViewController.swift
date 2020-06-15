//
//  TasksViewController.swift
//  DoIt
//
//  Created by Krys Ngabi on 6/14/20.
//  Copyright © 2020 Krys Ngabi. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tabView: UITableView!
    
    var tasks : [Task] = []
    
    var selectedIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tasks = makeTasks();
        tabView.dataSource=self
        tabView.delegate=self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        }else {
            cell.textLabel?.text = task.name
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    func makeTasks()->[Task] {
        let task1 = Task()
        task1.name = "Walk Dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy Cheese"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Now the lawn"
        task3.important = false
        
        return [task1,task2,task3]
        
    }
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectTaskSegue" {
            let nextViewController = segue.destination as! CompleteTaskViewController
            
            nextViewController.task = sender as! Task
            nextViewController.previousVC = self
            
        }
        
        if segue.identifier == "addSegue" {
            let nextViewController = segue.destination as! CreateTaskViewController
            
            nextViewController.previousVC = self
        }
        
    }
}

