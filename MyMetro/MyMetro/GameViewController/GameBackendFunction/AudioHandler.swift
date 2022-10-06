//
//  AudioHandler.swift
//  MyMetro
//
//  Created by Eton Au on 26/9/2022.
//

import Foundation
import AVFoundation

extension GameViewController // Audio Handler
{
    func buildSFX()
    {
        let path = Bundle.main.path(forResource: "buildingSoundEffects", ofType:"mp3")!
        let url = URL(fileURLWithPath: path)
        do
        {
            buildSound = try AVAudioPlayer(contentsOf: url)
            buildSound?.play()
        }
        catch
        {
            // couldn't load file :(
            print("BuildSFX couldn't load")
        }
    }
}

