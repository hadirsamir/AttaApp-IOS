//
//  CategoryTableViewCell.swift
//  Atta
//
//  Created by mac on 5/13/18.
//  Copyright © 2018 nevdia. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {


    @IBOutlet weak var catImage: UIImageView!
    
    @IBOutlet weak var catLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
