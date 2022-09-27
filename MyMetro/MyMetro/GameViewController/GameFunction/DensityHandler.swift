//
//  DensityHandler.swift
//  MyMetro
//
//  Created by Eton Au on 27/9/2022.
//

import Foundation

extension GameViewController
{
    func increaseDensity()
    {
        var num = ceil(Double(Float(Int(unlockedStationsID.count))/2))
        for i in 1...Int(num)
        {
            var randomDensityInc = Int.random(in: 0...9) // determines the amount of change
            var randomStationAffected = Int.random(in: 1...Int(unlockedStationsID.count)) // determines which station is changed
            var id = returnSTClassByID(stationID: unlockedStationsID[randomStationAffected - 1]) // gets the station that is going to be chnaged
            id.crowdedness += Float(randomDensityInc)/10 //changes value
        }
    }
}

