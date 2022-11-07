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
    func loadNewStation() // create a new station on the map
    {
        var randStationID = Int.random(in: 3...12) // selects one out of the total stations
        while unlockedStationsID.contains(randStationID) // ensures that the generated station is not already created with a while loop
        {
            randStationID = Int.random(in: 3...12)
        }
        let dataSet = findStDetails(stationID: randStationID) // grabs the stations data with a function from the random num generated above
        let image = dataSet.2
        let buttonOutlet = dataSet.1
        let stID = dataSet.0
        image?.isHidden = false // unhides the image of the station generated
        buttonOutlet!.isEnabled = true // enables the button of the station generated
        unlockedStationsID.append(stID.id) // appends the current unlocked stations
        print("INFO: Added \(stID.name). Current Unlocked Stations By ID: \(unlockedStationsID)")
    }
        
    func checkLevel()
    {
        // if the total days reach a cetain amount, a new station gets loaded.
        if totalDays == 2
        {
            loadNewStation()
        }
        if totalDays == 5
        {
            loadNewStation()
        }
        if totalDays == 7
        {
            loadNewStation()
        }
        if totalDays == 10
        {
            loadNewStation()
        }
        if totalDays == 15
        {
            loadNewStation()
        }
        if totalDays == 19
        {
            loadNewStation()
        }
    }

}
