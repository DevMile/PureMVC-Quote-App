//
//  QuotePlistExtension.swift
//  MVCPureTableView
//
//  Created by Milan Bojic on 3/16/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//

import UIKit


// use key from enum as a raw value
protocol PlistKey: RawRepresentable {}

// choose value types for dictionaries which will be used in QuotesPlist.plist. We select them by conforming to our custom protocol.
protocol PlistValue {}
extension Bool: PlistValue{}
extension Int: PlistValue{}
extension String: PlistValue{}
extension Array: PlistValue{}
extension Date: PlistValue{}
extension Data: PlistValue{}
extension Dictionary: PlistValue{}

// declare custom dictionary to be used in QuotesPlist.plist
typealias PlistDictionary = [String:AnyObject]

// generic function for Dictionary type
extension Dictionary where Value: AnyObject {
    func getValue<K: PlistKey, V: PlistValue>(forKey key: K) -> V where K.RawValue == String {
        return self[key.rawValue as! Key] as! V
    }
}
