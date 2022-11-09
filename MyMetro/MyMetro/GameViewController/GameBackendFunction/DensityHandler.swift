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
        var num = ceil(Double(Float(Int(unlockedStationsID.count))/2)) // checks for half the stations (so half the stations increase crowdedness)
        for i in 1...Int(num)
        {
            var randomDensityInc = Int.random(in: 0...9) // determines the amount of change
            var randomStationAffected = Int.random(in: 1...Int(unlockedStationsID.count)) // determines which station is changed
            let stDetails = findStDetails(stationID: unlockedStationsID[randomStationAffected - 1])// gets the station that is going to be chnaged
            let _class = stDetails.0
            print(maxedSt)
            print(_class.id)
            if maxedSt.contains(_class.id){} // checks if the station is maxed out and if it is it doesnt change the crowdedness.
            else
            {
                _class.crowdedness += Float(randomDensityInc)/10 //changes value
            }
        }
        checkForLoss()
    }
    func checkForLoss()
    {
        for i in 1...Int(unlockedStationsID.count)
        {
            let stDetails = findStDetails(stationID: unlockedStationsID[i - 1])
            let id = stDetails.0
            if id.crowdedness == 10
            {
                print("\(id.name) has reached it's maximum capacity. You Lose")
            }
        }
    }
}

