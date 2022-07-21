//
//  ListPokemonFakeData.swift
//  TesteSantanderTests
//
//  Created by cliente on 19/07/2022.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

@testable import TesteSantander

enum ListPokemonFakeData {

    static var list: [Pokemon] = []
    
    func loadListPokemon(){
        ListPokemonFakeData.list.append(Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
        
        ListPokemonFakeData.list.append(Pokemon(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"))
        
        ListPokemonFakeData.list.append(Pokemon(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/"))
    }
}
