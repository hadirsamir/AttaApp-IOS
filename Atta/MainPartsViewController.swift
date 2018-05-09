//
//  MainPartsViewController.swift
//  Atta
//
//  Created by mac on 5/5/18.
//  Copyright © 2018 nevdia. All rights reserved.
///Users/other/Desktop/AttaApp-IOS-master/Atta.xcodeproj

import UIKit
class MainPartsViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource{
    
    
    @IBOutlet weak var cattableview: UITableView!
     var mainPartArray =  [MainParts]()
   
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return mainPartArray.count ;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
    let cell=UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "catcell")
        cell.textLabel?.text = mainPartArray [indexPath.row].main_data.capitalized
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showmainList", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CategoriesViewController {
            destination.MainProdiuct? = mainPartArray[(cattableview.indexPathForSelectedRow?.row)!]
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cattableview.delegate = self
        cattableview.dataSource = self
        let param = ["retriveAllMainEquipmentCats":"1"]
        Server.POSTRequest( params: param ) {
                            (restult) in
                            //print(restult)
            guard let mainPartFromServerArray = restult as? NSArray else {return}
            for part in mainPartFromServerArray {
                if let p =  part as? [String : Any]{
                    var mp = MainParts()
                    if let _id = p["id"] as? String {
                        mp.id = _id
                        
                    }
                     if  let _main_data = p["main_data"] as? String{
                        mp.main_data = _main_data
                        print(_main_data)
                    }
                    if let _img_src_mini = p ["img_src_mini"] as? String{
                        mp.img_src_mini = _img_src_mini
                    }
                    if let _img_src = p ["img_src"] as? String{
                       
                            mp.img_src = _img_src
                        
                        }
                    
                    self.mainPartArray.append(mp)
                   
                }
              
            }
            
            self.cattableview.reloadData()
            
        }
        
        // catlist.reloadData()
        
        
        // Do any additional setup after loading the view.
        }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}


