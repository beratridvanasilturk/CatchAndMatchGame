//
//  CardCollectionViewCell.swift
//  CatchAndMatchGame
//
//  Created by Berat Rıdvan Asiltürk on 10.06.2023.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var frontImageView: UIImageView!
    
    @IBOutlet var backImageView: UIImageView!
    
    var card: Card?
    
    func setCard(_ card: Card) {
        
        self.card = card
        
        frontImageView.image = UIImage(named: card.imageName)
    }
    
    func flip() {
      
        // .showHideTransitionViews gives us just hiding the card, not remove.
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews])
        
    }
    
    func flipBack() {
        
        UIView.transition(from: frontImageView, to: backImageView, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews])
        
    }
    
}
