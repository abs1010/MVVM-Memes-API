//
//  MemesAPI.swift
//  MVVM
//
//  Created by Alan Silva on 04/11/19.
//  Copyright © 2019 Alan Silva. All rights reserved.
//

import Foundation
import Alamofire

    class MemesAPI: NSObject {
        
        
        func getMeme(completion: @escaping ([Meme]?, Bool) -> Void) {
            
            Alamofire.request("https://api.imgflip.com/get_memes").responseJSON { response in
                if let data = response.data {
                    
                    let result = try? JSONDecoder().decode(Result.self, from: data)
                    completion(result?.data.memes, true)
                }else {
                completion(nil, false)
                }
            }
        }
        
        
        let apiManager = APIManager()
        
        func getMemeWithMVVM(completion: () -> Void ) {
            apiManager.request(url: "https://api.imgflip.com/get_memes") { (json, jsonarray, errorStr) in
                
                if json != nil {
                    print("json dicionario")
                }
                
                if jsonarray != nil {
                    print("json com array de dicionario ")
                }
            }
        }
        
    }
