//
//  StockViewController.swift
//  stockMaster
//
//  Created by Xiao Huang on 2/27/22.
//

import UIKit
import RealmSwift

class StockViewController: UIViewController{
    
    var stockList :[StockShort] = []
    

    @IBAction func addStock(_ sender: Any) {
        var txtField : UITextField?
        let actionViewController = UIAlertController(title: "Add Stock", message: nil, preferredStyle: .alert)
        let OKButton = UIAlertAction(title: "OK", style: .default) { action in
            guard let symbol = txtField?.text else{
                return
            }
            self.add2DB(symol: symbol)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        actionViewController.addAction(OKButton)
        actionViewController.addAction(cancelButton)
        
        actionViewController.addTextField { stocktextField in
            stocktextField.placeholder = "Type Stock Symbol"
            txtField = stocktextField
        }
        
        self.present(actionViewController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStockValues()
        //print(Realm.Configuration.defaultConfiguration.fileURL?.path)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToDB(_ sender: Any) {
        
        let stock = StockShort()
        stock.symbol = "AAPL"
        stock.price = 120
        stock.volume = 196
        
        do {
            let realm = try Realm()
            
            try realm.write({
                realm.add(stock,update: .modified)
            })
            
        }catch{
            print("Something went wrong")
        }
    }
    
    func add2DB(symol : String){
        let stock = StockShort()
        stock.symbol = symol
        stock.price = 120
        stock.volume = 196
        do {
            let realm = try Realm()
            
            try realm.write({
                realm.add(stock,update: .modified)
            })
            
        }catch{
            print("Something went wrong")
        }
    }
    
    func getTSLAStock() -> StockShort{
        do {
            let realm = try Realm()
            let stocks = realm.objects(StockShort.self)
            for stock in stocks{
                if stock.symbol == "TSLA"{
                    return stock
                }
            }
        }catch{
            
        }
        return StockShort()
    }
    
    func loadStockValues(){
        do {
            let realm = try Realm()
            //stockList = realm.objects(StockShort.self)
        }catch{
            
        }
    }
    
    func deleteStrockFromDB(stock: StockShort){
        do {
            let realm = try Realm()
            try realm.write({
                realm.delete(stock)
            })
        }catch{
            
        }
    }
    @IBAction func deleteFromDB(_ sender: Any) {
        deleteStrockFromDB(stock : getTSLAStock())
        
    }
    
}
