//
//  ViewController.swift
//  MVVM
//
//  Created by Alan Silva on 04/11/19.
//  Copyright © 2019 Alan Silva. All rights reserved.
//

import UIKit

class MemeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnPost: UIButton!
    @IBOutlet weak var bottomLabel: UILabel!
    
    var viewModel = MemesViewModel()
    
    var memeDelegateDataSource: MemesTableViewDelegateDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
        // Do any additional setup after loading the view.
        
        let nibAndIdentifier = "MemesTableViewCell"
        self.tableView.register(UINib(nibName: nibAndIdentifier, bundle: nil), forCellReuseIdentifier: nibAndIdentifier)
        
        self.getMeme()
        
    }
    
    fileprivate func setupUI(){
        self.btnPost.setTitle(self.viewModel.titleBtnPostText, for: .normal)
        self.bottomLabel.text = self.viewModel.titleBottomText
    }
    
    fileprivate func getMeme(){
        
        self.viewModel.getMeme { (success) in
            if success {
                self.configureTableView()
            }else{
                print("Deu Ruim")
            }
        }
        
    }
    
    fileprivate func configureTableView(){
        self.memeDelegateDataSource = MemesTableViewDelegateDataSource(memesViewModel: self.viewModel)
        
        self.tableView.delegate = memeDelegateDataSource
        self.tableView.dataSource = memeDelegateDataSource
        self.tableView.reloadData()
    }

}

