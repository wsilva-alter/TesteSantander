//
//  DetailPokemonPresenteTests.swift
//  PokemonTests
//
//  Created by Wildson  Santos on 24/11/22.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import XCTest
@testable import TesteSantander

class DetailPokemonPresenteTests: XCTestCase {
    
    private var wiframe:DetailPokemonWireframe!
    private var interact:DetailPokemonInteractorMock!
    private var presente:DetailPokemonPresenterMock!
    
    override func setUp() {
        self.wiframe = DetailPokemonWireframe()
        self.interact = DetailPokemonInteractorMock()
        
        self.presente = DetailPokemonPresenterMock(wireframe: self.wiframe, interactor: self.interact)
        
        self.interact.output = self.presente
    }
    
    override func setUpWithError() throws {
        self.presente = nil
        self.wiframe = nil
        self.interact = nil
    }

    override func tearDownWithError() throws {
        self.presente = nil
        self.wiframe = nil
        self.interact = nil
    }

    func testLoadDetail() throws {
        
        self.setUp()
        
        self.presente.loadDetailPokemon(id: 1)
        
        XCTAssertEqual(self.presente.detail!.id, 1)
        XCTAssertEqual(self.presente.detail!.name, "bulbasaur")
    }
    
    func testLoadListFailure() throws {
        
        self.presente.loadDetailPokemon(id: 2)
        
        XCTAssertEqual(self.presente.msgError, "Tente novamente.")
    }
    

}
