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
    
    var selectedCards: [CardView] = []
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
                let view = CardView()
                row.addArrangedSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
                view.heightAnchor.constraint(equalTo: row.heightAnchor).isActive = true
                
                let clickGesture = UITapGestureRecognizer(target: self, action:  #selector (self.selectCard(_:)))
                view.addGestureRecognizer(clickGesture)
                
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
                
                let card = Card(animal: Animal.giraffe)
                let attributeImage = findCardImage(card: card)
                
                view.card = card
                
                let imageView = UIImageView()
                imageView.contentMode = UIView.ContentMode.scaleAspectFit
                imageView.translatesAutoresizingMaskIntoConstraints = false
                cardStackView.addArrangedSubview(imageView)
                imageView.image = attributeImage
                imageView.widthAnchor.constraint(equalTo: cardStackView.widthAnchor, constant: 0).isActive = true
            }

        }
    }
    
    @objc private func selectCard(_ sender: UITapGestureRecognizer) {
        let view = sender.view! as! CardView
        view.isSelected = !view.isSelected
        print("we out here bois")
        if view.isSelected {
            addCardToSelected(view)
            checkForMatchIfTwoSelected()
        } else {
            removeCardFromSelected(view)
        }
    }
    
    private func checkForMatchIfTwoSelected() {
        if selectedCards.count == 2 {
            let cardViewOne = selectedCards[0]
            let cardViewTwo = selectedCards[1]
            let cardOne = cardViewOne.card!
            let cardTwo = cardViewTwo.card!
            
            if cardOne == cardTwo {
                print("wot got a match")
                // handle successful match
            } else {
                // handle non-successful match
            }
            
            removeCardFromSelected(cardViewOne)
            removeCardFromSelected(cardViewTwo)
        }
    }
    
    private func addCardToSelected(_ view: CardView) {
        selectedCards.append(view)
    }
    
    private func removeCardFromSelected(_ view: CardView) {
        var index = 0
        for (i, view2) in selectedCards.enumerated() {
            if view2.card! == view.card! {
                index = i
                break
            }
        }
        view.isSelected = false
        selectedCards.remove(at: index)
    }
    
    private func changeViewBackground(_ view: UIView, imageName: String) {
        let backgroundImage = UIImage(named: imageName)
        view.layer.contents = backgroundImage?.cgImage
    }
    
    private func findCardImage(card: Card) -> UIImage {
        return UIImage(named: "giraffe")!
    }
}
