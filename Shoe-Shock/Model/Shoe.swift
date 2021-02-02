//
//  Shoe.swift
//  Shoe-Shock
//
//  Created by Care Farrar on 1/28/21.
//

import Foundation
enum Brand {
    case Nike, Addidas, Jordan, Puma
}
struct Shoe: Equatable{
    var image: String
    var brand: String
    var condition: String
    var name: String
    var price: Int
    var discrip: String
    var amount: Int = 1
    
    static func ==(lhs: Shoe, rhs: Shoe) -> Bool {
        return lhs.image == rhs.image && lhs.name == rhs.name
    }
}



