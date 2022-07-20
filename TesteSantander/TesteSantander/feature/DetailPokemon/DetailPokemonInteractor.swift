//
//  DetailPokemonInteractor.swift
// TesteSantander
//
//  Created by Wildson Silva on 19/07/22.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation

protocol DetailPokemonInteractorInput: class {
    func loadDetailPokemon(id: Int)
}

protocol DetailPokemonInteractorOutput: class {
    func fetchDetailPokemon(detail: DetailPokemon)
    func failure(error: String)
}

class DetailPokemonInteractor: NSObject, DetailPokemonInteractorInput {
   
    weak var output: DetailPokemonInteractorOutput?
    
    private lazy var provider: DetailPokemonProvider = {
        return DetailPokemonProvider()
    }()
    
    func loadDetailPokemon(id: Int) {
        self.provider.getDetailPokemon(id:id){ [weak self] (result) in
            switch result {
            case .failure(let error):
                self?.output?.failure(error: error.localizedDescription)
            case .success(let data):
                guard let detail: DetailPokemon = data.decodableData() else {
                    self?.output?.failure(error: "Tente novamente.")
                    return
                }
                self?.output?.fetchDetailPokemon(detail:detail)
                
            }
        }
    }
    
}
