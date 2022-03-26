//
//  ViewController.swift
//  StockXiao
//
//  Created by Xiao Huang on 2/20/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var output: UILabel!
    @IBOutlet var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after x1loading the view.
    }

    @IBAction func getStock(_ sender: Any) {
        
        guard let symbol = textField.text?.uppercased() else {
            return
        }
        let url = "\(stockurl)\(symbol)?apikey=\(key)"
        print(url)
        
        SwiftSpinner.show("Getting stock value for \(symbol)")
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            if response.error != nil {
                print(response.error)
                return
            }
            let stocks = JSON(response.data).array
            
            guard let stock = stocks!.first else {
                return
            }
            
            print("stock price is: \(stock)")
            let quote = QuoteDetail();
            quote.symbol = stock["symbol"].stringValue
            quote.price = stock["price"].floatValue
            quote.volume = stock["volume"].intValue
            quote.name = stock["name"].stringValue
            quote.dayLow = stock["dayLow"].floatValue
            quote.dayHigh = stock["dayHigh"].floatValue
            self.output.text = "\(quote.symbol) , \(quote.price) , \(quote.volume)"
            self.textView.text = "Name: \(quote.name) \nDay High: \(quote.dayHigh) \nDay Low: \(quote.dayLow)"
            
        }
    }
    
}

