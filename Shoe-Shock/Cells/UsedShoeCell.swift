//
//  UsedShoeCell.swift
//  Shoe-Shock
//
//  Created by Care Farrar on 1/28/21.
//

import UIKit

class UsedShoeCell: UITableViewCell {
    @IBOutlet weak var conditionLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var heartCart: UIButton!
    func fillUsedShoeCell(shoe: Shoe) {
        conditionLbl.text = shoe.condition
        nameLbl.text = shoe.name
        priceLbl.text = "$\(shoe.price).00"
        myImage.image = UIImage(named: shoe.image)
        layer.cornerRadius = 10
        myImage.layer.cornerRadius = 10
        heartCart.setImage(UIImage(systemName: "heart"), for: .normal)
        heartCart.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        if SHOES.Data.shoesInCart.contains(shoe) {
            heartCart.isSelected = true
        } else {
            heartCart.isSelected = false
        }
    }
}
