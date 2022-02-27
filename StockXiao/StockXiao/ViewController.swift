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
            let quote = QuoteShort();
            quote.symbol = stock["symbol"].stringValue
            quote.price = stock["price"].floatValue
            quote.volume = stock["volume"].intValue
            self.output.text = "\(quote.symbol) , \(quote.price) , \(quote.volume)"
            
        }
    }
    
}

