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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - SWRevealViewMargin
        // Do any additional setup after loading the view.
    }
    


}
