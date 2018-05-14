//
//  DetailsViewController.swift
//  Atta
//
//  Created by mac on 5/5/18.
//  Copyright © 2018 nevdia. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailimageview: UIImageView!
    
    @IBOutlet var namelabel: UILabel!
    
    @IBOutlet weak var pricelabel: UILabel!
    
    
    var itempart = Item()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namelabel.text  = itempart.item_name
        pricelabel.text = itempart.item_desc

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
