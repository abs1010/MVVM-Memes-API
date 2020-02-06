//
//  APIManager.swift
//  MVVM
//
//  Created by Alan Silva on 04/11/19.
//  Copyright © 2019 Alan Silva. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {

    func request(url: String, completion: @escaping (_ json: [String: Any]?, _ jsonArray: [[String: Any]]?, _ error: String?) -> Void) {
        
        Alamofire.request(url).responseJSON { response in
            guard let jsonObj = response.result.value else {
                completion(nil, nil, "")
                return
            }
            
            if let json = jsonObj as? [String: Any] {
                if let jsn = json["error"] as? [String:Any] {
                    completion(nil, nil, "")
                } else {
                    completion(json, nil, nil)
                }
            } else if let jsonArray = jsonObj as? [[String: Any]] {
                completion(nil, jsonArray, nil)
            } else {
                completion(nil, nil, "")
            }
            
        }
        completion(nil,nil, "")
    }

}
