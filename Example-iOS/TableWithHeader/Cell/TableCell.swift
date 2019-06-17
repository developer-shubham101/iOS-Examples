//
//  TableCell.swift
//  Example-iOS
//
//  Created by Arka Softwares on 17/06/19.
//  Copyright © 2019 Arka Softwares. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var cellTextView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
