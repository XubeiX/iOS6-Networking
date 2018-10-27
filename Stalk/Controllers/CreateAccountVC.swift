//
//  CreateAccountVC.swift
//  Stalk
//
//  Created by Artur on 24/10/2018.
//  Copyright © 2018 Artur. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var userEmailTxt: UITextField!
    @IBOutlet weak var userPasswordTxt: UITextField!
    
    
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(userImagePressed))
        userImage.isUserInteractionEnabled = true
        userImage.addGestureRecognizer(tapGestureRecognizer)
    }

    @IBAction func CloseButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL_SEGUE, sender: nil)
    }
    @IBAction func CreateAccoutPressed(_ sender: Any) {
        guard  let email = userEmailTxt.text, userEmailTxt.text != "" else {
            return
        }
        
        guard let password = userPasswordTxt.text, userPasswordTxt.text != "" else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        print("user is login", AuthService.instance.authToken);
                    }
                })
            }
        }
    }
    
    @IBAction func pickAwatarPressed(_ sender: Any) {
    }
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
    @objc func userImagePressed(){
        pickAwatarPressed(userImage)
    }
}
