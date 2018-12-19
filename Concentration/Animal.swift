//
//  Animal.swift
//  Concentration
//
//  Created by Siddiqui, Arham J on 12/7/18.
//  Copyright © 2018 Siddiqui, Arham J. All rights reserved.
//
import Foundation
enum Animal: UInt32 {
    case giraffe
    case monkey
    case snake
    case lion
    case squirrel
    case zebra
    case dog
    case narwhal
    case cow
    case panda
    case sheep
    case elephant
    case frog
    case chicken
    case bat
    case dinosaur
    case bird
    case turtle
    
    static func random() -> Animal {
        return Animal(rawValue: arc4random_uniform(turtle.rawValue + 1))!
    }
}


