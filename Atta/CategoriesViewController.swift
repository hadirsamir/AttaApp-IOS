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
    var sparePartArray =  [MainParts]()
    
    @IBOutlet weak var displaytableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displaytableView.delegate = self
        displaytableView.dataSource = self
        
        print(product_id)
//        Server.POSTRequest(params: <#T##[String : Any]#>, Result: <#T##(Any) -> ()#>)
        // Do any additional setup after loading the view.
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mainPartArray.count
        return sparePartArray.count
       
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = displaytableView.dequeueReusableCell(withIdentifier: "displaycell") as! CategoryTableViewCell
        cell.catLabel.text = mainPartArray[indexPath.row].main_data
        cell.catLabel.text = sparePartArray[indexPath.row].main_data
       // cell.catImage.image = UIImage(named : )
        return cell
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
