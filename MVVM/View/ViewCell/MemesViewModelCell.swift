//
//  MemesViewModelCell.swift
//  MVVM
//
//  Created by Alan Silva on 06/11/19.
//  Copyright © 2019 Alan Silva. All rights reserved.
//

import Foundation

class MemesViewModelCell {
    
    private var meme: Meme?
    
    init(meme: Meme){
        self.meme = meme
    }
 
    func nameMeme() -> String {
        return self.meme?.name ?? ""
    }
    
    func idMeme() -> String {
        return self.meme?.id ?? ""
    }
    
}
