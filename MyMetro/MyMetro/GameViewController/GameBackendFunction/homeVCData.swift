//
//  homeVCData.swift
//  MyMetro
//
//  Created by Eton Au on 6/11/2022.
//

import Foundation
extension GameViewController // this file changes the home pages process bar data
{
    func updateMenuData()
    {
        updateStCrowdedData()
        updateLineCrowdedData()
    }
    
    func updateStCrowdedData()
    {
        mostCrowdedStID = Int()
        for i in 0...(unlockedStationsID.count - 1)
        {
            let currentClass = findStDetails(stationID: i).0
            if i == 0
            {
                mostCrowdedStID = currentClass.id
            }
            else
            {
                let biggestClass = findStDetails(stationID: mostCrowdedStID).0
                if currentClass.crowdedness > biggestClass.crowdedness
                {
                    mostCrowdedStID = currentClass.id
                    crowdedStProg.progress = (currentClass.crowdedness)/10
                    crowdedStLabel.text = String(currentClass.name)
                }
                else if currentClass.crowdedness <= biggestClass.crowdedness
                {
                    crowdedStProg.progress = (biggestClass.crowdedness)/10
                    crowdedStLabel.text = String(biggestClass.name)
                }
            }
        }
    }
    
    func updateLineCrowdedData()
    {
        greenLineProg.progress = Float(greenStationsID.count - greenSubtractor)/10
        redLineProg.progress = Float(redStationsID.count - redSubtractor)/10
        blueLineProg.progress = Float(blueStationsID.count - blueSubtractor)/10
        yellowLineProg.progress = Float(yellowStationsID.count - yellowSubtractor)/10
    }
}
