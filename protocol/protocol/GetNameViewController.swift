//
//  GetNameViewController.swift
//  protocol
//
//  Created by Xiao Huang on 2/13/22.
//

import UIKit

protocol SendNameDelegate {
    func setFirstandLast(firstName : String, lastName : String)
    func setWelComeText(welcomeText : String)
}

class GetNameViewController: UIViewController {

    var firstName :String?
    var lastName: String?
    
    var sendNameDelegate : SendNameDelegate?
    
    var sendMsg : ProtocolSendMsg?
    
    @IBOutlet var txtFirst: UITextField!
    
    @IBOutlet var txtLast: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let firstName = firstName else {return}

        guard let lastName = lastName else {return}
        
        txtFirst.text = firstName
        txtLast.text = lastName

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveName(_ sender: Any) {
        guard let firstName = txtFirst.text else {return}

        guard let lastName = txtLast.text else {return}
        sendNameDelegate?.setFirstandLast(firstName: firstName, lastName: lastName)
        sendNameDelegate?.setWelComeText(welcomeText: "Welcome \(firstName), \(lastName)")
        sendMsg?.sendMsg(msg: "Welcome \(firstName), \(lastName)")
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
