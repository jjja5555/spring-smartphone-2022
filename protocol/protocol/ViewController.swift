//
//  ViewController.swift
//  protocol
//
//  Created by Xiao Huang on 2/13/22.
//

import UIKit

class ViewController: UIViewController, SendNameDelegate, ProtocolSendMsg {
    

    @IBOutlet var lblFirst: UILabel!
    @IBOutlet var lblLast: UILabel!
    @IBOutlet var lblWelcome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getName(_ sender: Any) {
        performSegue(withIdentifier: "segueGetName", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGetName" {
            let getNameVC = segue.destination as! GetNameViewController
            guard let firstName = lblFirst.text else {return}
            guard let lastName = lblLast.text else {return}
            getNameVC.firstName = firstName
            getNameVC.lastName = lastName
            getNameVC.sendMsg = self
            getNameVC.sendNameDelegate = self
        }
    }
    
    func setFirstandLast(firstName : String, lastName : String){
        lblFirst.text = firstName
        lblLast.text = lastName
    }
    
    func setWelComeText(welcomeText: String) {
        lblWelcome.text = welcomeText
    }
    
    func sendMsg(msg : String){
        lblWelcome.text = msg
    }
}

