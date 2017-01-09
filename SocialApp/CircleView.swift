//
//  CircleView.swift
//  SocialApp
//
//  Created by Alejandro perea on 1/8/17.
//  Copyright © 2017 alperi. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func awakeFromNib() {
        
        super.awakeFromNib()

        
    }

    override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = self.frame.width / 2
        
    }
    
    
}
