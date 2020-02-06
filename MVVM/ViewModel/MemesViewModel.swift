//
//  MemesViewModel.swift
//  MVVM
//
//  Created by Alan Silva on 04/11/19.
//  Copyright © 2019 Alan Silva. All rights reserved.
//

import Foundation

class MemesViewModel {
    
    let managerAPI = APIManager()
    
    let memesAPI = MemesAPI()
    
    let arrayLanguage = ["Portugues", "Ingles"]
    
    var arrayMeme: [Meme]?
    
    var titlePage: String {
        return "Meme Page"
    }
    
    var titleBtnPostText: String {
        return "Post"
    }
    
    var titleBottomText: String {
        return "Tela pagina Meme"
    }
    
    func getCurrentMeme(currentObject: Int) -> Meme {
        
        if let array = self.arrayMeme {
            return array[currentObject]
        }
        
        return Meme(id: "", name: "", url: "", width: 0, height: 0, boxCount: 0)
    }
    
    func getMeme(completion: @escaping (Bool) -> Void) {
        
        memesAPI.getMeme { (listMeme, sucess) in
            
            if sucess {
                self.arrayMeme = listMeme
                completion(true)
            }else{
                completion(false)
            }
            
        }
        
    }
    
    func numberOfRows() -> Int {
        return self.arrayMeme?.count ?? 0
    }
    
}
