//
//  SwiftUIView.swift
//  monitoring-vitals-ios
//
//  Created by Wildson Silva on 7/2/20.
//  Copyright © 2020 Joao Neto. All rights reserved.
//

import Foundation

struct Abilities: Serializable {
    let ability: Ability?
    let is_hidden: Bool?
    let slot: Int?
    
    enum CodingKeys: String, CodingKey {
        case ability
        case is_hidden
        case slot
    }
}
