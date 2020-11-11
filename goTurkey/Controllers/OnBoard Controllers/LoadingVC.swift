//
//  LoadingVC.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 20/10/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    private var isOnboardingSeen: Bool!
    
    private let navigationManager = NavigationManager()
    private let storageManager = StorageManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        isOnboardingSeen = storageManager.isOnboardingSeen()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showInitialScreen()
    }

    private func showInitialScreen() {
        if isOnboardingSeen {
            navigationManager.show(screen: .mainApp, inController: self)
        } else {
            navigationManager.show(screen: .onboarding, inController: self)
        }
    }
    
}
