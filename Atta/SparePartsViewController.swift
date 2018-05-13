//
//  SparePartsViewController.swift
//  Atta
//
//  Created by mac on 5/5/18.
//  Copyright © 2018 nevdia. All rights reserved.
//

import UIKit

class SparePartsViewController: UIViewController,UITableViewDelegate , UITableViewDataSource{
    @IBOutlet weak var SpareList: UITableView!

    var spareArray = [SpareParts]()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        SpareList.delegate = self
        SpareList.dataSource = self
        let param = ["retriveAllSparePartsCats" : "1"]
        Server.POSTRequest( params: param ) {
            (restult) in
            //print(restult)
            guard let sparePartFromServerArray = restult as? NSArray else {return}
            for part in sparePartFromServerArray {
                if let s = part as? [String : Any] {
                    var sp = SpareParts ()
                    if let _id = s["id"] as? String {
                        sp.id = _id
                    }
                    if let _main_data = s["main_data"] as?
                        String {
                        sp.main_data = _main_data
                    }
                    if let _img_src_mini = s ["img_src_mini"] as? String {
                        sp.img_src_mini = _img_src_mini
                    }
                    if let _img_src = s ["img_src"] as? String{
                        sp.img_src = _img_src
                    }
                    self.spareArray.append(sp)
                }
                
            }
        
            self.SpareList.reloadData()
    
    }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CategoriesViewController {
            if let spare = sender as? SpareParts{
                vc.product_id = spare.id
            }
        }
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return spareArray.count
       }
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = SpareList.dequeueReusableCell(withIdentifier: "sparecell") as! SparePartsTableViewCell
        let sparePart = spareArray[indexPath.row]
        cell.spareLabel.text = sparePart.main_data.capitalized
        
        cell.spareImage.downloadedFrom(url: URL(string: "\(ModelConfig.SERVER_URL_images)/\(sparePart.img_src)")!)
        
        return cell
       }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showspareList", sender: spareArray[indexPath.row])
       }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

