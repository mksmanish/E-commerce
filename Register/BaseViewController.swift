//
//  BaseViewController.swift
//  Register
//
//  Created by manish on 03/08/21.
//

import UIKit
import Toast_Swift

class BaseViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showToast(message:String,duration:TimeInterval,position:ToastPosition,backgroundColor:UIColor) {
        
        if backgroundColor == .black {
            ToastManager.shared.style.backgroundColor = .white
            ToastManager.shared.style.messageColor = .black
        } else {
            ToastManager.shared.style.backgroundColor = .white
            ToastManager.shared.style.messageColor = .black
        }
        self.view.makeToast(message, duration: duration, position: position)
    }

}
