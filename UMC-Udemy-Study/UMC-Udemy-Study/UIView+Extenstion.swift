//
//  UIView+Extenstion.swift
//  UMC-Udemy-Study
//
//  Created by Choi76 on 2023/10/02.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat { //모서리를 따기
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
