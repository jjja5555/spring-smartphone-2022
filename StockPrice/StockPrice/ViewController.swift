//
//  ViewController.swift
//  StockPrice
//
//  Created by Xiao Huang on 4/10/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import PromiseKit
class ViewController: UIViewController,SendStockDelegate {
    
    let stockurl = "https://financialmodelingprep.com/api/v3/quote/"
    let key = "d9457a832eced8edd8c9baf70243612d"
    var symbols = ["FB","AMZN","MSFT","TSLA","AAPL"]
    var stocks : [Quote] = []
    @IBOutlet var lblName: UILabel!
    
    @IBOutlet var tblView: UITableView!
    @IBOutlet var lblSymbol: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblHigh: UILabel!
    @IBOutlet var lblLow: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addStock(_ sender: Any) {
        let alertController =  UIAlertController(title: "Add Stock", message: "Please type Stock Symbol",preferredStyle: .alert)
        var textField: UITextField?
        
        let OKButton = UIAlertAction(title: "OK",style: .default) { action in
            print("OK Button pressed")
            //self.lblAlert.text = textField?.text
            let symbol = textField?.text!
            let url = "\(self.stockurl)\(symbol ?? "")?apikey=\(self.key)"
            print(url)
            self.getStockData(url)
                .done { quote in
                    self.stocks.append(quote)
                    print(quote.name)
                    self.tblView.reloadData()
                }
                .catch { error in
                    print(error.localizedDescription)
                }
        }
        
        let CancelButton = UIAlertAction(title: "Cancel", style: .cancel) { Action in
            print("Cancel pressed")
        }
    
        
        alertController.addAction(OKButton)
        alertController.addAction(CancelButton)
        
        alertController.addTextField { lblTextField in
            lblTextField.placeholder  = "Type Something"
            textField = lblTextField
            
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func sendStockData(quote: Quote) {
        print(quote.name)
        self.lblName.text = quote.name
        self.lblLow.text = "$\(quote.dayLow)"
        self.lblHigh.text = "$\(quote.dayHigh)"
        self.lblPrice.text = "$\(quote.price)"
        self.lblSymbol.text = quote.symbol
    }
    
    func loadData(){
        for symbol in symbols {
            let url = "\(stockurl)\(symbol)?apikey=\(key)"
            sleep(2)
            getStockData(url)
                .done { quote in
                    self.stocks.append(quote)
                    print(quote.name)
                    self.tblView.reloadData()
                    if(symbol == "AAPL"){
                        self.lblName.text = quote.name
                        self.lblLow.text = "$\(quote.dayLow)"
                        self.lblHigh.text = "$\(quote.dayHigh)"
                        self.lblPrice.text = "$\(quote.price)"
                        self.lblSymbol.text = symbol
                    }
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
                quote.name = stock["name"].stringValue
                quote.dayLow = stock["dayLow"].floatValue
                quote.dayHigh = stock["dayHigh"].floatValue
                seal.fulfill(quote)
            }
            
        }
    }

}

