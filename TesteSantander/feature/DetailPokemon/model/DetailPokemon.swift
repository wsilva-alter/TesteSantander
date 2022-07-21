//
//  SwiftUIView.swift
//  monitoring-vitals-ios
//
//  Created by Wildson Silva on 7/2/20.
//  Copyright © 2020 Joao Neto. All rights reserved.
//

import Foundation

struct DetailPokemon: Serializable {
    let id: Int?
    let base_experience: Int?
    let height: Int?
    let weight: Int?
    let order: Int?
    let is_default: Bool?
    let name: String?
    let abilities: [Abilities]?
    let forms: [Form]?
    let types: [Types]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case base_experience
        case height
        case weight
        case order
        case is_default
        case name
        case abilities
        case forms
        case types
    }
}
