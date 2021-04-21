//
//  CardView.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/21/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import UIKit

class ShadowCardView: UIView {
    
    let CORNER_RADIUS: CGFloat = 30

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = CORNER_RADIUS
        self.layer.masksToBounds = false
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: CORNER_RADIUS)
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowOffset = CGSize(width: 0.5, height: 1)
        self.layer.shadowOpacity = 0.25
        self.layer.shadowPath = shadowPath.cgPath
    }
    
}
