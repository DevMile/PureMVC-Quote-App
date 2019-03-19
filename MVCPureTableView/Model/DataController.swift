//
//  DataController.swift
//  MVCPureTableView
//
//  Created by Milan Bojic on 3/16/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//

import Foundation

class DataController {
    
    var quotes: [Quote]
    
    init() {
        let fileUrl = Bundle.main.url(forResource: "QuotesPlist", withExtension: "plist")!
        let quotesPlist = NSArray(contentsOf: fileUrl) as! [PlistDictionary]
        quotes = quotesPlist.map(Quote.init)
    }
    
}
