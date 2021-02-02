//
//  TopShoeCells.swift
//  Shoe-Shock
//
//  Created by Care Farrar on 1/28/21.
//

import UIKit
class TopShoeCells: UICollectionViewCell {
    @IBOutlet weak var heartCartBtn: UIButton!
    @IBOutlet weak var brandLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    func fillCell(shoe: Shoe) {
        brandLbl.text = shoe.brand
        nameLbl.text = shoe.name
        priceLbl.text = "$\(shoe.price).00"
        imageView.image = UIImage(named: shoe.image)
        layer.cornerRadius = 10
        imageView.layer.cornerRadius = 10
        heartCartBtn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        heartCartBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        if SHOES.Data.shoesInCart.contains(shoe) {
            heartCartBtn.isSelected = true
        } else {
            heartCartBtn.isSelected = false
        }
    }
}
