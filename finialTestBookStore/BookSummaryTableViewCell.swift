//
//  BookSummaryTableViewCell.swift
//  finialTestBookStore
//
//  Created by Ryan on 30/1/2016.
//  Copyright © 2016 Ryan. All rights reserved.
//

import UIKit

class BookSummaryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
       override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
