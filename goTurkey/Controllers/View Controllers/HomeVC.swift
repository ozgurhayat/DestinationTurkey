//
//  HomeVC.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 29/06/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit
import MapKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categoryToPass: String!
    var categories: [CityCategory]!
    
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        customNavBar()
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        animateTable()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let categories = categories else {
            return 0
        }
        return categories.count
    }
    // TableViewCell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Segues.categoryCell, for: indexPath) as? CategoryCell {
            cell.configureCell(category: categories[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryToPass = categories[indexPath.row].title
        performSegue(withIdentifier: Segues.toRecipesSelection, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let informationVC = segue.destination as? InformationVC {
            informationVC.selectedCategory = categoryToPass
            print("pressed2")
        }
    }
    
    /// Mark: TableView animation
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
            cell.layer.transform = rotationTransform
            cell.alpha = 0
            UIView.animate(withDuration: 0.85) {
                cell.layer.transform = CATransform3DIdentity
                cell.alpha = 1
            }
        }
    
    /// Mark: TableView beginning animation
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells

        let tableViewHeight = tableView.bounds.size.height

        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.06, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
                }, completion: nil)
            delayCounter += 1
            }
        }

    @IBAction func myButton(_ sender: UIButton) {
        var superview = sender.superview
        while let view = superview, !(view is UITableViewCell) {
            superview = view.superview
        }
        guard let cell = superview as? UITableViewCell else {
            print("button is not contained in a table view cell")
            return
        }
        guard let indexPath = tableView.indexPath(for: cell) else {
            print("failed to get index path for cell containing button")
            return
        }
        print("button is in row \(indexPath.row)")
        
        // Map Call
        if indexPath.row == 0{
            selectedRow = 0
        }
        if indexPath.row == 1 {
            selectedRow = 1
        }
        if indexPath.row == 2 {
            selectedRow = 2
        }
        if indexPath.row == 3 {
            selectedRow = 3
        }
        if indexPath.row == 4 {
            selectedRow = 4
        }
        if indexPath.row == 5 {
            selectedRow = 5
        }
        if indexPath.row == 6 {
            selectedRow = 6
        }
        if indexPath.row == 7 {
            selectedRow = 7
        }
}

    func customNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .red
        navigationController?.hidesBarsOnSwipe = false
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    }
