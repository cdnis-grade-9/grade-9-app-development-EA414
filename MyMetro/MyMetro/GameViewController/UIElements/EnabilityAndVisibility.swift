//
//  GameObjectEnabilityAndVisibility.swift
//  MyMetro
//
//  Created by Eton Au on 13/9/2022.
//

import Foundation
import UIKit

extension GameViewController // GameObjectEnabilityAndVisibility
{
    func addStationVisibility(x: Bool, phase: Int) // updates visibility and enability of gameobjects when you make a new line
    {
        if phase == 1 // gets the color first, enables the gameobjects related to the color
        {
            stationUIGreenLine.isHidden = x
            newLineLayout.isHidden = x
            stationUIBlueButton.isHidden = x
            stationUIRedButton.isHidden = x
            stationUIYellowButton.isHidden = x
            colorLabelDiff.isHidden = x
            colorLabel.isHidden = x
        }
        if phase == 2 // unlocks the things related to getting the loc of the two stations
        {
            downArrowPic.isHidden = x
            fromStationLabelDiff.isHidden = x
            toStationLabelDiff.isHidden = x
        }
        else // changes everything
        {
            stationUIGreenLine.isHidden = x
            stationUIBlueButton.isHidden = x
            stationUIRedButton.isHidden = x
            stationUIYellowButton.isHidden = x
            colorLabelDiff.isHidden = x
            colorLabel.isHidden = x
            downArrowPic.isHidden = x
            newLineLayout.isHidden = x
            fromStationLabelDiff.isHidden = x
            toStationLabelDiff.isHidden = x
            lineUpgradeButton.isHidden = x
        }
    }

    func stationUIVisibility(hidden: Bool) // when this function is called, all the stationUI related items are hidden/not hidden depending on what you put in
    {
        stationUIName.isHidden = hidden
        stationUIDensityBar.isHidden = hidden
        stationUICrowdDensity.isHidden = hidden
    }

    func findStDetails(stationID: Int) -> (newStation, Optional<UIButton>, Optional<UIImageView>)  // uses the station id (int) to return station details, ie: station image, station class, station button
    {
        // -- default data --
        var classVar = newStation.st_central
        var labelVar = CentralButtonOutlet
        var imageVar = HungHomImage
        
        // -- switch case to get station data --
        switch stationID {
        case 0: // Reset UI
            print("ERROR: NULL(CASE 0) - NO CLASS - RETURNING ID 1")
        case 1://Admiralty St
            classVar = newStation.st_admiralty
            labelVar = AdmiraltyButtonOutlet
        case 2:
            classVar = newStation.st_central
            labelVar = CentralButtonOutlet
        case 3:
            classVar = newStation.st_hunghom
            labelVar = HungHomButtonOutlet
            imageVar = HungHomImage
        case 4:
            classVar = newStation.st_chaiwan
            labelVar = ChaiWanButtonOutlet
            imageVar = ChaiWanImage
        case 5:
            classVar = newStation.st_taikoo
            labelVar = TaiKooButtonOutlet
            imageVar = TaiKooImage
        case 6:
            classVar = newStation.st_causewaybay
            labelVar = CausewayBayButtonOutlet
            imageVar = CausewayBayImage
        case 7:
            classVar = newStation.st_wongchukhang
            labelVar = WongChukHangButtonOutlet
            imageVar = WongChukHangImage
        case 8:
            classVar = newStation.st_hku
            labelVar = HKUButtonOutlet
            imageVar = HKUImage
        case 9:
            classVar = newStation.st_kowloon
            labelVar = KowloonButtonOutlet
            imageVar = KowloonImage
        case 10:
            classVar = newStation.st_tst
            labelVar = TSTButtonOutlet
            imageVar = TSTImage
        case 11:
            classVar = newStation.st_austin
            labelVar = AustinButtonOutlet
            imageVar = AustinImage
        case 12:
            classVar = newStation.st_whampoa
            labelVar = WhampoaButtonOutlet
            imageVar = WhampoaImage
        
        default:
            print("ERROR: NULL(DEFAULT) - NO CLASS - RETURNING ID 1")
        }
//        print(type(of: imageVar))
        return (classVar, labelVar, imageVar) // returns data back to the sender
    }
    
    func loadProgressView(stationID: Int) // loads the progress view based on the stationID implemented, will be used when finding the station with the highest crowdedness and updating it with this funciton and passing the perameters of the station ID
    {
        let stClass = findStDetails(stationID: Int(stationID)).0
        stationUIDensityBar.progress = Float(stClass.crowdedness)/10
    }

    func loadStation(stationID: Int) // loads a station UI detail on right
    {
        enabilityOfStations(stID: 0, enability: true) // all buttons are enabled, self is disabled to avoid double clicking the same button and crashing
        let stClass = findStDetails(stationID: Int(stationID)).0 // grabs the class based on the station id param
        if stationID == 0
        {
            stationUIVisibility(hidden: true) // show/hides gameobejects related to the station menu screen
        }
        else
        {
            stationUIName.text = stClass.name // updates the station name of the label to the current station name
            loadProgressView(stationID: stationID) // loads the station crowdedness
        }
        stationUIVisibility(hidden: false) // show/hides gameobejects related to the station menu screen
    }
    
    func enabilityOfStations(stID: Int, enability: Bool) // disables all stations or disables a certain station by station ID
    {
        if stID == 0
        {
            for i in 0...((unlockedStationsID.count)-1)
            {
                let stButton = findStDetails(stationID: unlockedStationsID[i]).1
                stButton?.isEnabled = enability
            }
        }
        else
        {
            let stButton = findStDetails(stationID: stID).1
            stButton?.isHidden = enability
        }
    }
    
    func buyResourcesUI(show: Bool) // all the shop related gameobejects will be hidden/not hidden based on the perameters passed
    {
        var hiddenVar = false
        if show == true
        {
            hiddenVar = false
        }
        else if show == false
        {
            hiddenVar = true
        }
        if money >= trainPrice
        {
            UIbuyTrainButton.isEnabled = true
        }
        if money >= cartPrice
        {
            UIbuyCartButton.isEnabled = true
        }
        if money >= tunnelPrice
        {
            UIBuyTunnelButton.isEnabled = true
        }
        UIbuyCartButton.isHidden = hiddenVar
        UIBuyTunnelButton.isHidden = hiddenVar
        UIbuyTrainButton.isHidden = hiddenVar
        shopImage.isHidden = hiddenVar
        shopExitOutlet.isHidden = hiddenVar
    }
    
    func exitButtonFunction()
    {
        stationUIVisibility(hidden: true) // hides all the UI related to the station info
        enabilityOfStations(stID: 0, enability: true) // renables all the station buttons
        buttonTask = 0 // resets the button task
    }
    
    func menuButtonsVis(hidden: Bool) // hides the buttons on the home menu screen with the params passed
    {
        UIresourceButton.isHidden = hidden
        buyResourceImage.isHidden = hidden
        addStationOutlet.isHidden = hidden
        newStationImage.isHidden = hidden
        homeMenuImage.isHidden = hidden
        crowdedStProg.isHidden = hidden
        crowdedStLabel.isHidden = hidden
        yellowLineProg.isHidden = hidden
        lineUpgradeButton.isHidden = hidden
        redLineProg.isHidden = hidden
        greenLineProg.isHidden = hidden
        blueLineProg.isHidden = hidden
    }
    
    func useResourcesVis(hidden: Bool) // hides the buttons on the use resource screen with the params passed
    {
        useTrainButton.isHidden = hidden
        useCartButton.isHidden = hidden
    }
    
    func priceLabel(hidden: Bool, ID: Int) // updates the price label of each stations "increase size" button and "improve facility" button
    {
        stServicePriceLabel.isHidden = hidden
        stSizePriceLabel.isHidden = hidden
        let stClass = findStDetails(stationID: ID).0 // grabs the station class based on the int param
        let serviceLevel = stClass.stationFacilityLvl // grabs the service level stored in the stations class
        let sizeLevel = stClass.stationSizeLvl // grabs the size level stored in the class
        stSizePriceLabel.text = String(Int(sizeLevel) * 200) // updates text based on the size level
        stServicePriceLabel.text = String(Int(serviceLevel) * 200)// updates text based on the facility level
        serviceButton.isEnabled = true
        serviceButton.isEnabled = true
    }
    
    func stImproveButton(stClass: newStation) // checks if you have enough money to buy the improvements, to avoid bugs
    {
        // below is simple if statement conditions to determine if you have enough money to buy the upgrades
        if money <= (200 * stClass.stationFacilityLvl)
        {
            serviceButton.isEnabled = false
        }
        else
        {
            serviceButton.isEnabled = true
        }
        if money <= (200 * stClass.stationSizeLvl)
        {
            sizeButton.isEnabled = false
        }
        else
        {
            sizeButton.isEnabled = true
        }
    }
    
    func starImage(score: Int) // updates the star image rating on any stations data screen, with the params being the score
    {
        starImage.isHidden = false // unhides the star image
        for i in 2...10 // runs from 2-10, to see which score is your score without using 10 if statements
        {
            if score == i // if the current loop is on your score, the star image will update to show your score in stars.
            {
                starImage.image = UIImage(named:"star\(i)")
            }
        }
    }
}
