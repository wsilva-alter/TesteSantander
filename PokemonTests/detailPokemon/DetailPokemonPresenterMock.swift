//
//  DetailPokemonPresenterMock.swift
//  PokemonTests
//
//  Created by Wildson  Santos on 24/11/22.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

@testable import TesteSantander

class DetailPokemonPresenterMock: DetailPokemonPresenterInterface, DetailPokemonInteractorOutput {
    private(set) var interactor: DetailPokemonInteractorInput
    private(set) var wireframe: DetailPokemonWireframe
    
    var detail: DetailPokemon!
    var msgError = ""

    init(wireframe: DetailPokemonWireframe, interactor: DetailPokemonInteractorInput) {
        self.wireframe  = wireframe
        self.interactor = interactor
    }
    
    func loadDetailPokemon(id: Int) {
        
        self.interactor.loadDetailPokemon(id: id)
    }
    
    func fetchDetailPokemon(detail: DetailPokemon) {
        self.detail = detail
    }
    
    func failure(error: String) {
        self.msgError = error
    }

    
}
