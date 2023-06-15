//
//  ViewController.swift
//  CatchAndMatchGame
//
//  Created by Berat Rıdvan Asiltürk on 9.06.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    var cardModel = CardModel()
    var cardArray = [Card]()
    var firstFlippedCardIndex: IndexPath?
    var timer: Timer?
    var seconds: Double = 10 * 100 // 10 seconds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        cardArray = cardModel.getCards()
        
        // Create timer
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timeIsUp), userInfo: nil, repeats: true)
    }
    
    // MARK - Timer Methods
    
    @objc func timeIsUp() {
        
        seconds -= 1
        
        // Convert the seconds
        let convertedSeconds = String(format: "%.2f", seconds/100)
        
        // Updated UI every seconds
        timeLabel.text = "Time remaining :  \(convertedSeconds)"
        
        // Timer shoul not be smaller than 0
        if seconds <= 0 {
            timer?.invalidate()
        }
        
    }
    
    // MARK - UICollectionView Protocol Methods
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Gen a CardCollectionCell object
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        // Get the card that the collection view is trying to display
        let card = cardArray[indexPath.row]
        
        // Set that card for the cell
        cell.setCard(card)
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Get the cell that the user selected
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        // Get the card that the user selected
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false && card.isMatched == false {
            
            // Flip the card
            cell.flip()
            
            // Set the card status
            card.isFlipped = true
            
            if firstFlippedCardIndex == nil {
                
                
                
                firstFlippedCardIndex = indexPath
                
            } else {
                
                // If flipped card is second card
                // Do matching logic
                checkForMatches(indexPath)
                
            }
            
        } else {
            
        }
        
    } // End the didSelectItem Class
    
    // MARK - Game Logic Methods
    
    func checkForMatches(_ secondFlippedCardIndex: IndexPath) {

        // Get the cells for the two cards that were removed
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        
        let cardOne = cardArray[firstFlippedCardIndex!.row]
        let cardTwo = cardArray[secondFlippedCardIndex.row]
        
        if cardOne.imageName == cardTwo.imageName {
            
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            cardOneCell?.removeCards()
            cardTwoCell?.removeCards()
            
        } else {
            
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
            
        }
        
        // Tell the collectionView to reload the cell of first card if first flipped card cell is nil
        if cardOneCell == nil {
            collectionView.reloadItems(at: [firstFlippedCardIndex!])
        }
        
        // Reset the property that tracks the first card flipped
        firstFlippedCardIndex = nil
        
    }
    
    
} // End the ViewController Class
