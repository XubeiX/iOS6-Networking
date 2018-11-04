//
//  CircleImage.swift
//  Stalk
//
//  Created by Artur on 03/11/2018.
//  Copyright © 2018 Artur. All rights reserved.
//

import UIKit
@IBDesignable
class CircleImage: UIImageView {
    
    override var image: UIImage? {
        didSet {
            super.image = image
            setupView()
        }
    }
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
}
