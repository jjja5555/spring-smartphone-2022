//
//  ViewController.swift
//  TwoTables
//
//  Created by Xiao Huang on 2/27/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet var tbl1: UITableView!
    
    @IBOutlet var tbl2: UITableView!
    
    var arr1 = ["SEA","NYC","SFO","OAD"]
    var arr2 = ["Seattle","New york","San Francisco","Chicago"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == tbl1){
            return arr1.count
        }else{
            return arr2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tbl1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            cell.textLabel?.text = arr1[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            cell.textLabel?.text = arr2[indexPath.row]
            return cell
        }
        
    }


}

