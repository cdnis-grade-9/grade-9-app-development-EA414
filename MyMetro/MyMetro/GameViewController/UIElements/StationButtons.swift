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
        let stClass = findStDetails(stationID: menuStationID).0
        if money <= (200 * stClass.stationSizeLvl)
        {
            sizeButton.isEnabled = false
        }
        money -= (200 * stClass.stationSizeLvl)
        stClass.stationSizeLvl += 1
        stSizePriceLabel.text = String(200 * stClass.stationSizeLvl)
        if money <= (200 * stClass.stationSizeLvl)
        {
            sizeButton.isEnabled = false
        }
        UImoneyLabel.text = String(money)
        // change crowdedness of st.
        stClass.score += 1
        starImage(score: stClass.score)
    }
    
    @IBAction func stationServiceAction(_ sender: Any)
    {

        print("here")
        let stClass = findStDetails(stationID: menuStationID).0
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
        stClass.score += 1
        starImage(score: stClass.score)
    }
    
    @IBAction func exitButton(_ sender: Any)
    {
        currentPage = 0
        stationMenuImage.isHidden = true
        starImage.isHidden = true
        priceLabel(hidden: true, ID: currentPage)
        menuButtonsVis(hidden: false)
        useResourcesVis(hidden: true)
        exitButtonFunction()
    }
    
    func butttonFunc(i: newStation)
    {
        menuStationID = i.id
        useResourcesMoneyCheck()
        let stButton = findStDetails(stationID: (i.id)).1
        currentPage = Int(i.id)
        if buttonTask == 0 //load station data
        {
            starImage(score: i.score)
            stImproveButton(stClass: i)
            priceLabel(hidden: false, ID: currentPage)
            useResourcesVis(hidden: false)
            menuButtonsVis(hidden: true)
            loadStation(stationID: i.id)
            stationMenuImage.isHidden = false
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
                newStationImage.isHidden = false
                homeMenuImage.isHidden = false
                crowdedStLabel.isHidden = false
                crowdedStProg.isHidden = false
                yellowLineProg.isHidden = false
                redLineProg.isHidden = false
                greenLineProg.isHidden = false
                blueLineProg.isHidden = false
                stationUIVisibility(hidden: true)
                enabilityOfStations(stID: 0, enability: true)
            }
            
        }
    }
}

