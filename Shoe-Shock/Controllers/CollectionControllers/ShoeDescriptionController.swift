//
//  ShoeDescriptionController.swift
//  Shoe-Shock
//
//  Created by Care Farrar on 1/29/21.
//

import UIKit

class ShoeDescriptionController: UIViewController {

    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var ShoeCondition: UILabel!
    @IBOutlet weak var shoeBrand: UILabel!
    @IBOutlet weak var shoeName: UILabel!
    @IBOutlet weak var shoePrice: UILabel!
    @IBOutlet weak var shoeDescription: UILabel!
    @IBOutlet weak var addShoeToCartBtn: UIButton!
    var shoe: Shoe!
    override func viewDidLoad() {
        super.viewDidLoad()
        shoeImage.image = UIImage(named: shoe.image)
        shoeBrand.text = shoe.brand
        ShoeCondition.text = shoe.condition
        shoeName.text = shoe.name
        shoePrice.text = "$\(shoe.price).00"
        shoeDescription.text = shoe.discrip
    }
    
    @IBAction func addToCartClicked(_ sender: Any) {
        if !SHOES.Data.shoesInCart.contains(shoe) {
            SHOES.Data.shoesInCart.append(shoe)
        }
    }
}
