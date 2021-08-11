//
//  loginViewController.swift
//  Register
//
//  Created by manish on 03/08/21.
//

import UIKit

class loginViewController: BaseViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func validate() -> Bool {
        if(txtUsername.text!.isEmpty) {
            self.showToast(message: "enter vaild username", duration: 2.0, position: .bottom, backgroundColor: .black)
            return false
            
        } else if txtPassword.text!.isEmpty {
            self.showToast(message:"enter vaild password", duration: 2.0, position: .bottom, backgroundColor: .black)
            return false
        }
        return true
    }
    
    

    @IBAction func btnLogin(_ sender: Any) {
        if self.validate() {
            let storyboard = UIStoryboard(name: "Info", bundle: nil).instantiateViewController(identifier: "InfoViewController") as InfoViewController
            storyboard.modalPresentationStyle = .fullScreen
            self.present(storyboard, animated: true, completion: nil)
            
        }
    }
    

}
