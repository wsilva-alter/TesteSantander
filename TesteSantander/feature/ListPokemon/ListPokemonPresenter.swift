//
//  LoginPresenter.swift
// TesteSantander
//
//  Created by Wildson Silva on 13/07/22.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation
import LocalAuthentication

protocol ListPokemonPresenterInterface: AnyObject {
    func loadListPokemon(limit: Int, offset: Int)
}

protocol ListPokemonPresenterViewInterface: AnyObject {
    func fetchListPokemon(list: [Pokemon])
    func failure(msg: String)
    func openItemDetail(index:Int)
    func countList() -> Int
}

class ListPokemonPresenter: NSObject, ListPokemonPresenterInterface, ListPokemonInteractorOutput {
        
    private(set) var interactor: ListPokemonInteractorInput
    private(set) var wireframe: ListPokemonWireframe
    
    weak var viewPresenterInterface: ListPokemonPresenterViewInterface?
    
    private var appSession = AppSession.shared
    
    init(wireframe: ListPokemonWireframe, interactor: ListPokemonInteractorInput) {
        self.wireframe  = wireframe
        self.interactor = interactor
    }
    
    func loadListPokemon(limit: Int, offset: Int) {
        self.interactor.loadListPokemon(limit: limit, offset: offset)
    }
    
    func fetchListPokemon(list: [Pokemon]) {
        self.viewPresenterInterface?.fetchListPokemon(list: list)
    }
    
    func failure(error: String) {
        self.viewPresenterInterface?.failure(msg: error)
    }
    
    
}
