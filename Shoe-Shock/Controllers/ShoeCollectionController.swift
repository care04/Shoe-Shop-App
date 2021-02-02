//
//  ShoeCollectionController.swift
//  Shoe-Shock
//
//  Created by Care Farrar on 1/29/21.
//

import UIKit

class ShoeCollectionController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell =
        let cellOne = collectionView.dequeueReusableCell(withReuseIdentifier: "CellOne", for: indexPath)
            let cellTwo = collectionView.dequeueReusableCell(withReuseIdentifier: "CellTwo", for: indexPath)
        cellOne.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        cellTwo.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        return cellOne
        return cellTwo
    }
    
    
    @IBOutlet weak var collectionOne: UICollectionView!
    @IBOutlet weak var collectionTwo: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //dataDelegate(view: collectionOne)
        dataDelegate(view: collectionTwo)
    }
    func dataDelegate(view: UICollectionView) {
        view.delegate = self
        view.dataSource = self
    }
    

}
