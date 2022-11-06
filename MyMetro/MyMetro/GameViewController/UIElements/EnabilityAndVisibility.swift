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
    func addStationVisibility(x: Bool, phase: Int)
    {
        if phase == 1 // gets the color first
        {
            stationUILineLabel.isHidden = x
            stationUIGreenLine.isHidden = x
            newLineLayout.isHidden = x
            stationUIBlueButton.isHidden = x
            stationUIRedButton.isHidden = x
            stationUIYellowButton.isHidden = x
            colorLabelDiff.isHidden = x
            colorLabel.isHidden = x
        }
        if phase == 2 // then gets the loc of two buttons
        {
            downArrowPic.isHidden = x
            fromStationLabelDiff.isHidden = x
            toStationLabelDiff.isHidden = x
        }
        else // hides everything on right UI (making station)
        {
            stationUILineLabel.isHidden = x
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
        }
    }

  func stationUIVisibility(hidden: Bool)
  {
      stationUIName.isHidden = hidden
      stationUIDensityBar.isHidden = hidden
      stationUICrowdDensity.isHidden = hidden
  }

    func findStDetails(stationID: Int) -> (newStation, Optional<UIButton>, Optional<UIImageView>)  // when making new station add smth here
    {
        var classVar = newStation.st_central
        var labelVar = CentralButtonOutlet
        var imageVar = HungHomImage
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
        return (classVar, labelVar, imageVar)
    }
    
    func loadProgressView(stationID: Int)
    {
        let stClass = findStDetails(stationID: Int(stationID)).0
        stationUIDensityBar.progress = Float(stClass.crowdedness)/10
    }

    func loadStation(stationID: Int) // loads a station UI detail on right
    {
        enabilityOfStations(stID: 0, enability: true) // all buttons are enabled, self is disabled to avoid double clicking the same button and crashing
        let stClass = findStDetails(stationID: Int(stationID)).0
        if stationID == 0
        {
            stationUIVisibility(hidden: true)
        }
        else
        {
            stationUIName.text = stClass.name
            loadProgressView(stationID: stationID)
        }
        stationUIVisibility(hidden: false)
    }
    
    func enabilityOfStations(stID: Int, enability: Bool) // when making new station add smth here
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
    
    func buyResourcesUI(show: Bool)
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
        stationUIVisibility(hidden: true)
        enabilityOfStations(stID: 0, enability: true)
        buttonTask = 0
    }
    
    func menuButtonsVis(hidden: Bool)
    {
        UIresourceButton.isHidden = hidden
        buyResourceImage.isHidden = hidden
        addStationOutlet.isHidden = hidden
        newStationImage.isHidden = hidden
        homeMenuImage.isHidden = hidden
        crowdedStProg.isHidden = hidden
        crowdedStLabel.isHidden = hidden
        yellowLineProg.isHidden = hidden
        redLineProg.isHidden = hidden
        greenLineProg.isHidden = hidden
        blueLineProg.isHidden = hidden
    }
    
    func useResourcesVis(hidden: Bool)
    {
        useTrainImage.isHidden = hidden
        useCartImage.isHidden = hidden
        useTrainButton.isHidden = hidden
        useCartButton.isHidden = hidden
    }
    
    func priceLabel(hidden: Bool, ID: Int)
    {
        stServicePriceLabel.isHidden = hidden
        stSizePriceLabel.isHidden = hidden
        let stClass = findStDetails(stationID: ID).0
        let serviceLevel = stClass.stationFacilityLvl
        let sizeLevel = stClass.stationSizeLvl
        stSizePriceLabel.text = String(Int(sizeLevel) * 200)
        stServicePriceLabel.text = String(Int(serviceLevel) * 200)
        serviceButton.isEnabled = true
        serviceButton.isEnabled = true
    }
    
    func stImproveButton(stClass: newStation)
    {
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
    
    func starImage(score: Int)
    {
        starImage.isHidden = false
        for i in 2...10
        {
            if score == i
            {
                starImage.image = UIImage(named:"star\(i)")
            }
        }
    }
}
