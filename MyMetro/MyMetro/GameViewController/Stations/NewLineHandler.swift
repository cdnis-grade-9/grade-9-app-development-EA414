//
//  NewLineHandler.swift
//  MyMetro
//
//  Created by Eton Au on 15/9/2022.
//

import Foundation
import UIKit

extension GameViewController // this file adds a new line
{
    
    // the code below will help determine which color is pressed when determining which line color will be used to draw the line
    @IBAction func GreenColorLine(_ sender: Any)
    {
        GameViewController.newColorLine = UIColor.green // changes the color selected to that later on the machine knows which color you selected
        GameViewController.newColorLineString = "Green"
        colorLabelDiff.text = GameViewController.newColorLineString
        colorSelected = true
        addStationVisibility(x: false, phase : 2) // enters the 2nd phase of line drawing
    }
    @IBAction func RedColorLine(_ sender: Any)
    {
        GameViewController.newColorLine = UIColor.red
        GameViewController.newColorLineString = "Red"
        colorLabelDiff.text = GameViewController.newColorLineString
        colorSelected = true
        addStationVisibility(x: false, phase : 2)
    }
    @IBAction func BlueColorLine(_ sender: Any) // make a function for this later
    {
        GameViewController.newColorLine = UIColor.blue
        GameViewController.newColorLineString = "Blue"
        colorLabelDiff.text = GameViewController.newColorLineString
        colorSelected = true
        addStationVisibility(x: false, phase : 2)
    }
    @IBAction func YellowColorLine(_ sender: Any)
    {
        GameViewController.newColorLine = UIColor.yellow
        GameViewController.newColorLineString = "Yellow"
        colorLabelDiff.text = GameViewController.newColorLineString
        colorSelected = true
        addStationVisibility(x: false, phase : 2)
    }
    
    @IBAction func addStation(_ sender: Any) // adds a new station
    {
        // -- simple UI updates --
        UIresourceButton.isHidden = true
        buyResourceImage.isHidden = true
        exitButtonOutlet.isEnabled = false
        addStationOutlet.isHidden = true
        newStationImage.isHidden = true
        homeMenuImage.isHidden = true
        crowdedStLabel.isHidden = true
        crowdedStProg.isHidden = true
        yellowLineProg.isHidden = true
        redLineProg.isHidden = true
        greenLineProg.isHidden = true
        blueLineProg.isHidden = true
        lineUpgradeButton.isHidden = true
        
        // -- functions --
        buttonTask = 1 // sets the button task to extend line, so that you can use the same buttons on the left for different tasks
        addStationVisibility(x: false, phase : 1)
        stationUIVisibility(hidden: true)
    }
    
    func drawLine(colorID: UIColor, start: CGPoint, end: CGPoint, tunnel: Bool)
    {
        //design the path
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        //design path in layer
        let shapeLayer = CAShapeLayer()
        if tunnel == true
        {
            shapeLayer.lineDashPattern = [7, 3]
            tunnelNum -= 1
        }
        // --  below changes the line formatting --
        shapeLayer.strokeColor = colorID.cgColor
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 8.0
        view.layer.insertSublayer(shapeLayer, at: 2)
        
        // -- below resets a few things --
        exitButtonOutlet.isEnabled = true
        buttonTask = 0 // resets the button tasks
        resourceManagementLine() // updates money and resrouce amount labels on the bottom of the screen
        buildSFX() //plays a building sfx
        UIresourceButton.isHidden = false
        buyResourceImage.isHidden = false
        incLineArrayByID(st1ID: st1ID, st2ID: st2ID) //increases connected stations
        lineNum += 1 // increases the line no. for income purposes
        
        // checks for which line this station is added to
        if GameViewController.newColorLineString == "Red"
        {
            redStationsID.add(st1ID)
            redStationsID.add(st2ID)
        }
        else if GameViewController.newColorLineString == "Yellow"
        {
            yellowStationsID.add(st1ID)
            yellowStationsID.add(st2ID)
        }
        else if GameViewController.newColorLineString == "Green"
        {
            greenStationsID.add(st1ID)
            greenStationsID.add(st2ID)
        }
        else if GameViewController.newColorLineString == "Blue"
        {
            blueStationsID.add(st1ID)
            blueStationsID.add(st2ID)
        }
        updateLineCrowdedData()
    }
    
    func resourceManagementLine()
    {
        //money management
        money -= 100
        UImoneyLabel.text = String(money)
        UItunnelLabel.text = String(tunnelNum)
    }
    
    func checkForTunnel() -> Bool
    {
        // if the two stations are on the same island (stored in the station class), then the use of tunnels will be false, and if the the stations are on different islands, the use of tunnels will be true
        if st1 == st2
        {
            return false
        }
        else if st1 != st2
        {
            return true
        }
        else
        {
            return false
        }
    }

    func incLineArrayByID(st1ID: Int, st2ID: Int)
    {
        // if the line currently does not have that station in its storage of stations, it will be added here
        if connectedStationsID.contains(st1ID)
        {
        }
        else
        {
            connectedStationsID.add(st1ID) //used add here cuz i have a nsmutable array as i cannot have a blank array
        }
        if connectedStationsID.contains(st2ID)
        {
        }
        else
        {
            connectedStationsID.add(st2ID) //used add here cuz i have a nsmutable array as i cannot have a blank array
        }
    }
}
