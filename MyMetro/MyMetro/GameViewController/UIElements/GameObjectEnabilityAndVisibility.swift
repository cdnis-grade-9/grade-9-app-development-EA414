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

    
  func stationEnability(trueFalse: Bool)
  {
      let x = trueFalse
      CentralOutlet.isEnabled = x
      AdmiraltyOutlet.isEnabled = x
      HungHomOutlet.isEnabled = x
  }
  
  func stationUIVisibility(tf: Bool)
  {
      stationUIName.isHidden = tf
      stationUIDensityBar.isHidden = tf
      stationUICrowdDensity.isHidden = tf
  }
    
    func returnSTClassByID(stationID: Int) -> newStation
    {
        var classVar = newStation.st_central
        var labelVar = CentralOutlet
        switch stationID {
        case 0: // Reset UI
            print("ERROR: NULL(CASE 0) - NO CLASS - RETURNING ID 1")
        case 1://Admiralty St
            classVar = newStation.st_admiralty
            labelVar = AdmiraltyOutlet
        case 2:
            classVar = newStation.st_central
            labelVar = CentralOutlet
        case 3:
            classVar = newStation.st_hunghom
            labelVar = HungHomOutlet
        default:
            print("ERROR: NULL(DEFAULT) - NO CLASS - RETURNING ID 1")
        }
        return classVar
    }

    func loadStation(stationID: Int) // loads a station UI detail on right
    {
        stationEnability(trueFalse: true) // all buttons are enabled, self is disabled to avoid double clicking the same button and crashing
        let x = returnSTClassByID(stationID: Int(stationID))
        if stationID == 0
        {
            stationUIVisibility(tf: true)
        }
        else
        {
            stationUIName.text = x.name
            stationUIDensityBar.progress = Float(x.crowdedness)/10
        }
        stationUIVisibility(tf: false)
    }
    
    func enabilityOfStations(stID: Int, tf: Bool) // to simplify copy and paste code
    {
        switch stID
        {
        case 0:
            AdmiraltyOutlet.isEnabled = tf
            CentralOutlet.isEnabled = tf
            HungHomOutlet.isEnabled = tf
            
        case 1:
            AdmiraltyOutlet.isEnabled = tf
        case 2:
            CentralOutlet.isEnabled = tf
        case 3:
            HungHomOutlet.isEnabled = tf
        default:
            exitButtonOutlet.isEnabled = tf
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
        stationUIVisibility(tf: true)
        enabilityOfStations(stID: 0, tf: true)
        buttonTask = 0
    }

}
