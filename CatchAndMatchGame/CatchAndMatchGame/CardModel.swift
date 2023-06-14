//
//  CardModel.swift
//  CatchAndMatchGame
//
//  Created by Berat Rıdvan Asiltürk on 10.06.2023.
//

import Foundation


class CardModel {
    
    func getCards() -> [Card] {
        
        // Declare an array to store generated cards
        var generatedCardsArray = [Card]()
        
        // Randomly select cards 1 to 8
        for _ in 1...8 {
            
            // Getting a random number
            let randomNumber = arc4random_uniform(13) + 1
            
            print("Generated random number is: \(randomNumber)")
            
            // Created first card object
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            generatedCardsArray.append(cardOne)
            
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            generatedCardsArray.append(cardTwo)
        }
        
        return generatedCardsArray
    }
}
