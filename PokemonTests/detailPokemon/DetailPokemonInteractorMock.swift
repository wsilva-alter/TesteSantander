//
//  DetailPokemonInteractorMock.swift
//  PokemonTests
//
//  Created by Wildson  Santos on 24/11/22.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//
@testable import TesteSantander

class DetailPokemonInteractorMock: DetailPokemonInteractorInput {
   
    weak var output: DetailPokemonInteractorOutput?
    
    private lazy var provider: DetailPokemonProvider = {
        return DetailPokemonProvider()
    }()
    
    func loadDetailPokemon(id: Int) {
        if(id == 1){
            let detail = DetailPokemon(id: 1,
                                   base_experience: 64,
                                   height: 7,
                                   weight: 69,
                                   order: 1,
                                   is_default: true,
                                   name: "bulbasaur",
                                   abilities: [],
                                   forms: [],
                                   types: [])

            self.output?.fetchDetailPokemon(detail: detail)
        }else{
            self.output?.failure(error: "Tente novamente.")
        }
    }
    
}
