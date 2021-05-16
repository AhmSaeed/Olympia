//
//  DesignableShadowView.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/27/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableShadowView: UIView {
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowCornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = shadowCornerRadius
        }
    }
    
    @IBInspectable var shadowOpacity: CGFloat  = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
    
    @IBInspectable var shadowOffsetx: CGFloat = 0 {
        didSet {
            layer.shadowOffset.width = shadowOffsetx
        }
    }
}
