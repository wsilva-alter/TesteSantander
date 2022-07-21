//
//  OcsWireframe.swift
// TesteSantander
//
//  Created by Wildson Silva on 11/07/20.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation

class DetailPokemonWireframe {
    
    var presenter: DetailPokemonPresenter?

    static func setUp(vc: DetailPokemonViewController) {

        let interactor = DetailPokemonInteractor()
        let wireframe  = DetailPokemonWireframe()
        let presenter  = DetailPokemonPresenter(wireframe: wireframe, interactor: interactor)

        vc.presenterInterface = presenter
        interactor.output = presenter
        presenter.viewPresenterInterface = vc

    }
}
