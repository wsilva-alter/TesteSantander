//
//  ButtonStyle.swift
//  TesteSantander
//
//  Created by Wildson Santos on 10/07/20.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonStyle: UIButton {

    let gradientLayer = CAGradientLayer()
    
    @IBInspectable var shadowOffsetWidth: Int = 0 {
        didSet {
            self.layer.shadowOffset = CGSize(width: shadowOffsetWidth,
                                             height: shadowOffsetHeight)
        }
    }
            
    @IBInspectable var shadowOffsetHeight: Int = 2 {
        didSet {
            self.layer.shadowOffset = CGSize(width: shadowOffsetWidth,
                                             height: shadowOffsetHeight)
        }
    }
    
    @IBInspectable var shadowColorCV: UIColor? = UIColor.black {
        didSet {
            self.layer.shadowColor = shadowColorCV?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            setNeedsLayout()
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColorCV: UIColor? {
        didSet {
            layer.borderColor = borderColorCV?.cgColor
        }
    }

    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }

    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }

    private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }

}


