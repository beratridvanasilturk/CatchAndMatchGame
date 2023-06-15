//
//  CardModel.swift
//  CatchAndMatchGame
//
//  Created by Berat Rıdvan Asiltürk on 10.06.2023.
//

import Foundation


class CardModel {
    
    func getCards() -> [Card] {
        
        // Declare an array to store numbers we've already generated
        var generatedNumbersArray = [Int]()
        
        // Declare an array to store generated cards
        var generatedCardsArray = [Card]()
        
        // Randomly select cards 1 to 8
        while generatedNumbersArray.count < 8 {
            
            // Getting a random number
            let randomNumber = arc4random_uniform(13) + 1
            
            // Ensure that the random number is unique
            if generatedNumbersArray.contains(Int(randomNumber)) == false {
            
                print("Generated random number is: \(randomNumber)")
                
                // Store the number into the generatedNumbersArray
                generatedNumbersArray.append(Int(randomNumber))
                
                // Created first card object
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                generatedCardsArray.append(cardOne)
                
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                generatedCardsArray.append(cardTwo)
                
            }
        }
        
        // Randomize the array
        
        for i in 0...generatedCardsArray.count - 1 {
            
            // Find a randomindex to swap
            let randomNumber = Int(arc4random_uniform(UInt32(generatedCardsArray.count)))
            
            // Swapping 2 cards
            let temporaryStorage = generatedCardsArray[i]
            generatedCardsArray[i] = generatedCardsArray[randomNumber]
            generatedCardsArray[randomNumber] = temporaryStorage
        }
        return generatedCardsArray
    }
}
