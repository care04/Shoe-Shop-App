//
//  ShopController.swift
//  Shoe-Shock
//
//  Created by Care Farrar on 1/29/21.
//

import UIKit

class ShopController: UITableViewController {
    @IBOutlet weak var addToCartBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        if addToCartBtn.isEnabled {
            addToCartBtn.tintColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        } else {
            addToCartBtn.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SHOES.Data.shoesInCart.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as? ShopTableCell {
            let shoe = SHOES.Data.shoesInCart[indexPath.row]
            cell.stepperOutlet.tag = indexPath.row
            cell.stepperOutlet.addTarget(self, action: #selector(stepperPressed(_:)), for: .valueChanged)
            cell.fillShopCell(shoe: shoe)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        var total: Int = 0
        viewDidLoad()
        for shoe in SHOES.Data.shoesInCart {
            total += shoe.price * shoe.amount
        }
        if total > 0 {
            addToCartBtn.isEnabled = true
            SHOES.Data.total = total
            return String(total)
        }
        addToCartBtn.isEnabled = false
        return "Add Some shoes to your cart"
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    @objc func stepperPressed(_ sender: UIStepper) {
        let index = sender.tag
        viewDidLoad()
        tableView.reloadData()
        if sender.value == 0 {
            SHOES.Data.shoesInCart.remove(at: index)
            tableView.reloadData()
        }
    }
}
