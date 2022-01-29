//
//  ViewController.swift
//  ClassicTableView
//
//  Created by Xiao Huang on 1/28/22.
//
/*
 1. add a table view to storybord
 2. add a table view cell to storyboard
 3. create identifier for cell call it "cell"
 4. create outlet of tableview to the viewController
 5. add protocols UITableViewDelegate,UITableViewDataSource
 6. generate functions
 7. in view did load add tblView.delegate = self;tblView.dataSource = self
 8. create array for data values
 9. return array.count in numberOfRowsInSection
 10. fill the cellForRowAt function 
 */
import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    
    let array = ["Mark","Bill","Francis","John","Tom"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }

}

