//
//  SoundManager.swift
//  CatchAndMatchGame
//
//  Created by Berat Rıdvan Asiltürk on 15.06.2023.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var audioPlayer: AVAudioPlayer?
    
    enum Sounds {
        case flip
        case shuffle
        case success
        case fail
    }
    
        static func playSound(_ selectSounds: Sounds) {
        
        var soundName = ""
        
        switch selectSounds {
            
        case .flip: soundName = "cardflip"
        case .shuffle: soundName = "shuffle"
        case .success: soundName = "dingcorrect"
        case .fail: soundName = "dingwrong"
            
        }
        
        // Get the path to the sound file inside the bundle
        let bundlePath = Bundle.main.path(forResource: soundName, ofType: "wav")
        
        guard bundlePath != nil else {
            print("No catched sound names like that \(soundName)")
            return
        }
        
        // Create a URL object from this string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            // Create audio player object
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            audioPlayer?.play()
        }
        catch {
            // Couldn't create audio player object
            print("Couldn't create the audio player object for sound file \(soundName)")
            
        }
    }
}
