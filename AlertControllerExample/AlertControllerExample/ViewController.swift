//
//  ViewController.swift
//  AlertControllerExample
//
//  Created by Xiao Huang on 2/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblAlert: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func press(_ sender: Any) {
        let alertController =  UIAlertController(title: "Sample Alert Controller", message: "Simple msg",preferredStyle: .alert)
        var textField: UITextField?
        
        let OKButton = UIAlertAction(title: "OK",style: .default) { action in
            print("OK Button pressed")
            self.lblAlert.text = textField?.text
        }
        
        let CancelButton = UIAlertAction(title: "Cancel", style: .cancel) { Action in
            print("Cancel pressed")
        }
    
        
        alertController.addAction(OKButton)
        alertController.addAction(CancelButton)
        
        alertController.addTextField { lblTextField in
            lblTextField.placeholder  = "Type Something"
            textField = lblTextField
            
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

