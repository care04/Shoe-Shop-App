//
//  ViewController.swift
//  Shoe-Shock
//
//  Created by Care Farrar on 1/27/21.
//

import UIKit
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    @IBOutlet weak var TopShoeCollection: UICollectionView!
    @IBOutlet weak var usedShoeTable: UITableView!
    @IBOutlet weak var sideStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        usedStuff(collection: TopShoeCollection)
        usedShoeTable.delegate = self
        usedShoeTable.dataSource = self
        sideStackView.transform = CGAffineTransform(rotationAngle: 3.14 / 2 * 3)
        TopShoeCollection.reloadData()
        usedShoeTable.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewDidLoad()
    }
    var shoes = [SHOES.Data.Puma, SHOES.Data.Addidas, SHOES.Data.Jordan, SHOES.Data.Nike]
    var NewShoeCollection = SHOES.Data.Nike
    var usedShoeCollection = SHOES.Data.usedShoes
    @IBAction func SideBarButtons(_ sender: Any) {
        if (sender as AnyObject).tag == 1 {
            NewShoeCollection = selectBrand(shoe: Data.upcoming)
            viewDidLoad()
        }
    }
    
    @IBAction func relaodDiscoverShoes(_ sender: UIButton) {
        if sender.tag == 1 {
            NewShoeCollection = selectBrand(shoe: Data.Nike)
            viewDidLoad()
        } else if sender.tag == 2 {
            NewShoeCollection = selectBrand(shoe: Data.Addidas)
            viewDidLoad()
        } else if sender.tag == 3 {
            NewShoeCollection = selectBrand(shoe: Data.Jordan)
            viewDidLoad()
        }else {
            NewShoeCollection = selectBrand(shoe: Data.Puma)
            viewDidLoad()
        }
    }
    
 
    
    var type: Brand! = .Nike
    var Data = SHOES.Data
    func selectBrand(shoe: [Shoe]) -> [Shoe] {
        return shoe
    }
    func usedStuff(collection: UICollectionView) {
        collection.delegate = self
        collection.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NewShoeCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopShoeCells", for: indexPath) as? TopShoeCells {
            let shoe = NewShoeCollection[indexPath.row]
            cell.fillCell(shoe: shoe)
            cell.heartCartBtn.tag = indexPath.item
            cell.heartCartBtn.addTarget(self, action: #selector(heartButtonPressed(_:)), for: .touchUpInside)
            return cell
        } 
        return UICollectionViewCell()
    }
    
    @objc func heartButtonPressed(_ sender: UIButton) {
        let index = sender.tag
        let cartShoe = NewShoeCollection[index]
        if sender.isSelected {
            sender.isSelected = false
            if !Data.shoesInCart.isEmpty {
                guard let other = Data.shoesInCart.firstIndex(of: cartShoe) else { return }
                Data.shoesInCart.remove(at: other)
            }
        } else {
            sender.isSelected = true
            SHOES.Data.shoesInCart.append(NewShoeCollection[sender.tag])
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "ShoeDescriptionController") as? ShoeDescriptionController? {
            controller?.shoe = NewShoeCollection[indexPath.item]
            present(controller!, animated: true, completion: nil)
        }
    }
    
    @IBAction func unwindToShop(uwnindSegue: UIStoryboardSegue) {
        viewWillAppear(true)
    }
    
   
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.usedShoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UsedShoeCell", for: indexPath) as? UsedShoeCell {
            cell.heartCart.tag = indexPath.item
            cell.heartCart.addTarget(self, action: #selector(heartToCart(_:)), for: .touchUpInside)
            cell.fillUsedShoeCell(shoe: SHOES.Data.usedShoes[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "ShoeDescriptionController") as? ShoeDescriptionController? {
            controller?.shoe = usedShoeCollection[indexPath.row]
            present(controller!, animated: true, completion: nil)
        }
    }
    @objc func heartToCart(_ sender: UIButton) {
        let index = sender.tag
        let cartShoe = usedShoeCollection[index]
        if sender.isSelected {
            sender.isSelected = false
            if !Data.shoesInCart.isEmpty {
                guard let other = Data.shoesInCart.firstIndex(of: cartShoe) else { return }
                Data.shoesInCart.remove(at: other)
            }
        } else {
            sender.isSelected = true
            SHOES.Data.shoesInCart.append(usedShoeCollection[sender.tag])
        }
    }
    
    
    
}
