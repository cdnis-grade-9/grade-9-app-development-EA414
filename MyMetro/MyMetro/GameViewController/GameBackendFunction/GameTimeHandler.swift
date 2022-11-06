//
//  GameTimeHandler.swift
//  MyMetro
//
//  Created by Eton Au on 13/9/2022.
//

import Foundation
extension GameViewController //this file only handles game time
{
    @objc func runTimer()
    {
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer()
    {
        time += Double(speedIncrease)
        timeBar.progress = Float(time/24)
        if time >= 24
        {
            increaseDensity() // changes a stations density
            time = 0.00
            updateMenuData() // changes the menu data
            timeBar.progress = Float(0)
            totalDays += 1
            day += 1
            checkLevel()
            loadProgressView(stationID: currentPage)
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
                UIIncomeLabel.isHidden = true
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
