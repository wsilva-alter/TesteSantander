//
//  SwiftUIView.swift
//  monitoring-vitals-ios
//
//  Created by Wildson Silva on 7/2/20.
//  Copyright © 2020 Joao Neto. All rights reserved.
//

import Foundation

struct Ability: Serializable {
    let name: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
