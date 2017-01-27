//
//  ItemTableViewCell.swift
//  TestingNMessenger
//
//  Created by Sahbi H. Belgacem on 26.01.17.
//  Copyright © 2017 Sahbi H. Belgacem. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var message: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
