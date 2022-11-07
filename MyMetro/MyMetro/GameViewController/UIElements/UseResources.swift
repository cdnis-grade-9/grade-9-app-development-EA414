//
//  UseResources.swift
//  MyMetro
//
//  Created by Eton Au on 9/10/2022.
//

import Foundation
import UIKit

extension GameViewController
{
    
    @IBAction func yellowLineUpgAction(_ sender: Any)
    {
        currentEditingLine = "Yellow"
        upgColorLabel.text = "Yellow Line Crowdedness:"
        lineUpgProgBar.tintColor = UIColor.yellow
        lineUpgProgBar.progress = Float(yellowStationsID.count - yellowSubtractor)/10
    }
    
    @IBAction func redLineUpgAction(_ sender: Any)
    {
        currentEditingLine = "Red"
        upgColorLabel.text = "Red Line Crowdedness:"
        lineUpgProgBar.tintColor = UIColor.red
        lineUpgProgBar.progress = Float(redStationsID.count - redSubtractor)/10
    }
    
    @IBAction func greenLineUpgAction(_ sender: Any)
    {
        currentEditingLine = "Green"
        upgColorLabel.text = "Green Line Crowdedness:"
        lineUpgProgBar.tintColor = UIColor.green
        lineUpgProgBar.progress = Float(greenStationsID.count - greenSubtractor)/10
        lineUpgProgBar.progress = Float(redStationsID.count - redSubtractor)/10
    }
    
    @IBAction func blueLineUpgAction(_ sender: Any)
    {
        currentEditingLine = "Blue"
        upgColorLabel.text = "Blue Line Crowdedness:"
        lineUpgProgBar.tintColor = UIColor.blue
        lineUpgProgBar.progress = Float(blueStationsID.count - blueSubtractor)/10
    }
    
    @IBAction func lineUpgradesExitAction(_ sender: Any) // big red exit button for the "line upgrades menu"
    {
        enabilityOfStations(stID: 0, enability: true) // renables all the station buttons to avoid bugs
        upgColorLabel.isHidden = true
        currentEditingLine = String()
        upgColorLabel.text = "Select Line Color"
        greenLineUpg.isHidden = true
        lineUpgProgBar.isHidden = true
        yellowLineUpg.isHidden = true
        redLineUpg.isHidden = true
        blueLineUpg.isHidden = true
        lineUpgradeImage.isHidden = true
        useTrainButton.isHidden = true
        useCartButton.isHidden = true
        let f = false
        let t = true
        UIresourceButton.isHidden = f
        buyResourceImage.isHidden = f
        exitButtonOutlet.isEnabled = t
        addStationOutlet.isHidden = f
        newStationImage.isHidden = f
        homeMenuImage.isHidden = f
        crowdedStLabel.isHidden = f
        crowdedStProg.isHidden = f
        yellowLineProg.isHidden = false
        lineUpgradeButton.isHidden = false
        redLineProg.isHidden = f
        greenLineProg.isHidden = f
        blueLineProg.isHidden = f
        lineUpgradesExit.isHidden = true
        updateMenuData() // changes the progress bars on the menu screen to the updated one
    }
    
    @IBAction func lineUpgradeAction(_ sender: Any)
    {
        enabilityOfStations(stID: 0, enability: false) // disables all the station buttons to avoid bugs
        upgColorLabel.text = "Select Line Color"
        lineUpgProgBar.progress = 0
        upgColorLabel.isHidden = false
        currentEditingLine = String()
        useResourcesCheck()
        lineUpgradeImage.isHidden = false
        lineUpgProgBar.isHidden = false
        useTrainButton.isHidden = false
        useCartButton.isHidden = false
        greenLineUpg.isHidden = false
        yellowLineUpg.isHidden = false
        redLineUpg.isHidden = false
        blueLineUpg.isHidden = false
        
        let f = false
        let t = true
        UIresourceButton.isHidden = t
        buyResourceImage.isHidden = t
        exitButtonOutlet.isEnabled = f
        addStationOutlet.isHidden = t
        newStationImage.isHidden = t
        homeMenuImage.isHidden = t
        crowdedStLabel.isHidden = t
        crowdedStProg.isHidden = t
        yellowLineProg.isHidden = t
        lineUpgradeButton.isHidden = true
        redLineProg.isHidden = t
        greenLineProg.isHidden = t
        blueLineProg.isHidden = t
        lineUpgradesExit.isHidden = false
    }
    
    @IBAction func useTrainButton(_ sender: Any)
    {
        updateLineCrowdedData()
        trainNum -= 1
        useResourcesCheck()
        updateResourceUI()
        changeLine(chg: 5)
    }
    
    @IBAction func useCartButton(_ sender: Any)
    {
        updateLineCrowdedData()
        cartNum -= 1
        useResourcesCheck()
        updateResourceUI()
        changeLine(chg: 1)
    }
    
    func useResourcesCheck()
    {
        if cartNum <= 0
        {
            useCartButton.isEnabled = false
        }
        if trainNum <= 0
        {
            useTrainButton.isEnabled = false
        }
    }
    
    func changeLine(chg: Int)
    {
        if currentEditingLine == "Red"
        {
            redSubtractor += chg
            lineUpgProgBar.progress = Float(blueStationsID.count - blueSubtractor)/10
        }
        else if currentEditingLine == "Blue"
        {
            blueSubtractor += chg
            lineUpgProgBar.progress = Float(greenStationsID.count - greenSubtractor)/10
        }
        else if currentEditingLine == "Green"
        {
            greenSubtractor += chg
            lineUpgProgBar.progress = Float(redStationsID.count - redSubtractor)/10
        }
        else if currentEditingLine == "Yellow"
        {
            yellowSubtractor += chg
            lineUpgProgBar.progress = Float(yellowStationsID.count - yellowSubtractor)/10
        }
    }
    
}
