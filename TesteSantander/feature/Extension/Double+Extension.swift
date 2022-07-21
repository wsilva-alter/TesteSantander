//
//  Double+Extension.swift
// TesteSantander
//
//  Created by Anderson Silva on 27/11/20.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation

extension Double {
    
    var formatCurrency: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.locale = Locale(identifier: Locale.current.identifier)
        let result = formatter.string(from: self as NSNumber)
        return result
    }
    
}
