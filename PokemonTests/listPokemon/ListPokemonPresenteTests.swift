//
//  PokemonTests.swift
//  PokemonTests
//
//  Created by Wildson  Santos on 23/11/22.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import XCTest
@testable import TesteSantander

class ListPokemonPresenteTests: XCTestCase {
    
    private var wiframe:ListPokemonWireframe!
    private var interact:ListPokemonInteractorMock!
    private var presente:ListPokemonPresenterMock!
    
    override func setUp() {
        self.wiframe = ListPokemonWireframe()
        self.interact = ListPokemonInteractorMock()
        
        self.presente = ListPokemonPresenterMock(wireframe: self.wiframe, interactor: self.interact)
        
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

    func testLoadList() throws {
        self.setUp()
        
        self.presente.loadListPokemon(limit: 3, offset: 0)
        
        XCTAssertEqual(self.presente.list.count, 3)
    }
    
    func testLoadListFailure() throws {
        self.setUp()
        
        self.presente.loadListPokemon(limit: -1, offset: 0)
        
        XCTAssertEqual(self.presente.msgError, "Tente novamente.")
    }
    

}
