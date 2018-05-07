//
//  AddItemViewController.swift
//  Bill calculator
//
//  Created by Matej Knazik on 5/7/18.
//  Copyright © 2018 Matej Knazik. All rights reserved.
//

import UIKit

protocol AddNewItem {
    func addItem(name: String!, price: Int!)
}

// view controller for adding item to table
class AddItemViewController: UIViewController {
    
    var delegate: AddNewItem?
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var priceFIeld: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    
    // add button submited
    @IBAction func addTriggered(_ sender: UIButton) {
        
        if nameField.text != "" && priceFIeld.text != "" {// name and price must be set
            delegate?.addItem(name: nameField.text!, price: Int(priceFIeld.text!))
            navigationController?.popViewController(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
