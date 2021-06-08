//
//  ViewController.swift
//  CryptoCoin
//
//  Created by Rosy Patel on 21/05/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var tableCoins: UITableView!
    
    var messages = [Coin]()
    var myViewModel = CryptoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableCoins.delegate = self
        tableCoins.dataSource = self
        
        myViewModel.delegate = self
        myViewModel.fetchData()
  
    }
    
    func format(price: String) -> String {
                let double = Double(price)
                let price = String(format: "$%.02f", double!)
                return price
    }
}
    
//MARK:- TableView methods

