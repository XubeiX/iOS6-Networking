//
//  ChannelVC.swift
//  Stalk
//
//  Created by Artur on 22/10/2018.
//  Copyright © 2018 Artur. All rights reserved.
//

import UIKit
import SWRevealViewController

class ChannelVC: UIViewController {
    let SWRevealViewMargin: CGFloat = 64
    
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var userAvaterImg: CircleImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - SWRevealViewMargin
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: NOTIFY_USER_DATA_DID_CHANGE, object: nil)
    }
    
    @IBAction func LoginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN_SEGUE, sender: nil)
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}

    @objc func userDataDidChange(_ notification: Notification) {
        if AuthService.instance.isLoggedIn {
            LoginBtn.setTitle("\(UserDataService.instance.name)", for: .normal)
            userAvaterImg.image = UIImage(named: UserDataService.instance.avatarName)
            userAvaterImg.backgroundColor = UserDataService.instance.getUIColor(components: UserDataService.instance.avatarColor)
        } else {
            LoginBtn.setTitle("Login", for: .normal)
            userAvaterImg.image = UIImage(named: "menuProfileIcon")
            userAvaterImg.backgroundColor = UIColor.clear
        }
    }
}
