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
        
        // If cards allready matched do the image view to transparent
        if card.isMatched == true {
            
            backImageView.alpha = 0
            frontImageView.alpha = 0
            
            return
        
        // If cards doesn't allready matched do the image view to visible
        } else {
            backImageView.alpha = 1
            frontImageView.alpha = 1
        }
        
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
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
        
            
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews])
               
        }
    }
    
    func removeCards() {
        
        // TODO: Add Animation
        
        frontImageView.alpha = 0
        
        UIView.animate(withDuration: 0.4, delay: 0.4, options: .curveEaseOut, animations: {
            
            self.frontImageView.alpha = 0
        })
        backImageView.alpha = 0
        
    }
    
}
