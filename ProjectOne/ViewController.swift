//
//  ViewController.swift
//  ProjectOne
//
//  Created by MacBook Two on 12/12/2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView : UITableView!
    var tasks = [String]()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tasks"
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func didTapAdd() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        vc.title = "ADD NEW TASKS"
        vc.update = { newTask in
            self.tasks.append(newTask)
            self.tableView.reloadData()
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    func removeAndRearrange(array: inout [String], target: String) {
        // Check if the target exists in the array
        if let index = array.firstIndex(of: target) {
            array.remove(at: index)
        }
        tableView.reloadData()
    }
    

}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tvc = storyboard?.instantiateViewController(withIdentifier: "task") as! TaskViewController
        tvc.title = "Task"
        tvc.task = tasks[indexPath.row]
        tvc.deleteUserTask = { [weak self] taskName in
                 guard let self = self else { return }
            // weak self the idea is self still exist in memory when the closure is executed if not return
                 
                 if let index = self.tasks.firstIndex(of: taskName) {
                     self.tasks.remove(at: index)
                     
                     DispatchQueue.main.async {
                         tableView.reloadData()
                     }
                 }
             }
        navigationController?.pushViewController(tvc, animated: true)
    }
}
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
}

