//
//  LoginInteractor.swift
// TesteSantander
//
//  Created by Wildson Silva on 13/07/22.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation

protocol ListPokemonInteractorInput: AnyObject {
   func loadListPokemon(limit: Int, offset: Int)
}

protocol ListPokemonInteractorOutput: AnyObject {
    func fetchListPokemon(list: [Pokemon])
    func failure(error: String)
}

class ListPokemonInteractor: NSObject, ListPokemonInteractorInput {
    
    weak var output: ListPokemonInteractorOutput?
    
    private lazy var networkRequest: NetworkRequest = {
        return NetworkRequest.shared
    }()
    
    private lazy var provider: ListPokemonProvider = {
        return ListPokemonProvider()
    }()
    
    func loadListPokemon(limit: Int, offset: Int) {
        self.provider.getListPokemon(limit: limit, offset: offset){ [weak self] (result) in
            switch result {
            case .failure(let error):
                self?.output?.failure(error: error.localizedDescription)
            case .success(let data):
                guard let list: ListPokemon = data.decodableData() else {
                    self?.output?.failure(error: "Tente novamente.")
                    return
                }
                self?.output?.fetchListPokemon(list: list.results!)
                
            }
        }
    }
    
}
