//
//  stationIncrease.swift
//  MyMetro
//
//  Created by Eton Au on 15/9/2022.
//

import Foundation
import UIKit

extension GameViewController
{
    
    func checkLevel()
    {
        if totalDays == 3 // Hung Hom Station Activation
        {
            HungHomImage.isHidden = false
            HungHomOutlet.isEnabled = true
        }
    }

}
