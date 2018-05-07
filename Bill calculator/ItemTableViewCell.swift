//
//  ItemTableViewCell.swift
//  Bill calculator
//
//  Created by Matej Knazik on 5/7/18.
//  Copyright © 2018 Matej Knazik. All rights reserved.
//

import UIKit

protocol ChangeCount {
    func changeCount(newCount: Int, index: Int)
}


// class for cell in table
class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var strepper: UIStepper!
    
    
    var delegate: ChangeCount?
    var index: Int?
    
    
    @IBAction func valueChanged(_ sender: UIStepper) {
        delegate?.changeCount(newCount: Int(sender.value), index: index!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
