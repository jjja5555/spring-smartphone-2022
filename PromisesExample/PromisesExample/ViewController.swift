//
//  ViewController.swift
//  PromisesExample
//
//  Created by Xiao Huang on 3/26/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
import PromiseKit
class ViewController: UIViewController {

    let stockurl = "https://financialmodelingprep.com/api/v3/quote/"
    let key = "d9457a832eced8edd8c9baf70243612d"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getData(_ sender: Any) {
        let symbol = "FB"
        let url = "\(stockurl)\(symbol)?apikey=\(key)"
        
        getStockData(url)
            .done { quote in
                print(quote.name)
                print(quote.price)
            }
            .catch { error in
                print(error.localizedDescription)
            }
    }
        
        func getStockData (_ url : String) -> Promise<Quote>{
            return Promise<Quote> { seal -> Void in
                AF.request(url).responseJSON { response in
                    if response.error != nil{
                        seal.reject(response.error!)
                    }
                    let stocks = JSON(response.data!).array
                    guard let stock = stocks!.first else { return}
                    print(stock)
                    let quote = Quote()
                    quote.symbol = stock["symbol"].stringValue
                    quote.price = stock["price"].floatValue
                    quote.volume = stock["volume"].intValue
                    quote.name = stock["name"].stringValue
                    quote.dayLow = stock["dayLow"].floatValue
                    quote.dayHigh = stock["dayHigh"].floatValue
                    seal.fulfill(quote)
                }
                
            }
        }
    
}

