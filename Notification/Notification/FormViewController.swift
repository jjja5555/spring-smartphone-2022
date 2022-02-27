//
//  FormViewController.swift
//  Notification
//
//  Created by Xiao Huang on 2/13/22.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet var txtFirst: UITextField!
    @IBOutlet var txtLast: UITextField!
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToNotification()
        // Do any additional setup after loading the view.
    }
    

    func subscribeToNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getName), name: notificationName, object: nil)
    }
    
    @objc func getName(notificationName : NSNotification){
        if let dict = notificationName.userInfo as NSDictionary? {
            if let firstName = dict["FirstName"] as? String{
                txtFirst.text = firstName
            }
            
            if let lastName = dict["LastName"] as? String{
                txtLast.text = lastName
            }
        }
        
        
    }
}
