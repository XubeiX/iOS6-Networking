//
//  CreateAccountVC.swift
//  Stalk
//
//  Created by Artur on 24/10/2018.
//  Copyright © 2018 Artur. All rights reserved.
//

import UIKit
import SVProgressHUD

class CreateAccountVC: UIViewController {

    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var userEmailTxt: UITextField!
    @IBOutlet weak var userPasswordTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(userImagePressed))
        userImage.isUserInteractionEnabled = true
        userImage.addGestureRecognizer(tapGestureRecognizer)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleKayboardExitTap))
        view.addGestureRecognizer(tap)
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColor == nil {
                userImage.backgroundColor = UIColor.lightGray
            }
        }
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
        
        guard  let name = userNameTxt.text, userNameTxt.text != "" else {
            return
        }
        
        SVProgressHUD.show()
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                SVProgressHUD.dismiss()
                                self.performSegue(withIdentifier: UNWIND_TO_CHANNEL_SEGUE, sender: nil)
                                NotificationCenter.default.post(name: NOTIFY_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
                    }
                })
            } else {
                debugPrint("Can't register user")
                SVProgressHUD.dismiss()
                SVProgressHUD.showError(withStatus: "User exist")
            }
        }
    }
    
    @IBAction func pickAwatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER_SEGUE, sender: nil)
    }
    @IBAction func pickBGColorPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r), \(g), \(b), 1]"
        UIView.animate(withDuration: 0.2) {
            self.userImage.backgroundColor = self.bgColor
        }
    }
    
    @objc func userImagePressed(){
        pickAwatarPressed(userImage)
    }
    
    @objc func handleKayboardExitTap() {
        view.endEditing(true)
    }
    
    func setupView() {
        userNameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: stalkPlaceholderColor])
        userEmailTxt.attributedPlaceholder = NSAttributedString(string: "e-mail", attributes: [NSAttributedString.Key.foregroundColor: stalkPlaceholderColor])
        userPasswordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: stalkPlaceholderColor])
    }
}
