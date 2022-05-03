//
//  TableViewController.swift
//  PromisesExample
//
//  Created by Xiao Huang on 3/27/22.
//
import UIKit
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(stocks[indexPath.row].name) : $\(stocks[indexPath.row].price) "
        return cell
    }
    
    
}

