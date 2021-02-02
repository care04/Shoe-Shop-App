//
//  PurchaseCompleteController.swift
//  Shoe-Shock
//
//  Created by Care Farrar on 2/2/21.
//

import UIKit

class PurchaseCompleteController: UIViewController {

    @IBOutlet weak var TotalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        TotalLabel.text = "$\(SHOES.Data.total).00"
        SHOES.Data.shoesInCart.removeAll()
        SHOES.Data.total = 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
