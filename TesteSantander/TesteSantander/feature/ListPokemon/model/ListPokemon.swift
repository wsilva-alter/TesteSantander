//
//  SwiftUIView.swift
//  monitoring-vitals-ios
//
//  Created by Wildson Silva on 7/2/20.
//  Copyright © 2020 Joao Neto. All rights reserved.
//

import Foundation

struct ListPokemon: Serializable {
    let count:Int?
    let next:String?
    let previous:String?
    let results: [Pokemon]?

    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
}
