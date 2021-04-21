//
//  DateTimeView.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/21/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import UIKit

class DateTimeView: UIView {
    
    let CORNER_RADIUS: CGFloat = 12

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
    }

}
