//
//  ViewController.swift
//  Bill calculator
//
//  Created by Matej Knazik on 5/7/18.
//  Copyright © 2018 Matej Knazik. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, AddNewItem, ChangeCount {
    
    var items: [Item] = []
    
    @IBOutlet weak var clearButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var costLabel: UILabel!
    
    
    // total cost label update
    func updateTotalCosts() {
        var total = 0
        for item in items {
            total += item.count * item.price
        }
        costLabel.text = "\(total)Kc"
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    @IBAction func resetButtonActivated(_ sender: Any) {
        items.removeAll()
        tableView.reloadData()
        updateTotalCosts()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        
        tableCell.nameLabel.text = items[indexPath.row].itemName
        tableCell.countLabel.text = "\(items[indexPath.row].count)x"
        
        tableCell.delegate = self
        tableCell.index = indexPath.row
        
        
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
    
    // add item to table
    func addItem(name: String!, price: Int!) {
        items.append(Item(name: name, price: price))
        tableView.reloadData()
        updateTotalCosts()
    }
    
    func changeCount(newCount: Int, index: Int) {
        if newCount < 1 { // if count is zero delete item from table
            items.remove(at: index)
            updateTotalCosts()
            tableView.deleteRows(at: [IndexPath(row: index,section: 0)], with: .fade)
            // just update of indices of obects in cells
            for i in index..<tableView.numberOfRows(inSection: 0) {
                let cell = tableView.cellForRow(at: IndexPath(row: i, section: 0)) as! ItemTableViewCell
                cell.index = i
            }
        } else {
            items[index].count = newCount
            tableView.reloadData()
            updateTotalCosts()
        }
        
    }


}



// class for item
class Item {
    var itemName = ""
    var count = 1
    var price = 0
    
    convenience init(name: String, price: Int) {
        self.init()
        self.itemName = name
        self.price = price
    }
}

