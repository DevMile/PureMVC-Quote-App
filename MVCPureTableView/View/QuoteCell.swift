//
//  QuoteCell.swift
//  MVCPureTableView
//
//  Created by Milan Bojic on 3/15/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//

import UIKit

class QuoteCell: UITableViewCell {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var author: String? {
        didSet {
            authorLabel.text = author
        }
    }
    
    var quote: String? {
        didSet {
            quoteLabel.text = quote
        }
    }
}
