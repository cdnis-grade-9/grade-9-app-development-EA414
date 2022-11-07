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
    
    // for each button below, to simplify copy and pasting, i used I to score the specific class. Then, when each button is clicked, the button will run a general function that only requires the class to function.
    
    @IBAction func CentralButton(_ sender: Any) // example code
    {
        let i = newStation.st_central // setting the class for this station
        butttonFunc(i: i) // when this button is pressed, all I need to do is pass the class and it will function normally, as it only needs the class.
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
        
    @IBAction func TaiKooButton(_ sender: Any)
    {
        let i = newStation.st_taikoo
        butttonFunc(i: i)
    }
    @IBAction func ChaiWanButton(_ sender: Any)
    {
        let i = newStation.st_chaiwan
        butttonFunc(i: i)
    }
    @IBAction func HKUButton(_ sender: Any)
    {
        let i = newStation.st_hku
        butttonFunc(i: i)
    }
    @IBAction func WongChukHangButton(_ sender: Any)
    {
        let i = newStation.st_wongchukhang
        butttonFunc(i: i)
    }
    @IBAction func causewayBayButton(_ sender: Any)
    {
        let i = newStation.st_causewaybay
        butttonFunc(i: i)
    }
    
    @IBAction func KowloonButton(_ sender: Any)
    {
        let i = newStation.st_kowloon
        butttonFunc(i: i)
    }
    @IBAction func TSTButton(_ sender: Any)
    {
        let i = newStation.st_tst
        butttonFunc(i: i)
    }
    @IBAction func AustinButton(_ sender: Any)
    {
        let i = newStation.st_austin
        butttonFunc(i: i)
    }
    @IBAction func WhampoaButton(_ sender: Any)
    {
        let i = newStation.st_whampoa
        butttonFunc(i: i)
    }
    
    @IBAction func stationSizeAction(_ sender: Any)
    {
        let stClass = findStDetails(stationID: menuStationID).0 // gets the class of the current station you are working on
        stClass.score = stClass.stationSizeLvl + stClass.stationFacilityLvl // updates the score of the station through its class
        if stClass.stationSizeLvl == 5 // if station size level is max, then it will max out and stop you from buying the item
        {
            sizeButton.isEnabled = false
            stSizePriceLabel.text = "Max"
        }
        if money <= (200 * stClass.stationSizeLvl) // if you dont have enough money, the size button will not be enabled
        {
            sizeButton.isEnabled = false
        }
        money -= (200 * stClass.stationSizeLvl)
        stClass.stationSizeLvl += 1
        stSizePriceLabel.text = String(200 * stClass.stationSizeLvl)
        if money <= (200 * stClass.stationSizeLvl)// rechecks if you dont have enough money, the size button will not be enabled
        {
            sizeButton.isEnabled = false
        }
        UImoneyLabel.text = String(money)
        // change crowdedness of st.
        stClass.score = stClass.stationSizeLvl + stClass.stationFacilityLvl // updates the score of the station through its class
        starImage(score: stClass.score)
        if stClass.stationSizeLvl == 5 // if station size level is max, then it will max out and stop you from buying the item
        {
            sizeButton.isEnabled = false
            stSizePriceLabel.text = "Max"
        }
        updateStars() // updates stars on the bottom of the UI
    }
    
    @IBAction func stationServiceAction(_ sender: Any) // this button is the same as the station size button above, except with the station facility and not size
    {
        let stClass = findStDetails(stationID: menuStationID).0
        stClass.score = stClass.stationSizeLvl + stClass.stationFacilityLvl // updates the score of the station through its class
        if stClass.stationFacilityLvl == 5 // if station service level is max, then it will max out and stop you from buying the item, and make UI changes
        {
            serviceButton.isEnabled = false
            stServicePriceLabel.text = "Max"
        }
        if money <= (200 * stClass.stationFacilityLvl)
        {
            serviceButton.isEnabled = false
        }
        // change the star image
        money -= (200 * stClass.stationFacilityLvl)
        stClass.stationFacilityLvl += 1
        stServicePriceLabel.text = String(200 * stClass.stationFacilityLvl)
        if money <= (200 * stClass.stationFacilityLvl)
        {
            serviceButton.isEnabled = false
        }
        UImoneyLabel.text = String(money)
        // change income amount
        stClass.score = stClass.stationSizeLvl + stClass.stationFacilityLvl // updates the score of the station through its class
        starImage(score: stClass.score)
        if stClass.stationFacilityLvl == 5 // if station service level is max, then it will max out and stop you from buying the item, and make UI changes
        {
            serviceButton.isEnabled = false
            stServicePriceLabel.text = "Max"
        }
        updateStars() // updates stars on the bottom of the UI
    }
    
    @IBAction func exitButton(_ sender: Any) // resets everything (visability and enability) of gameobjects to avoid bugs. Most of the code is simplified in functions to reuse.
    {
        menuStationID = 0
        stationMenuImage.isHidden = true
        starImage.isHidden = true
        priceLabel(hidden: true, ID: menuStationID)
        menuButtonsVis(hidden: false)
        useResourcesVis(hidden: true)
        exitButtonFunction()
    }
    
    func butttonFunc(i: newStation) // general function that all station buttons follow
    {
        menuStationID = i.id // grabs the current station ID that the machine is wokring on
        let stButton = findStDetails(stationID: (i.id)).1 // grabs the UI button in relation to the station ID
        if buttonTask == 0 //load station data on the right side of the screen
        {
            starImage(score: i.score) // updates the star image on the screen
            stImproveButton(stClass: i) //determines if you have enough money to purchase an avaliable upgrade.
            priceLabel(hidden: false, ID: menuStationID) // updates the price label of the improve station button
            useResourcesVis(hidden: false) // hides gameobjects to avoid bugs
            menuButtonsVis(hidden: true) // hides gameobjects to avoid bugs
            loadStation(stationID: i.id) // loads a station UI detail on right based on the st id param passed
            stationMenuImage.isHidden = false
            enabilityOfStations(stID: i.id, enability: false) // disables the current station button so you cannot press it again and break the game
            stButton?.isEnabled = false // disables the current button so that you cannot press it again (double check)
        }
        if buttonTask == 1 // buttontask 1 means that if the button is used as a button to extend a line
        {
            currentRound += 1 // changes the round so that the next station pressed will go to round 2 to draw the station
            if currentRound == 1
            {
                // below changes the 1nd xy variables to the current button ones
                firstX = i.x
                firstY = i.y
                st1 = i.loc // changes st1 to the current island for tunnel checking
                st1ID = Int(i.id)
                fromStationLabelDiff.text = String(i.name) // update labels for clarification
                enabilityOfStations(stID: i.id, enability: false) // disables current button so that you cannot draw a line from this station to the same st
            }
            if currentRound == 2
            {
                st2 = i.loc // changes st2 to the current island for tunnel checking
                // below changes the 2nd xy variables to the current button ones
                secondX = i.x
                secondY = i.y
                st2ID = Int(i.id) // updates st2id var for other use
                if colorSelected == true
                {
                    let tunnel = checkForTunnel() // checks for the use of tunnels
                    toStationLabelDiff.text = String(i.name) // updates the to station tex labal
                    drawLine(colorID: GameViewController.newColorLine, start: CGPoint(x: firstX, y: firstY), end: CGPoint(x: secondX, y: secondY), tunnel: tunnel) // draws a line
                    addStationVisibility(x: true, phase: 0) // hides everything related to making a new station
                    colorSelected = false // resets the color selection var
                    // below resets the labels
                    fromStationLabelDiff.text = "-FromStation-"
                    toStationLabelDiff.text = "-ToStation-"
                    colorLabelDiff.text = "-None-"
                    // below resets the color variables
                    GameViewController.newColorLine = UIColor()
                    GameViewController.newColorLineString = String()
                }
                currentRound = 0 // resets the round
                buttonTask = 0 //resets the button
                
                // -- a lot of hiding gameobjects here --
                addStationOutlet.isHidden = false
                newStationImage.isHidden = false
                homeMenuImage.isHidden = false
                crowdedStLabel.isHidden = false
                crowdedStProg.isHidden = false
                yellowLineProg.isHidden = false
                redLineProg.isHidden = false
                greenLineProg.isHidden = false
                blueLineProg.isHidden = false
                lineUpgradeButton.isHidden = false
                
                stationUIVisibility(hidden: true) // when this function is called, all the stationUI related items are hidden
                enabilityOfStations(stID: 0, enability: true) // renenables all stations as stID = 0
            }
            
        }
    }
}

