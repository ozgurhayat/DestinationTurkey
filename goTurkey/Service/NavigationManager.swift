//
//  NavigationManager.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 20/10/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit

class NavigationManager {
    
    enum Screen {
        case onboarding
        case mainApp
    }
    
    func show(screen: Screen, inController: UIViewController) {
        var viewController: UIViewController!
        switch screen {
        case .onboarding:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: Segues.navigationBoard)
        case .mainApp:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: Segues.navigationVC)
        }
        if let sceneDelegate = inController.view.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window {
            window.rootViewController = viewController
        }
    }
}
