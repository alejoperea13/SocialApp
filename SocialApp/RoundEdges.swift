//
//  RoundEdges.swift
//  SocialApp
//
//  Created by Alejandro perea on 1/5/17.
//  Copyright © 2017 alperi. All rights reserved.
//

import UIKit
@IBDesignable

class RoundEdges: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 10 {
        didSet{
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    func setupView(){
        layer.cornerRadius = cornerRadius
        layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor
        layer.borderWidth = 1
    }
    
    
}
