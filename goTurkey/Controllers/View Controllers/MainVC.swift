//
//  MainVC.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 30/06/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var warningTextView: UITextView!
    @IBOutlet var warningView: UIView!
    @IBOutlet weak var virsualEffectView: UIVisualEffectView!
    @IBOutlet weak var mainTableView: UITableView!

    var effect: UIVisualEffect!
    var data = DataSet()
    var categories: [CityCategory]!
    var cityToPass: AttractionItems!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        effect = virsualEffectView.effect
        virsualEffectView.effect = nil
        
        customNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        animateTable()
    }
    
    //MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.menuCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let mainCell = tableView.dequeueReusableCell(withIdentifier: Segues.mainCategoryCell, for: indexPath) as? MainCell {
             mainCell.configure(category: data.menuCategory[indexPath.row])

             return mainCell
         }
         return UITableViewCell()
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedRow = indexPath.row
        if selectedRow == 4 {
            self.view.bringSubviewToFront(warningView)
            self.view.sendSubviewToBack(mainTableView)
            animateIn()
            self.warningView.alpha = 1
            virsualEffectView.isHidden = false
            self.warningView.layer.cornerRadius = 14
        }
        if selectedRow == 3 {
            let viewController = storyboard?.instantiateViewController(identifier: Segues.videoVC)
            self.navigationController?.pushViewController(viewController!, animated: true)
        }
        if selectedRow == 1 {
            let viewController = storyboard?.instantiateViewController(identifier: "AttractionVC")
            self.navigationController?.pushViewController(viewController!, animated: true)
        }
        if selectedRow == 0 {
            performSegue(withIdentifier: Segues.toHomeVC, sender: self)
        }
        if selectedRow == 2 {
            let viewController = storyboard?.instantiateViewController(identifier: "GastronomyVC")
            self.navigationController?.pushViewController(viewController!, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toHomeVC {
            if let indexPath = mainTableView.indexPathForSelectedRow {
                let selectedRow = indexPath.row
                let destinationVC = segue.destination as! HomeVC
                
                if selectedRow == 0 {
                    destinationVC.categories = data.mainCategory
                }
            }
        }
    }
    
    //MARK: TableView animation
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.85) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1
        }
    }
    
    //MARK: TableView beginning animation
    func animateTable() {
        mainTableView.reloadData()
        let cells = mainTableView.visibleCells
        let tableViewHeight = mainTableView.bounds.size.height
        
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
    
    //MARK: Navigation
    fileprivate func customNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .red
        navigationController?.hidesBarsOnSwipe = false
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //MARK: UIButtonAnimate
    func animateIn() {
        self.view.addSubview(warningView)
        warningView.center = self.view.center
        
        warningView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        warningView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.virsualEffectView.effect = self.effect
            self.warningView.alpha = 1
            self.warningView.transform = CGAffineTransform.identity
            self.warningTextView.text = "Find local restaurants & bars. Show your app and save up to %10 discount list of selected restaurants. Upcoming Soon!"
        }
    }
    
    //MARK: UIButton Animation Out
    func animateOut() {
        UIView.animate(withDuration: 0.4, animations: {
            self.warningView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.warningView.alpha = 0

            self.virsualEffectView.effect = nil
            self.warningView.sendSubviewToBack(self.mainTableView)
            
        }) { (success: Bool ) in
            self.warningView.removeFromSuperview()
        }
    }
    
    @IBAction func dismissPopOutButton(_ sender: Any) {
        animateOut()
//        self.view.bringSubviewToFront(mainTableView)
        self.view.sendSubviewToBack(virsualEffectView)
    }
}
