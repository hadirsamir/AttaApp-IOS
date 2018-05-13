//
//  BrandsTableViewCell.swift
//  Atta
//
//  Created by mac on 5/12/18.
//  Copyright © 2018 nevdia. All rights reserved.
//

import UIKit

class BrandsTableViewCell: UITableViewCell {

    @IBOutlet weak var brandView: UIView!
    
    
    @IBOutlet weak var brandImage: UIImageView!
    
    @IBOutlet weak var brandLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
