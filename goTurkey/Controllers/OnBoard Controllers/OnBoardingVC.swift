//
//  OnBoardingVC.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 20/10/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var darkView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var items: [OnboardingItem] = []
    private var currentPage: Int = 0
    private var isOnboardingSeen: Bool!
    
    private let storageManager = StorageManager()
    private let navigationManager = NavigationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlaceholderItems()
        setupPageControl()
        setupScreen(index: currentPage)
        updateBackgroundImage(index: currentPage)
        setupGestures()
        setupViews()
        updateFlag()
        
    }
    
    private func updateFlag() {
        storageManager.setOnboardingSeen()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    
    private func setupPlaceholderItems() {
        items = OnboardingItem.placeholderItems
    }
    
    private func setupViews() {
        darkView.backgroundColor = UIColor.init(white: 0.1, alpha: 0.4)
    }
    
    private func updateBackgroundImage(index: Int) {
        let image = items[index].bgImage
        UIView.transition(with: bgImageView,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: { self.bgImageView.image = image },
                          completion: nil)
        
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = items.count
    }
    
    private func setupScreen(index: Int) {
        titleLabel.text = items[index].title
        detailLabel.text = items[index].detail
        pageControl.currentPage = index
        titleLabel.alpha = 1.0
        detailLabel.alpha = 1.0
        titleLabel.transform = .identity
        detailLabel.transform = .identity
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTapAnimation() {
        
        // first animation - title label
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            
            self.titleLabel.alpha = 0.8
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { _ in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -550)
            }, completion: nil)
        }
        
        // second animation - detail label
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.detailLabel.alpha = 0.8
            self.detailLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { _ in
            
            if self.currentPage < self.items.count - 1 {
                self.updateBackgroundImage(index: self.currentPage + 1)
            }
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.detailLabel.alpha = 0
                self.detailLabel.transform = CGAffineTransform(translationX: 0, y: -550)
            }) { _ in
                self.currentPage += 1
                if self.isOverLastItem() {
                    self.showMainApp()
                } else {
                    self.setupScreen(index: self.currentPage)
                }
            }
        }
    }
    
    private func isOverLastItem() -> Bool {
        return currentPage == self.items.count
    }
    
    private func showMainApp() {
        let viewController = storyboard?.instantiateViewController(identifier: Segues.mainVC)
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }

}
