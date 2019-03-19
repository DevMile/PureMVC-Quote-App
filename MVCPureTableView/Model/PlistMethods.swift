//
//  PlistMethods.swift
//  MVCPureTableView
//
//  Created by Milan Bojic on 3/18/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//

import Foundation

var plistURL: URL {
    let documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    return documentUrl.appendingPathComponent("Quote.plist")
}

func save(quote: Quote) {
    let encoder = PropertyListEncoder()
    var quotes = loadPropertyList()
    do {
        quotes.append(quote)
        let data = try encoder.encode(quotes)
        try data.write(to: plistURL)
    } catch {
        print(error)
    }
}

func update(quote: Quote, at index: Int) {
    let encoder = PropertyListEncoder()
    var quotes = loadPropertyList()
    let quoteDictionary = ["author": quote.author, "quoteText": quote.quote] as PlistDictionary
    let editedQuote = Quote(plist: quoteDictionary)
    quotes[index] = editedQuote
    do {
        let editedQ = try encoder.encode(quotes)
        try editedQ.write(to: plistURL)
    } catch {
        print(error)
    }
}

func loadPropertyList() -> [Quote] {
    let decoder = PropertyListDecoder()
    if let plist = try? Data(contentsOf: plistURL) {
        do {
            let quotes = try decoder.decode([Quote].self, from: plist)
            return quotes
        } catch {
            print(error)
        }
    }
    return [Quote]()
}



//func loadDummyList() -> [Quote] {
//    var quotes = [Quote]()
//    let dictionary = ["author": "Milan Bojic", "quoteText": "Vecna igra vecnosti..."] as PlistDictionary
//    let dictionary2 = ["author": "Jan Esmann", "quoteText": "Drink whiskey until you feel shakti..."] as PlistDictionary
//    let dictionary3 = ["author": "Marija Bozic", "quoteText": "Volim te Mileeee..."] as PlistDictionary
//    quotes.append(Quote(plist: dictionary))
//    quotes.append(Quote(plist: dictionary2))
//    quotes.append(Quote(plist: dictionary3))
//    return quotes
//}
