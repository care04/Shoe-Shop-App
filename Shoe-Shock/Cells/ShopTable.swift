//
//  ShopTable.swift
//  Shoe-Shock
//
//  Created by Care Farrar on 1/29/21.
//

import UIKit

class ShopTableCell: UITableViewCell {
    
    @IBOutlet weak var stepperOutlet: UIStepper!
    
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeName: UILabel!
    @IBOutlet weak var brand: UILabel!
    
    @IBOutlet weak var amount: UILabel!
    var shoePrice = 1
    var shoeCount = 1
    @IBOutlet weak var price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillShopCell(shoe: Shoe) {
        shoeImage.image = UIImage(named: shoe.image)
        shoeName.text = shoe.name
        brand.text = shoe.brand
        amount.text = String(shoe.amount)
        price.text = String(shoe.price * shoe.amount)
        shoePrice = shoe.price
    }

    @IBAction func addOrTakeShoe(_ sender: UIStepper) {
        let index = sender.tag
        var shoe = SHOES.Data.shoesInCart[index]
        shoe.amount = Int(sender.value)
        amount.text = String(shoe.amount)
        price.text = String(shoe.price * shoe.amount)
        SHOES.Data.shoesInCart.remove(at: index)
        SHOES.Data.shoesInCart.insert(shoe, at: index)
    }
    
}
