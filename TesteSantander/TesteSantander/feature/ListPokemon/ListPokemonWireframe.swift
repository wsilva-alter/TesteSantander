//
//  LoginWireframe.swift
// TesteSantander
//
//  Created by Wildson Silva on 13/07/22.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation

class ListPokemonWireframe {
    
    var presenter: ListPokemonPresenter?

    static func setUp(vc: ListPokemonViewController) {

        let interactor = ListPokemonInteractor()
        let wireframe  = ListPokemonWireframe()
        let presenter  = ListPokemonPresenter(wireframe: wireframe, interactor: interactor)

        vc.presenterInterface = presenter
        interactor.output = presenter
        presenter.viewPresenterInterface = vc

    }
    
}
