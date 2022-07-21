//
//  OcsPresenter.swift
// TesteSantander
//
//  Created by Wildson Silva on 11/07/20.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation

protocol DetailPokemonPresenterInterface: class {
    func loadDetailPokemon(id: Int)
}

protocol DetailPokemonPresenterViewInterface: class {
    func fetchDetailPokemon(detail:DetailPokemon)
    func failure(msg: String)
}

class DetailPokemonPresenter: NSObject, DetailPokemonPresenterInterface, DetailPokemonInteractorOutput {
    
    private(set) var interactor: DetailPokemonInteractorInput
    private(set) var wireframe: DetailPokemonWireframe
    private var appSession: AppSession

    weak var viewPresenterInterface: DetailPokemonPresenterViewInterface?

    init(wireframe: DetailPokemonWireframe, interactor: DetailPokemonInteractorInput) {
        self.wireframe  = wireframe
        self.interactor = interactor
        self.appSession = AppSession.shared
    }
    
    func loadDetailPokemon(id: Int) {
        self.interactor.loadDetailPokemon(id: id)
    }
    
    func fetchDetailPokemon(detail: DetailPokemon) {
        self.viewPresenterInterface?.fetchDetailPokemon(detail: detail)
    }
    
    func failure(error: String) {
        self.viewPresenterInterface?.failure(msg: error)
    }

}
