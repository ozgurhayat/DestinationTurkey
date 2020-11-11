//
//  StorageManager.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 20/10/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import Foundation

class StorageManager {
    
    enum Key: String {
        case onboardingSeen
    }
    
    func isOnboardingSeen() -> Bool {
        UserDefaults.standard.bool(forKey: Key.onboardingSeen.rawValue)
    }
    
    func setOnboardingSeen() {
        UserDefaults.standard.set(true, forKey: Key.onboardingSeen.rawValue)
    }
    
    func resetOnboardingSeen() {
        UserDefaults.standard.set(false, forKey: Key.onboardingSeen.rawValue)
    }
    
}

