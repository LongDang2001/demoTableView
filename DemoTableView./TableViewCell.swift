//
//  TableViewCell.swift
//  DemoTableView.
//
//  Created by admin on 6/26/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lbCell1: UILabel!
    @IBOutlet weak var lbCell2: UILabel!
    @IBOutlet weak var imageCell: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
