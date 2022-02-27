//
//  ViewController.swift
//  Notification
//
//  Created by Xiao Huang on 2/13/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblFirst: UILabel!
    
    @IBOutlet var lblLast: UILabel!

    
    //Remember to call deinit
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToNotification()
        // Do any additional setup after loading the view.
    }

    @IBAction func go2profile(_ sender: Any) {
        performSegue(withIdentifier: "segueProfile", sender: self)
    }
    
    @IBAction func go2form(_ sender: Any) {
        performSegue(withIdentifier: "segueForm", sender: self)
    }
    
    func subscribeToNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getName), name: notificationName, object: nil)
    }
    
    @objc func getName(notificationName : NSNotification){
        print("I am here")
        if let dict = notificationName.userInfo as NSDictionary? {
            if let firstName = dict["FirstName"] as? String{
                lblFirst.text = firstName
            }
            
            if let lastName = dict["LastName"] as? String{
                lblLast.text = lastName
            }
        }
        
        
    }
}

