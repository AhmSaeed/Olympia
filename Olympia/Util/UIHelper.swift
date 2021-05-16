//
//  UIHelper.swift
//  Olympia
//
//  Created by Ahmed Morsy on 5/2/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import UIKit

class UIHelper {
    
    class func showAlert(at vc: UIViewController, title: String? = nil, message: String, handler: (()->())? = nil){
       let alert = UIAlertController(title: title , message: message, preferredStyle: UIAlertController.Style.alert)
        alert.view.tintColor = #colorLiteral(red: 1, green: 0.6070802808, blue: 0.2460106909, alpha: 1)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default){ _ in
            handler?()
        })
        vc.present(alert, animated: true, completion: nil)
    }
 
}
