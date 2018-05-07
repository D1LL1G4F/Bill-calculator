//
//  ViewController.swift
//  Bill calculator
//
//  Created by Hell Yeah on 5/7/18.
//  Copyright © 2018 Matej Knazik. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, AddNewItem, ChangeCount {
    
    var items: [Item] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        
        tableCell.nameLabel.text = items[indexPath.row].itemName
        tableCell.countLabel.text = "\(items[indexPath.row].count)x"
        
        tableCell.delegate = self
        tableCell.indexPath = indexPath.row
        tableCell.items = items
        
        return tableCell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddItemViewController
        vc.delegate = self
    }
    
    func addItem(name: String!, price: Int!) {
        items.append(Item(name: name, price: price))
        tableView.reloadData()
    }
    
    func changeCount(newCount: Int, index: Int) {
        items[index].count = newCount
    }


}

class Item {
    var itemName = ""
    var count = 1
    var price = 0
    
    convenience init(name: String, price: Int) {
        self.init()
        self.itemName = name
    }
    
    func increase() {
        count += 1
    }
    
    func decrease() {
        count -= 1
    }
    
}

