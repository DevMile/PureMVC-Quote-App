//
//  QuotesViewController.swift
//  MVCPureTableView
//
//  Created by Milan Bojic on 3/15/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
//    let dataSource: QuoteDataSource
//    let dataController = DataController()
//
//    required init?(coder aDecoder: NSCoder) {
//        self.dataSource = QuoteDataSource(quotes: dataController.quotes)
//        super.init(coder: aDecoder)
//    }
    
    let dataSource = QuoteDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 99
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    // show EditQuoteVC for selected cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let editQuoteVC = storyboard.instantiateViewController(withIdentifier: "editQuoteVC") as? EditQuoteViewController {
            let quotes = dataSource.quotes
            editQuoteVC.author = quotes[indexPath.row].author
            editQuoteVC.quoteText = quotes[indexPath.row].quote
            editQuoteVC.quoteIndex = indexPath.row
            self.navigationController?.pushViewController(editQuoteVC, animated: true)
        }
    }
}

