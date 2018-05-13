//
//  CategoriesViewController.swift
//  Atta
//
//  Created by mac on 5/5/18.
//  Copyright © 2018 nevdia. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    var product_id = ""
    var SpareProduct : SpareParts?
    var mainPartArray =  [MainParts]()
    var sparePartArray =  [SpareParts]()
    
    
    @IBOutlet weak var displaytableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displaytableView.delegate = self
        displaytableView.dataSource = self
        print(product_id)
        
        let param = ["retriveAllItems" : "1"]
        
        Server.POSTRequest( params: param ) {
            (restult) in
            //print(restult)
            guard let itemFromServerArray = restult as? NSArray else {return}
            for part in itemFromServerArray{
                if let i = part as? [String : Any]{
                    
                }
            }
            
            
            
    }
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let spare = segue.destination as? DetailsViewController{
            spare.sparepart = sparePartArray[(displaytableView.indexPathForSelectedRow?.row)!]
            spare.mainpart = mainPartArray[(displaytableView.indexPathForSelectedRow?.row)!]
           
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mainPartArray.count
        return sparePartArray.count
       
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = displaytableView.dequeueReusableCell(withIdentifier: "displaycell") as! CategoryTableViewCell
        cell.catLabel.text = mainPartArray[indexPath.row].main_data
        cell.catLabel.text = sparePartArray[indexPath.row].main_data
      
        return cell
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
