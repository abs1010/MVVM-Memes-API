//
//  MemesTableViewDelegateDataSource.swift
//  MVVM
//
//  Created by Alan Silva on 04/11/19.
//  Copyright © 2019 Alan Silva. All rights reserved.
//

import Foundation
import UIKit

class MemesTableViewDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var memesViewModel = MemesViewModel()
    
    init(memesViewModel: MemesViewModel) {
        self.memesViewModel = memesViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return self.memesViewModel.numberOfRows()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MemesTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "MemesTableViewCell", for: indexPath) as? MemesTableViewCell
        
        cell?.setup(object: MemesViewModelCell(meme: self.memesViewModel.getCurrentMeme(currentObject: indexPath.row)))
        
        return cell ?? UITableViewCell()
        
    }
    
}
