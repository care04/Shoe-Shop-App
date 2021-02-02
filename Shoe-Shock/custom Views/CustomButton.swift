//
//  CustomButton.swift
//  Shoe-Shock
//
//  Created by Care Farrar on 1/28/21.
//

import UIKit
@IBDesignable
class CustomButton: UIButton {
    
    override func prepareForInterfaceBuilder() {
        customization()
    }

    override func awakeFromNib() {
        customization()
    }

    func customization() {
        clipsToBounds = true
        layer.cornerRadius = frame.width / 2
    }
}
