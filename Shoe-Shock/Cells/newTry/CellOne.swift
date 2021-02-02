//
//  CellOne.swift
//  Shoe-Shock
//
//  Created by Care Farrar on 1/29/21.
//

import UIKit

class CellOne: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    func fillTitle() {
        title.text = "Cell One Working"
    }
}
