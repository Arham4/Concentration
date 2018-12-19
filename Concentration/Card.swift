//
//  Card.swift
//  Concentration
//
//  Created by Siddiqui, Arham J on 12/7/18.
//  Copyright © 2018 Siddiqui, Arham J. All rights reserved.
//

struct Card {
    let animal: Animal
    
    static func == (card1: Card, card2: Card) -> Bool {
        return card1.animal == card2.animal
    }
}
