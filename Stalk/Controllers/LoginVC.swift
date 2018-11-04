//
//  LoginVC.swift
//  Stalk
//
//  Created by Artur on 24/10/2018.
//  Copyright © 2018 Artur. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func CloseBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CreateAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT_SEGUE, sender: nil)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        guard let email = emailTxt.text, emailTxt.text != "" else { return }
        guard let password = passwordTxt.text, passwordTxt.text != "" else { return }
        
        SVProgressHUD.show()
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIFY_USER_DATA_DID_CHANGE, object: nil)
                        SVProgressHUD.dismiss()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            } else {
                debugPrint("Invalid user credential")
                SVProgressHUD.dismiss()
                SVProgressHUD.showError(withStatus: "Invalid email or password")
            }
        }
    }
    
    func setupView() {
        emailTxt.attributedPlaceholder = NSAttributedString(string: "e-mail", attributes: [NSAttributedString.Key.foregroundColor : stalkPlaceholderColor])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor : stalkPlaceholderColor])
    }
}
