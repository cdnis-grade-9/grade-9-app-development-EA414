//
//  GameButtons.swift
//  MyMetro
//
//  Created by Eton Au on 15/9/2022.
//

import Foundation
import UIKit
import CloudKit

extension GameViewController // handles game buttons
{
    @IBAction func CentralButton(_ sender: Any)
    {
        let i = newStation.st_central
        butttonFunc(i: i)
    }
    @IBAction func AdmiraltyButton(_ sender: Any)
    {
        let i = newStation.st_admiralty // using i here as it simplifies code when copying and pasting
        butttonFunc(i: i)
        
    }
    
    @IBAction func HungHumButton(_ sender: Any)
    {
        let i = newStation.st_hunghom
        butttonFunc(i: i)
    }
    
    @IBAction func exitButton(_ sender: Any)
    {
        currentPage = 0
        menuButtonsVis(hidden: false)
        useResourcesVis(hidden: true)
        exitButtonFunction()
    }
    
    func butttonFunc(i: newStation)
    {
        useResourcesMoneyCheck()
        let stButton = findStDetails(stationID: (i.id)).1
        currentPage = Int(i.id)
        if buttonTask == 0
        {
            useResourcesVis(hidden: false)
            menuButtonsVis(hidden: true)
            loadStation(stationID: i.id)
            enabilityOfStations(stID: i.id, enability: false)
            stButton?.isEnabled = false
        }
        if buttonTask == 1
        {
            currentRound += 1
            if currentRound == 1
            {
                firstX = i.x
                firstY = i.y
                st1 = i.loc
                st1ID = Int(i.id)
                fromStationLabelDiff.text = String(i.name)
                enabilityOfStations(stID: i.id, enability: false)
            }
            if currentRound == 2
            {
                st2 = i.loc
                secondX = i.x
                secondY = i.y
                st2ID = Int(i.id)
                if colorSelected == true
                {
                    let tunnel = checkForTunnel()
                    toStationLabelDiff.text = String(i.name)
                    drawLine(colorID: GameViewController.newColorLine, start: CGPoint(x: firstX, y: firstY), end: CGPoint(x: secondX, y: secondY), tunnel: tunnel)
                    addStationVisibility(x: true, phase: 0)
                    colorSelected = false
                    fromStationLabelDiff.text = "-FromStation-"
                    toStationLabelDiff.text = "-ToStation-"
                    colorLabelDiff.text = "-None-"
                    GameViewController.newColorLine = UIColor()
                    GameViewController.newColorLineString = String()
                }
                currentRound = 0 // resets the round
                buttonTask = 0 //resets the button
                addStationOutlet.isHidden = false
                stationUIVisibility(hidden: true)
                enabilityOfStations(stID: 0, enability: true)
            }
            
        }
    }
}

