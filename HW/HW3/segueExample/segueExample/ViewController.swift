//
//  ViewController.swift
//  segueExample
//
//  Created by Xiao Huang on 2/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var first: UITextField!
    @IBOutlet var last: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func go2SecondVC(_ sender: Any) {
        performSegue(withIdentifier: "segue2SecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue2SecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.welcomeStr = "Welcome \(first.text!) \(last.text!)"
        }
    }
}

