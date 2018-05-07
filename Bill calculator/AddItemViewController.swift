//
//  AddItemViewController.swift
//  Bill calculator
//
//  Created by Hell Yeah on 5/7/18.
//  Copyright © 2018 Matej Knazik. All rights reserved.
//

import UIKit

protocol AddNewItem {
    func addItem(name: String!, price: Int!)
}

class AddItemViewController: UIViewController {
    
    var delegate: AddNewItem?
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var priceFIeld: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func addTriggered(_ sender: UIButton) {
        
        if nameField.text != "" && priceFIeld.text != "" {
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
