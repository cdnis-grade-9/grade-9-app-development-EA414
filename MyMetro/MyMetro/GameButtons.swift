//
//  GameButtons.swift
//  MyMetro
//
//  Created by Eton Au on 15/9/2022.
//

import Foundation
import UIKit

extension GameViewController // handles game buttons
{
    @IBAction func CentralButton(_ sender: Any)
    {
        let i = newStation.st_central
        if buttonTask == 0 // show UI details
        {
            loadStation(stationID: i.id)
            enabilityOfStations(stID: i.id, tf: false)
        }
        else if buttonTask == 1 // extend new line
        {
            currentRound += 1
            if currentRound == 1
            {
                firstX = i.x
                firstY = i.y
                fromStationLabelDiff.text = String(i.name)
                enabilityOfStations(stID: i.id, tf: false)
                test.text = String(currentRound)
            }
            if currentRound == 2
            {
                secondX = i.x
                secondY = i.y
                if colorSelected == true
                {
                    toStationLabelDiff.text = String(i.name)
                    drawLine(colorID: GameViewController.newColorLine, start: CGPoint(x: firstX, y: firstY), end: CGPoint(x: secondX, y: secondY))
                    addStationVisibility(x: true, phase: 0)
                    colorSelected = false
                    fromStationLabelDiff.text = "-FromStation-"
                    toStationLabelDiff.text = "-ToStation-"
                    colorLabelDiff.text = "-None-"
                    GameViewController.newColorLine = UIColor()
                    GameViewController.newColorLineString = String()
                    test.text = String(currentRound)
                }
                enabilityOfStations(stID: i.id, tf: false)
                currentRound = 0 // resets the round
                buttonTask = 0 //resets the button
                addStationOutlet.isHidden = false // makes the button not hidden again
            }
        }
    }
    @IBAction func AdmiraltyButton(_ sender: Any)
    {
        let i = newStation.st_admiralty
        if buttonTask == 0
        {
            loadStation(stationID: i.id)
            enabilityOfStations(stID: i.id, tf: false)
        }
        if buttonTask == 1
        {
            currentRound += 1
            if currentRound == 1
            {
                firstX = i.x
                firstY = i.y
                fromStationLabelDiff.text = String(i.name)
                enabilityOfStations(stID: i.id, tf: false)
                test.text = String(currentRound)
            }
            if currentRound == 2
            {
                test.text = String(currentRound)
                secondX = i.x
                secondY = i.y
                
                if colorSelected == true
                {
                    toStationLabelDiff.text = String(i.name)
                    drawLine(colorID: GameViewController.newColorLine, start: CGPoint(x: firstX, y: firstY), end: CGPoint(x: secondX, y: secondY))
                    addStationVisibility(x: true, phase: 0)
                    colorSelected = false
                    fromStationLabelDiff.text = "-FromStation-"
                    toStationLabelDiff.text = "-ToStation-"
                    colorLabelDiff.text = "-None-"
                    GameViewController.newColorLine = UIColor()
                    GameViewController.newColorLineString = String()
                }
                enabilityOfStations(stID: i.id, tf: false)
                currentRound = 0 // resets the round
                buttonTask = 0 //resets the button
                addStationOutlet.isHidden = false
            }
            
        }
    }
    
    @IBAction func HungHumButton(_ sender: Any)
    {
        let i = newStation.st_hunghom
        if buttonTask == 0
        {
            loadStation(stationID: i.id)
            enabilityOfStations(stID: i.id, tf: false)
        }
        if buttonTask == 1
        {
            currentRound += 1
            if currentRound == 1
            {
                test.text = String(currentRound)
                firstX = i.x
                firstY = i.y
                fromStationLabelDiff.text = String(i.name)
                enabilityOfStations(stID: i.id, tf: false)
            }
            if currentRound == 2
            {
                test.text = String(currentRound)
                secondX = i.x
                secondY = i.y
                
                if colorSelected == true
                {
                    toStationLabelDiff.text = String(i.name)
                    drawLine(colorID: GameViewController.newColorLine, start: CGPoint(x: firstX, y: firstY), end: CGPoint(x: secondX, y: secondY))
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
                enabilityOfStations(stID: i.id, tf: true)
            }
        }
    }

    @IBAction func exitButton(_ sender: Any)
    {
        stationUIVisibility(tf: true)
        enabilityOfStations(stID: 0, tf: true)
        buttonTask = 0
    }
}

