//
//  ChatVC.swift
//  Stalk
//
//  Created by Artur on 22/10/2018.
//  Copyright © 2018 Artur. All rights reserved.
//

import UIKit
import SWRevealViewController

class ChatVC: UIViewController {

    @IBOutlet weak var menuBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail { (success) in
                if success {
                    NotificationCenter.default.post(name: NOTIFY_USER_DATA_DID_CHANGE, object: nil)
                } else {
                    UserDataService.instance.logoutUser()
                }
            }
        }
    }
    

 

}
