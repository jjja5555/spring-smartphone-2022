//
//  SecondViewController.swift
//  segueExample
//
//  Created by Xiao Huang on 2/6/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var label: UILabel!
    var welcomeStr = ""
    override func viewDidLoad() {
        label.text = welcomeStr
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
