//
//  GameTimeHandler.swift
//  MyMetro
//
//  Created by Eton Au on 13/9/2022.
//

import Foundation
extension GameViewController //this file only handles game time
{
    @objc func runTimer() // timer function that runs upon viewdidload
    {
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer() // timer function (happens every interval)
    {
        time += Double(speedIncrease) // this changes the var time by the speed increase (set with the play buttons)
        timeBar.progress = Float(time/24) // updates progress bar
        if time >= 24 // every time a new day happens (when time reaches or > than 24 "hours")
        {
            increaseDensity() // changes a stations density
            time = 0.00 // resets time
            updateMenuData() // changes the menu data
            updateStars() // updates the stars on the bottom
            timeBar.progress = Float(0) // updates the progress bar
            totalDays += 1 // increases total days
            day += 1 // increases the "day" that resets every week
            checkLevel() // checks the level to see if a station is to be added
            loadProgressView(stationID: menuStationID) // updates the progress bar in the main menu after every day
            
            // -- UI updates --
            if day == 8
            {
                day = 1
                incomeCalculator()
            }
            if day == 1
            {
               dayLabel.text = "MON"
            }
            else if day == 2
            {
                
                dayLabel.text = "TUE"
            }
            else if day == 3
            {

                uiIncomeLabel.isHidden = true
                dayLabel.text = "WED"
            }
            else if day == 4
            {
                dayLabel.text = "THU"
            }
            else if day == 5
            {
                dayLabel.text = "FRI"
            }
            else if day == 6
            {
                dayLabel.text = "SAT"
            }
            else if day == 7
            {
                dayLabel.text = "SUN"
            }
            else
            {
                dayLabel.text = "ERR"
            }
        }
    }
}
