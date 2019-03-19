//
//  EditQuoteViewController.swift
//  MVCPureTableView
//
//  Created by Milan Bojic on 3/17/19.
//  Copyright © 2019 Milan Bojic. All rights reserved.
//

import UIKit

class EditQuoteViewController: UIViewController {
    
    @IBOutlet weak var quoteTextView: UITextView!
    @IBOutlet weak var authorTextField: UITextField!
    var quoteText: String?
    var author: String?
    var quoteIndex: Int?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteTextView.text = quoteText
        authorTextField.text = author
    }
    
    // Update quote
    @IBAction func submitChangesPressed(_ sender: Any) {
        if let text = quoteTextView.text, let author = authorTextField.text, let index = quoteIndex {
            let quoteDictionary = ["author": author, "quoteText": text] as PlistDictionary
            let quote = Quote(plist: quoteDictionary)
            update(quote: quote, at: index)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    
}
