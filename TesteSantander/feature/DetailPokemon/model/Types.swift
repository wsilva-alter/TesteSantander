//
//  SwiftUIView.swift
//  monitoring-vitals-ios
//
//  Created by Wildson Silva on 7/2/20.
//  Copyright © 2020 Joao Neto. All rights reserved.
//

import Foundation

struct Types: Serializable {
    let slot: Int?
    let type: DataObjs?
    
    enum CodingKeys: String, CodingKey {
        case slot
        case type
    }
}
