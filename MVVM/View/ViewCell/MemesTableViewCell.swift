//
//  MemesTableViewCell.swift
//  MVVM
//
//  Created by Alan Silva on 06/11/19.
//  Copyright © 2019 Alan Silva. All rights reserved.
//

import UIKit

class MemesTableViewCell: UITableViewCell {

    @IBOutlet weak var memeTitle: UILabel!
    @IBOutlet weak var memeIdLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(object: MemesViewModelCell){
        
        self.memeTitle.text = object.nameMeme()
        self.memeIdLabel.text = object.idMeme()
    }
    
}
