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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabView.dataSource=self
        tabView.delegate=self
    }
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tabView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
            cell.textLabel?.text = "❗️\(task.name!)"
        }else {
            cell.textLabel?.text = task.name!
        }
    
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
 
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectTaskSegue" {
            let nextViewController = segue.destination as! CompleteTaskViewController
            
            nextViewController.task = sender as? Task
            nextViewController.previousVC = self
            
        }
        
    }
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
        tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            
        }catch {
            print("OOPS WE HAVE AN ERROR")
        }
    }
}

