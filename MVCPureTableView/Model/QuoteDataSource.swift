//
//  QuoteDataSource.swift
//  MVCPureTableView
//
//  Created by Milan Bojic on 3/15/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//

import UIKit

class QuoteDataSource: NSObject {
    
    var quotes: [Quote] {
        get {
            return loadPropertyList()
        }
    }
}

extension QuoteDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath) as? QuoteCell else {return UITableViewCell()}
        let quote = quotes[indexPath.row]
        cell.author = quote.author
        cell.quote = quote.quote
        return cell
    }
}
