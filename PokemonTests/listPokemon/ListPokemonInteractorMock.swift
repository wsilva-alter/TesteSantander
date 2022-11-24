//
//  ListPokemonFakeData.swift
//  TesteSantanderTests
//
//  Created by cliente on 19/07/2022.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

@testable import TesteSantander

class ListPokemonInteractorMock: ListPokemonInteractorInput  {
    weak var output: ListPokemonInteractorOutput?
    
    func loadListPokemon(limit: Int, offset: Int) {
        if(limit != -1){
            var list: [Pokemon] = []
            
            list.append(Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
            list.append(Pokemon(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"))
            list.append(Pokemon(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/"))
            
            self.output?.fetchListPokemon(list: list)
        }else{
            self.output?.failure(error: "Tente novamente.")
        }
    }
}
