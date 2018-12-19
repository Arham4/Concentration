//
//  BoardController.swift
//  Concentration
//
//  Created by Siddiqui, Arham J on 12/11/18.
//  Copyright © 2018 Siddiqui, Arham J. All rights reserved.
//

import UIKit

// dimensions:
// easy: 3x4
// medium: 4x6
// hard: 6x6
class BoardController: UIViewController {
    var columns = 4
    var rows = 3
    var score = 0
    
    @IBOutlet var rowStackView: UIStackView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        constructCards()
    }
    
    override func prepare(for: UIStoryboardSegue, sender: Any?) {
        print("called")
    }
    
    private func constructCards() {
        for _ in 1...rows {
            let row = UIStackView()
            rowStackView.addArrangedSubview(row)
            row.axis = NSLayoutConstraint.Axis.horizontal
            row.distribution = UIStackView.Distribution.fillEqually
            row.spacing = 4
            row.translatesAutoresizingMaskIntoConstraints = false
            row.widthAnchor.constraint(equalTo: rowStackView.widthAnchor).isActive = true
            row.trailingAnchor.constraint(equalTo: rowStackView.trailingAnchor).isActive = true
            row.leadingAnchor.constraint(equalTo: rowStackView.leadingAnchor).isActive = true
            for _ in 1...columns {
                let view = UIView()
                row.addArrangedSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
                view.heightAnchor.constraint(equalTo: row.heightAnchor).isActive = true
                
                let cardStackView = UIStackView()
                view.addSubview(cardStackView)
                cardStackView.axis = NSLayoutConstraint.Axis.vertical
                cardStackView.contentMode = UIView.ContentMode.scaleAspectFit
                cardStackView.distribution = UIStackView.Distribution.fillEqually
                cardStackView.translatesAutoresizingMaskIntoConstraints = false
                cardStackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                cardStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                cardStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
                cardStackView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
                cardStackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
                
                changeViewBackground(view, imageName: "blankCard")
                
                let card = Card(animal: Animal.random())
                let attributeImage = findCardImage(card: card)
                
                let imageView = UIImageView()
                imageView.contentMode = UIView.ContentMode.scaleAspectFit
                imageView.translatesAutoresizingMaskIntoConstraints = false
                cardStackView.addArrangedSubview(imageView)
                imageView.image = attributeImage
                imageView.widthAnchor.constraint(equalTo: cardStackView.widthAnchor, constant: 0).isActive = true
            
            }

        }
    }
    
    private func changeViewBackground(_ view: UIView, imageName: String) {
        let backgroundImage = UIImage(named: imageName)
        view.layer.contents = backgroundImage?.cgImage
    }
    
    private func findCardImage(card: Card) -> UIImage {
        var cardAnimal = "error"
        switch card.animal {
        case .giraffe:
            cardAnimal = "giraffe"
        case .monkey:
            cardAnimal = "monkey"
        case .snake:
            cardAnimal = "snake"
        case .lion:
            cardAnimal = "lion"
        case .squirrel:
            cardAnimal = "squirrel"
        case .zebra:
            cardAnimal = "zebra"
        case .dog:
            cardAnimal = "dog"
        case .narwhal:
            cardAnimal = "narwhal"
        case .cow:
            cardAnimal = "cow"
        case .panda:
            cardAnimal = "panda"
        case .sheep:
            cardAnimal = "sheep"
        case .elephant:
            cardAnimal = "elephant"
        case .frog:
            cardAnimal = "frog"
        case .chicken:
            cardAnimal = "chicken"
        case .bat:
            cardAnimal = "bat"
        case .dinosaur:
            cardAnimal = "dinosaur"
        case .bird:
            cardAnimal = "bird"
        case .turtle:
            cardAnimal = "turtle"
        }
        return UIImage(named:cardAnimal)!
    }
}
/*

 */
