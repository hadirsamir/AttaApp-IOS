//
//  SparePartsTableViewCell.swift
//  Atta
//
//  Created by mac on 5/13/18.
//  Copyright © 2018 nevdia. All rights reserved.
//

import UIKit

class SparePartsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var spareImage: UIImageView!
    
    @IBOutlet weak var spareLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
