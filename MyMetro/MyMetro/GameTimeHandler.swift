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
            time = 0.00
            timeBar.progress = Float(0)
            totalDays += 1
            day += 1
            checkLevel()
            if day == 8
            {
                day = 1
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
