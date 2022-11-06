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
    func loadNewStation()
    {
        var randStationID = Int.random(in: 3...12)
        while unlockedStationsID.contains(randStationID)
        {
            randStationID = Int.random(in: 3...12)
        }
        let dataSet = findStDetails(stationID: randStationID)
        let image = dataSet.2
        let buttonOutlet = dataSet.1
        let stID = dataSet.0
        image?.isHidden = false
        buttonOutlet!.isEnabled = true
        unlockedStationsID.append(stID.id)
        print("INFO: Added \(stID.name). Current Unlocked Stations By ID: \(unlockedStationsID)")
    }
        
    func checkLevel()
    {
        if totalDays == 2
        {
            loadNewStation()
        }
        if totalDays == 3
        {
            loadNewStation()
        }
        if totalDays == 4
        {
            loadNewStation()
        }
        if totalDays == 5
        {
            loadNewStation()
        }
        if totalDays == 6
        {
            loadNewStation()
        }
        if totalDays == 7
        {
            loadNewStation()
        }
    }

}
