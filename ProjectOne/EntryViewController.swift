//
//  EntryViewController.swift
//  ProjectOne
//
//  Created by MacBook Two on 12/12/2024.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var textField : UITextField!
    var update: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        return true
    }
    @objc func saveTask() {
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        update?(text)
        navigationController?.popViewController(animated: true)
        
    }


}
