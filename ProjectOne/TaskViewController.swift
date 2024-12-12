//
//  TaskViewController.swift
//  ProjectOne
//
//  Created by MacBook Two on 12/12/2024.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet var label : UILabel!
    var task : String?
    
    var deleteUserTask : ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask() {
        guard let wrappedTask = task else {
            return
        }
        deleteUserTask?(wrappedTask)
        navigationController?.popViewController(animated: true)
        
    }
}
