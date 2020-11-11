//
//  DetailVC.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 29/06/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var locationImg: UIImageView!
    @IBOutlet weak var locationTitle: UILabel!
    @IBOutlet weak var locationInstructions: UITextView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var darkView: UIView!
    
    var selectedLocation: Informations!
    
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationImg.alpha = 1
        backButton.alpha = 0
        locationInstructions.alpha = 0
        locationTitle.alpha = 0

        locationImg.image = UIImage(named: selectedLocation.imageName)
        locationTitle.text = selectedLocation.title
        locationInstructions.text = selectedLocation.instructions
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    // Button and Button Animation
@IBAction func backButton(_ sender: UIButton) {
    UIView.animate(withDuration: 0.3, animations: {

    }) { _ in
        UIView.animate(withDuration: 0.5, animations: {
            self.locationImg.alpha = 1
            self.darkView.alpha = 0
            self.locationTitle.alpha = 0
            self.locationInstructions.alpha = 0
            sender.alpha = 0
        }, completion: { _ in
            
            self.dismiss(animated: true, completion: nil)
        })
    }
}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.5) {
        self.locationImg.alpha = 1
        self.darkView.alpha = 0
        self.locationTitle.alpha = 0
        self.locationInstructions.alpha = 0
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.darkView.alpha = 1
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Animation
    func setupUI() {
        UIView.animate(withDuration: 0.5) {
            self.darkView.backgroundColor = UIColor.init(white: 0.1, alpha: 0.5)
            self.backButton.alpha = 1
            self.locationInstructions.alpha = 1
            self.locationTitle.alpha = 1
            }
    }
    
    func loadData() {
        DispatchQueue.main.async {
            self.setupUI()
        }
    }
}
