//
//  ViewController.swift
//  HW1
//
//  Created by Xiao Huang on 2/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func click(_ sender: Any) {

        label.text = "Hello, \(firstName.text!) \(lastName.text!)"
    }
    
    
}

