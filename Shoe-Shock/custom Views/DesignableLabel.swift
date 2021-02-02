//
//  DesignableLabel.swift
//  Shoe-Shock
//
//  Created by Care Farrar on 1/28/21.
//

import UIKit
@IBDesignable
class DesignableLabel: UILabel {
    override func prepareForInterfaceBuilder() {
        turnLabel()
    }
    
    
    func turnLabel() {
        var transform: CGAffineTransform = CGAffineTransform(rotationAngle: 270)
        
        textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
    }

}
