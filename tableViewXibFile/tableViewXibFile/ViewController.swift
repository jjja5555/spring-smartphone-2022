//
//  ViewController.swift
//  tableViewXibFile
//
//  Created by Xiao Huang on 2/6/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tblView: UITableView!
    
    let arr = ["Seattle1", "Seattle2", "Seattle3","Seattle4", "Seattle5", "Seattle6","Seattle7", "Seattle8", "Seattle9","Seattle10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        
        cell.imgView.image = UIImage(named: arr[indexPath.row])
        cell.lblImage.text = arr[indexPath.row]
        return cell
    }

}

