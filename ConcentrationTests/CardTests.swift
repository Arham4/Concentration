//
//  CardTests.swift
//  Concentration
//
//  Created by Siddiqui, Arham J on 12/7/18.
//  Copyright © 2018 Siddiqui, Arham J. All rights reserved.
//

import XCTest
@testable import Concentration

class CardTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    func testCardCreation() {
        let card = Card(animal: Animal.giraffe)
        XCTAssertEqual(card.animal, Animal.giraffe)
    }
}
