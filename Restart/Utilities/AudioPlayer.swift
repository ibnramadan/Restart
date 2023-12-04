//
//  AudioPlayer.swift
//  Restart
//
//  Created by mohamed ramadan on 03/12/2023.
//

import Foundation
import AVFoundation

var audioPayer: AVAudioPlayer?
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            audioPayer?.play()
        } catch {
            print("Could not play the sound file")
        }
    }
}
