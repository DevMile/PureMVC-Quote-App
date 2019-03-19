//
//  QuoteModel.swift
//  MVCPureTableView
//
//  Created by Milan Bojic on 3/15/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//

import UIKit

struct Quote: Codable {
    let author: String
    let quote: String
}

extension Quote {
    
    // enum has String as raw value and is conforming to PlistKey protocol which inherits from RawRepresentable
    private enum Keys: String, PlistKey {
        case author
        case quoteText
    }
    
    init(plist: PlistDictionary) {
        author = plist.getValue(forKey: Keys.author)
        quote = plist.getValue(forKey: Keys.quoteText)
    }
}
