//
//  UIImageView.swift
// TesteSantander
//
//  Created by Anderson Silva on 04/11/20.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView{
    
    func asCircle(){
        self.layer.cornerRadius = self.frame.width / 2;
        self.layer.masksToBounds = true
    }
    
    func asCircleColor(color:UIColor) {
        self.layer.cornerRadius = self.frame.width / 2;
        self.layer.borderWidth = 1.0
        self.layer.borderColor = color.cgColor
        self.layer.masksToBounds = true
    }
    
    public enum Option {
        
        case fadeIn
        
        var value: KingfisherOptionsInfoItem {
            
            switch self {
            case .fadeIn:
                return .transition(.fade(0.3))
            }
        }
    }
    
    public func setup(with imageUrl: String?,
                      placeholder: String? = nil,
                      failedPlaceholder: String? = nil,
                      options: [Option] = [.fadeIn]) {
        
        guard
            let imageUrl = imageUrl,
            let url = URL(string: imageUrl) else {
            
            if let failedPlaceholder = failedPlaceholder {
                self.image = UIImage(named: failedPlaceholder)
            }
            
            return
        }
        
        var placeholderImage: UIImage?
        
        if let placeholder = placeholder {
            placeholderImage = UIImage(named: placeholder)
        }
        
        kf.setImage(with: url,
                    placeholder: placeholderImage,
                    options: options.map { $0.value },
                    completionHandler: { [weak self] result in
            
            guard
                let self = self,
                case .failure = result,
                let failedPlaceholder = failedPlaceholder
            else { return }
            
            self.image = UIImage(named: failedPlaceholder)
        })
    }
    
}
