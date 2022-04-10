//
//  TableCode.swift
//  StockPrice
//
//  Created by Xiao Huang on 4/10/22.
//

import UIKit
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        //cell.textLabel?.text = "\(stocks[indexPath.row].name) : $\(stocks[indexPath.row].price) "
        cell.lblSymbol.text = stocks[indexPath.row].symbol
        cell.lblName.text = stocks[indexPath.row].name
        cell.quote = stocks[indexPath.row]
        cell.sendStockDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            stocks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
}
