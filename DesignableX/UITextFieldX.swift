//
//  DesignableUITextField.swift
//  SkyApp
//
//  Created by Mark Moeykens on 12/16/16.
//  Copyright © 2016 Mark Moeykens. All rights reserved.
//

import UIKit

@IBDesignable

class UITextViewX: UITextView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var rotationAngle: CGFloat = 0 {
        didSet {
            self.transform = CGAffineTransform(rotationAngle: rotationAngle * .pi / 180)
        }
    }

    // MARK: - Shadow Text Properties

    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }

    @IBInspectable public var shadowColorLayer: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColorLayer.cgColor
        }
    }

    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable public var shadowOffsetLayer: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = shadowOffsetLayer
        }
    }
}
