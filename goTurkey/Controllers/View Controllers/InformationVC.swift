//
//  InformationVC.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 29/06/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit


class InformationVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedCategory: String!
    var cityDetails: [Informations]!
    let data = DataSet()
    var citiesToPass: Informations!
    
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        cityDetails = data.getInformations(forCategoryTitle: selectedCategory)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    //CollectionViewCells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityDetails.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Segues.cityCell, for: indexPath) as? CityCell {
            let details = cityDetails[indexPath.item]
            cell.configureCell(location: details)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        let cellDimension = (width / 2) - 15
        return CGSize(width: cellDimension, height: cellDimension)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        citiesToPass = cityDetails[indexPath.item]
        performSegue(withIdentifier: Segues.toCitiesSelection, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? DetailVC {
            detailsVC.selectedLocation = citiesToPass
            
            print("Cities")
        }
    }
}
