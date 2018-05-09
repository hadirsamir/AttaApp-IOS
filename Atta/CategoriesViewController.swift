//
//  CategoriesViewController.swift
//  Atta
//
//  Created by mac on 5/5/18.
//  Copyright © 2018 nevdia. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController ,UITableViewDelegate{
    var MainProdiuct : MainParts?
    var SpareProduct : SpareParts?
    var mainPartArray =  [MainParts]()
    var sparePartArray =  [MainParts]()
    
    @IBOutlet weak var displaytableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mainPartArray.count
       
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "displaycell")
        cell.textLabel?.text = MainProdiuct?.main_data
        return cell
    }
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
