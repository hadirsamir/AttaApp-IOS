//
//  ModelConfig.swift
//  EstateRus
//
//  Created by Yahia El-Dow on 5/22/17.
//  Copyright © 2017 Production Code. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ModelConfig: NSObject {
    
     static let httpMethod_GET =  HTTPMethod.get
     static let httpMethod_POST =  HTTPMethod.post
     static let urlEncoding = URLEncoding.default
     static let headers = ["Content-Type": "application/x-www-form-urlencoded"]
    
    static let SERVER_URL = "http://193.227.14.31/garar/webservices/webApis.php"
    static let SERVER_URL_images = "http://193.227.14.31/garar/"

   
}
