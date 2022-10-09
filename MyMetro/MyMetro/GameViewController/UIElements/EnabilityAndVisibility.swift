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

    func findStDetails(stationID: Int) -> (newStation, Optional<UIButton>)  // when making new station add smth here
    {
        var classVar = newStation.st_central
        var labelVar = CentralButtonOutlet
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
        default:
            print("ERROR: NULL(DEFAULT) - NO CLASS - RETURNING ID 1")
        }
//        print(type(of: labelVar))
        return (classVar, labelVar)
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
            for i in 1...(unlockedStationsID.count)
            {
                let stButton = findStDetails(stationID: i).1
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
        trainMoneyLabel.isHidden = hiddenVar
        UItunnelMoneyLabel.isHidden = hiddenVar
        cartMoneyLabel.isHidden = hiddenVar
        trainInfoLabel.isHidden = hiddenVar
        UItunnelInfoLabel.isHidden = hiddenVar
        cartInfoLabel.isHidden = hiddenVar
        buyresourceTrainImage.isHidden = hiddenVar
        UIbuyTunnelImage.isHidden = hiddenVar
        buyResourceCartImage.isHidden = hiddenVar
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
        addStationOutlet.isHidden = hidden
    }
    
    func useResourcesVis(hidden: Bool)
    {
        useTrainImage.isHidden = hidden
        useCartImage.isHidden = hidden
        useTrainButton.isHidden = hidden
        useCartButton.isHidden = hidden
    }
}
