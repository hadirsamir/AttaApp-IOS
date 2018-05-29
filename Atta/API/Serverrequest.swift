//
//  ServerRequest.swift
//  EstateRus
//
//  Created by Yahia El-Dow on 6/24/17.
//  Copyright © 2017 Production Code. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class Server : ModelConfig {

    static let errorMSG = "Error, Please tray again"
    class func GetRequest (Result:@escaping(_ result : Any)->() ) {
      
//        UIViewController.root().view.addSubview(indicator)
        
        Alamofire.request(SERVER_URL ,
            method: httpMethod_GET ,
            encoding: urlEncoding  ,
            headers: headers )
            .validate(statusCode: 200..<300)
            .responseJSON(completionHandler: {
                response in
                switch response.result
                {
                case .failure(let error) :
                    print("> Error on Response JSON " , error)

                    Result(NSNull())
                    break
                case .success(let requestResult):
 
                    if let value = requestResult as? [String : Any]{
                        // check if return is Json Array
                        if value.count > 1 {
                            Result(value)
                            return
                        }
                        if let key = value.keys.first {
                            if let res = value[key] as? NSArray {
                                Result(res)
                                return
                            }
                            else if let res = value[key] as? NSDictionary {
                                Result(res)
                                return
                            }
                            }
                        }
                    }
                Result(NSNull())
                return
                
                
            })
    }

    class func POSTRequest (params : [String : Any] , Result:@escaping(_ result : Any)->() ) {
       
        Alamofire.request(SERVER_URL ,
                          method: httpMethod_POST ,
                          parameters: params ,
                          encoding: urlEncoding  ,
                          headers: headers )
            .validate(statusCode: 200..<300)
            .responseJSON(completionHandler: {
                response in

                switch response.result
                {
                
                case .failure(let error) :
                    print("> Error on Response JSON " , error)
                    Result(NSNull())
                    break
                case .success(let value):
                    Result(value)
                    break
                }
            })
    }
    
    
    
}


