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
        
        // Look at the card status (front or back side)
        if card.isFlipped == true {
            
            UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews])
            
        } else {
            
            UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromRight, .showHideTransitionViews ])
            
        }
        
    }
    
    func flip() {
      
        // .showHideTransitionViews gives us just hiding the card, not remove.
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews])
        
    }
    
    func flipBack() {
        
        UIView.transition(from: frontImageView, to: backImageView, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews])
        
    }
    
    func removeCards() {
        
        // TODO: Add Animation
        
        frontImageView.alpha = 0
        backImageView.alpha = 0
        
    }
    
}
