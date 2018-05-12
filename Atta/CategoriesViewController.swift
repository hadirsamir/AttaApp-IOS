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
        
        print(product_id)
//        Server.POSTRequest(params: <#T##[String : Any]#>, Result: <#T##(Any) -> ()#>)
        // Do any additional setup after loading the view.
    }

    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mainPartArray.count
       
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "displaycell") as! UITableViewCell
        cell.textLabel?.text = mainPartArray[indexPath.row].main_data
        return cell
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
