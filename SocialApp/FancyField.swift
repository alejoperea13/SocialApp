//
//  FancyField.swift
//  SocialApp
//
//  Created by Alejandro perea on 1/7/17.
//  Copyright © 2017 alperi. All rights reserved.
//

import UIKit

class FancyField: UITextField {


    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.2).cgColor
        
        layer.borderWidth = 1
        
    }
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.insetBy(dx: 10, dy: 5)
        
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.insetBy(dx: 10, dy: 5)
    }
    

}
