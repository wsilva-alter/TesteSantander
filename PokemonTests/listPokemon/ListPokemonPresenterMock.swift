//
//  Presente.swift
//  PokemonTests
//
//  Created by Wildson  Santos on 23/11/22.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

@testable import TesteSantander

class ListPokemonPresenterMock: ListPokemonPresenterInterface, ListPokemonInteractorOutput {
    
    private(set) var interactor: ListPokemonInteractorInput
    private(set) var wireframe: ListPokemonWireframe
    
    var list: [Pokemon] = []
    var msgError = ""
    
    init(wireframe: ListPokemonWireframe, interactor: ListPokemonInteractorInput) {
        self.wireframe  = wireframe
        self.interactor = interactor
        
    }
    
    func loadListPokemon(limit: Int, offset: Int) {
        self.interactor.loadListPokemon(limit: limit, offset: offset)
    }
    
    func fetchListPokemon(list: [Pokemon]) {
        self.list = list
    }
    
    func failure(error: String) {
        self.msgError = error
    }
    
    
}
