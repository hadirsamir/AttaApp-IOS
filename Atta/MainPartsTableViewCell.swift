//
//  MainPartsTableViewCell.swift
//  Atta
//
//  Created by mac on 5/12/18.
//  Copyright © 2018 nevdia. All rights reserved.
//

import UIKit

class MainPartsTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
