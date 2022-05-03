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

    @IBOutlet var tblView: UITableView!
    let stockurl = "https://financialmodelingprep.com/api/v3/quote/"
    let key = "d9457a832eced8edd8c9baf70243612d"
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    var symbols = ["FB","AMZN","MSFT","TSLA"]
    var stocks : [Quote] = []
    func loadData(){
        for symbol in symbols {
            let url = "\(stockurl)\(symbol)?apikey=\(key)"
            sleep(1)
            getStockData(url)
                .done { quote in
                    self.stocks.append(quote)
                    self.tblView.reloadData()
                }
                .catch { error in
                    print(error.localizedDescription)
                }
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

