//
//  File.swift
//  MyMetro
//
//  Created by Eton Au on 29/9/2022.
//

import Foundation
extension GameViewController
{
    /*
     
     HOW THE INCOME CALCULATOR WORKS - AN ALGO:
     
     FACTORS THAT DETERMINE INCOME:
     - Rating (positive multiplier), *(1, 1.5, 2, 2.5, 3)
     - Line Density (negative multiplier)
     - total unlocked stations (station count x 30)
     - total unlocked lines (line count x 20)
     
    */
    
    func incomeCalculator()
    {
        
    // -- generates basic income using a simple algorithm --
        
        let stCount = connectedStationsID.count
        var income = 0
        income = income + (stCount * 30)
        income = income + (lineNum * 20)
        
    // -- line density --

        let red = Float(redStationsID.count - redSubtractor)
        let yellow = Float(yellowStationsID.count - yellowSubtractor)
        let green = Float(greenStationsID.count - greenSubtractor)
        let blue = Float(blueStationsID.count - blueSubtractor)
        let total = blue + red + yellow + green
        let totalRounded = round(total)
        let multiplier = (100-totalRounded)/100
        income = Int(round(Float(income) * multiplier)) // rounds the income to a integer
        
    // -- Rating --
        
        for i in 0...((unlockedStationsID.count)-1) // puts the total amount of scores in one array, to calculate avg and find avg rating
        {
            let stClass = findStDetails(stationID: unlockedStationsID[i]).0 // uses a function I created to get the class of a station by the station ID in int form
            avgScoreArray.add(stClass.score) // appends the array
        }
        for i in 0...((avgScoreArray.count)-1)
        {
            currentAvgNum += avgScoreArray[i] as! Int // increases the benchmark
        }
        let avg = Float(currentAvgNum)/Float(avgScoreArray.count)
        let roundedAvg = round(Float(avg)) // rounded avg
        
        // if statement below to determine the final multiplier for income
        if String(roundedAvg) == "1.0" || String(roundedAvg) == "2.0"
        {
            income = income * 1
        }
        else if String(roundedAvg) == "3.0" || String(roundedAvg) == "4.0"
        {
            income = income * Int(1.5)
        }
        else if String(roundedAvg) == "5.0" || String(roundedAvg) == "6.0"
        {
            income = income * 2
        }
        else if String(roundedAvg) == "7.0" || String(roundedAvg) == "8.0" || String(roundedAvg) == "9.0"
        {
            income = income * Int(2.5)
        }
        else if String(roundedAvg) == "10.0"
        {
            income = income * 3
        }
        
    // -- UI updates --
        money = money + income
        uiMoneyLabel.text = String(money)
        uiIncomeLabel.text = "+\(income)"
        uiIncomeLabel.isHidden = false
    }
}
