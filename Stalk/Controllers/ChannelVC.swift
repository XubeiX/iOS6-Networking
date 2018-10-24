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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - SWRevealViewMargin
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN_SEGUE, sender: nil)
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}

}
