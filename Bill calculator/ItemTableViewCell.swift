//
//  ItemTableViewCell.swift
//  Bill calculator
//
//  Created by Hell Yeah on 5/7/18.
//  Copyright © 2018 Matej Knazik. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var strepper: UIStepper!
    
    
    @IBAction func valueChanged(_ sender: UIStepper) {
        //
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