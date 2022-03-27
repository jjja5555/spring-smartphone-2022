//
//  ViewController.swift
//  SearchBarExample
//
//  Created by Xiao Huang on 3/26/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate {

    var names = ["Xiao","Shuqu","Wanjun"]
    var searchArray = ["Xiao","Shuqu","Wanjun"]
    
    @IBOutlet var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        
        guard !searchBar.text!.isEmpty else{
            names = searchArray
            tblView.reloadData()
            return
        }
        
        names = searchArray.filter({ name in
            name.lowercased().contains(searchBar.text!.lowercased())
        })
        tblView.reloadData()
    }
    
}

