//
//  BrandsViewController.swift
//  Atta
//
//  Created by mac on 5/5/18.
//  Copyright © 2018 nevdia. All rights reserved.
//

import UIKit

class BrandsViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   
    @IBOutlet weak var BrandList: UITableView!
    var brandArray = [Brands]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brandArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BrandList.dequeueReusableCell(withIdentifier: "customBrandCell") as! BrandsTableViewCell
        
        cell.brandLabel.text = brandArray [indexPath.row].brand_name.capitalized
       // cell.brandImage.image = 
        //UIImage( named : brandArray [indexPath.row].img_src)
        return cell
    }
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        BrandList.delegate = self
        BrandList.dataSource = self
        let param = ["retriveAllBrands" : "1"]
        Server.POSTRequest( params: param ) {
            (restult) in
            print(restult)
            guard let brandFromServerArray = restult as? NSArray else {return}
            
            for brand in brandFromServerArray{
                if let b = brand as? [String :Any] {
                    var brandtitle = Brands()
                    
                    if let _id = b["id"] as? String {
                        brandtitle.id = _id
                    }
                    if let _brand_name = b["brand_name"] as? String{
                        brandtitle.brand_name = _brand_name
                    }
                    if let _img_src = b["img_src"]
                        as? String {
                        brandtitle.img_src = _img_src
                    }
                    if  let _img_src_mini = b["img_src_mini"]
                        as? String {
                        brandtitle.img_src_mini = _img_src_mini
                    }
                    if let _created_at = b ["created_at"] as? String {
                        brandtitle.created_at = _created_at
                    }
                    self.brandArray.append(brandtitle)
                }
            }
            self.BrandList.reloadData()
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
