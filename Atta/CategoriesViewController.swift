//
//  CategoriesViewController.swift
//  Atta
//
//  Created by mac on 5/5/18.
//  Copyright © 2018 nevdia. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    var product_id  = ""
    var SpareProduct : SpareParts?
    //var mainPartArray =  [MainParts]()
   // var sparePartArray =  [SpareParts]()
    var itemArray = [Item] ()
    
    
    @IBOutlet weak var displaytableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displaytableView.delegate = self
        displaytableView.dataSource = self
        //print(product_id)
        
        let param = ["retriveAllItems" : "1"]
        
        Server.POSTRequest( params: param ) {
            (restult) in
            //print(restult)
            guard let itemFromServerArray = restult as? NSArray else {return}
            for part in itemFromServerArray{
                if let i = part as? [String : Any]{
                    
                    var ip = Item()
                    if let _id = i["id"] as?
                        String {
                        ip.id = _id
                    }
                    if let _categories_mhk_id = i["categories_mhk_id"]
                        as? String {
                        ip.categories_mhk_id = _categories_mhk_id
                    }
                    if let _barcode = i["barcode"] as? String{
                        ip.barcode = _barcode
                    }
                    if let _item_name = i["item_name"] as? String{
                        ip.item_name = _item_name
                    }
                    if let _item_desc = i["item_desc"] as? String {
                        ip.item_desc = _item_desc
                    }
                    if let _item_price = i["item_price"] as?
                        String {
                        ip.item_price = _item_price
                    }
                    if let _img_src = i["img_src"] as? String {
                        ip.img_src = _img_src
                    }
                    if let _img_src_mini =
                    i["img_src_mini"] as? String
                    {
                        ip.img_src_mini = _img_src_mini
                    }
                    if let _created_at = i["created_at"] as? String{
                        ip.created_at = _created_at
                    }
                    self.itemArray.append(ip)
                }
            }
            
          self.displaytableView.reloadData()
            
    }
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let item = segue.destination as? DetailsViewController{
            item.itempart = itemArray[(displaytableView.indexPathForSelectedRow?.row)!]
            
           
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails",sender: itemArray[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
       
       
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = displaytableView.dequeueReusableCell(withIdentifier: "showing") as! CategoryTableViewCell
       // let cell = UITableView.dequeueReusableCell(displaytableView)
        cell.catLabel.text = itemArray[indexPath.row].item_name
        
      
        return cell
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
