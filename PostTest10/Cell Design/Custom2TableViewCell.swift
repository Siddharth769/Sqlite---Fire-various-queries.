//
//  Custom2TableViewCell.swift
//  PostTest10
//
//  Created by siddharth on 29/01/19.
//  Copyright © 2019 clarionTechnologies. All rights reserved.
//

import UIKit

class Custom2TableViewCell: UITableViewCell {

  
    @IBOutlet weak var idCountLabel: UILabel!
    @IBOutlet weak var avgSalLabel: UILabel!
    @IBOutlet weak var maxSalLabel: UILabel!
    @IBOutlet weak var minSalLabel: UILabel!
    @IBOutlet weak var sumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
