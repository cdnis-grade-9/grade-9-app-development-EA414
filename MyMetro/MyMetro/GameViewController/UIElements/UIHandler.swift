//
//  UIHandler.swift
//  MyMetro
//
//  Created by Eton Au on 15/9/2022.
//

import Foundation
import UIKit

extension GameViewController //this file manages the UI underneath
{
    @IBAction func SpeedButton(_ sender: Any)
    {
        currentSpeedRound += 1 // changes the current speed round
        if currentSpeedRound == 1 // normal time, and changes the time by 1.3 time / sec
        {
            speedIncrease = Int(1.3)
            playPic.image = UIImage(named: "play") // changes the UI image
        }
        else if currentSpeedRound == 2 // fast time, and changes the time by 3.3 time / sec
        {
            speedIncrease = Int(3.3)
            playPic.image = UIImage(named: "speedup")// changes the UI image
        }
        else if currentSpeedRound == 3 // pauses time
        {
            speedIncrease = 0
            currentSpeedRound = 0
            playPic.image = UIImage(named: "pause")// changes the UI image
        }
    }
    
    func updateResourceUI()
    {
        // updates UI labels
        UImoneyLabel.text = String(money)
        UIcartNumLabel.text = String(cartNum)
        UItrainNumLabel.text = String(trainNum)
        UItunnelLabel.text = String(tunnelNum)
    }
    
    func updateStars() // updates the final company rating on the bottom of the screen with the 5 stars
    {
        avgScoreArray.removeAllObjects()// clears the array to reset
        currentAvgNum = 0 // resets the benchmark
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
        let roundedAvg = round(Float(avg)) // rounds the final score to a whole number
        // below changes the stars UI. I have to make it .0 because it is a float and thats how it works. I also had to convert it into a string, as detecting floats with if statements didnt work for me.
        if String(roundedAvg) == "1.0" || String(roundedAvg) == "2.0"
        {
            star1.image = UIImage(named:"star")
            star2.image = UIImage(named:"fadedStar")
            star3.image = UIImage(named:"fadedStar")
            star4.image = UIImage(named:"fadedStar")
            star5.image = UIImage(named:"fadedStar")
        }
        else if String(roundedAvg) == "3.0" || String(roundedAvg) == "4.0"
        {
            star2.image = UIImage(named:"star")
            star3.image = UIImage(named:"fadedStar")
            star4.image = UIImage(named:"fadedStar")
            star5.image = UIImage(named:"fadedStar")
        }
        else if String(roundedAvg) == "5.0" || String(roundedAvg) == "6.0"
        {
            star3.image = UIImage(named:"star")
            star4.image = UIImage(named:"fadedStar")
            star5.image = UIImage(named:"fadedStar")
        }
        else if String(roundedAvg) == "7.0" || String(roundedAvg) == "8.0" || String(roundedAvg) == "9.0"
        {
            star4.image = UIImage(named:"star")
            star5.image = UIImage(named:"fadedStar")
        }
        else if String(roundedAvg) == "10.0"
        {
            star5.image = UIImage(named:"star")
        }
    }
    
}
