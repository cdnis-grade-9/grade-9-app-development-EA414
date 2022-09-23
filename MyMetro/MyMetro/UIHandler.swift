//
//  UIHandler.swift
//  MyMetro
//
//  Created by Eton Au on 15/9/2022.
//

import Foundation
import UIKit

extension GameViewController //this file manages the UI underneath
{
    @IBAction func SpeedButton(_ sender: Any)
    {
        currentSpeedRound += 1
        if currentSpeedRound == 1
        {
            speedIncrease = Int(1.3)
            playPic.image = UIImage(named: "play")
        }
        else if currentSpeedRound == 2
        {
            speedIncrease = Int(3.3)
            playPic.image = UIImage(named: "speedup")
        }
        else if currentSpeedRound == 3
        {
            speedIncrease = 0
            currentSpeedRound = 0
            playPic.image = UIImage(named: "pause")
        }
    }
    
}
