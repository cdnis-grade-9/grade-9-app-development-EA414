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

    func loadStation(stationID: Int) // loads a station UI detail on right
    {
        stationEnability(trueFalse: true) // all buttons are enabled, self is disabled to avoid double clicking the same button and crashing
        switch stationID {
        case 0: // Reset UI
            stationUIVisibility(tf: true)
        case 1://Admiralty St
            stationUIName.text = newStation.st_admiralty.name
        case 2:
            stationUIName.text = newStation.st_central.name
        case 3:
            stationUIName.text = newStation.st_hunghom.name
        default:
            stationUIVisibility(tf: false)
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
            print("pass")
        }
    }
    
}
