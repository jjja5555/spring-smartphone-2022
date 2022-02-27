//
//  ProfileViewController.swift
//  Notification
//
//  Created by Xiao Huang on 2/13/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var txtFirst: UITextField!
    @IBOutlet var txtLast: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveName(_ sender: Any) {
        guard let firstName = txtFirst.text else{return}
        guard let lastName = txtLast.text else{return}
        let firstAndLastName:[String : String] = ["FirstName" : firstName,"LastName" : lastName]
        
        
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: firstAndLastName)
        
        self.navigationController?.popViewController(animated: true)
    }
    


}
