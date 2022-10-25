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
    @IBAction func GreenColorLine(_ sender: Any)
    {
        GameViewController.newColorLine = UIColor.green
        GameViewController.newColorLineString = "Green"
        colorLabelDiff.text = GameViewController.newColorLineString
        colorSelected = true
        addStationVisibility(x: false, phase : 2)
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
    
    @IBAction func addStation(_ sender: Any)
    {
        UIresourceButton.isHidden = true
        buyResourceImage.isHidden = true
        exitButtonOutlet.isEnabled = false
        addStationOutlet.isHidden = true
        newStationImage.isHidden = true
        homeMenuImage.isHidden = true
        buttonTask = 1 // sets the button task to extend line
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
        shapeLayer.strokeColor = colorID.cgColor
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 8.0
        view.layer.insertSublayer(shapeLayer, at: 2)
        exitButtonOutlet.isEnabled = true
        buttonTask = 0
        resourceManagementLine()
        buildSFX()
        UIresourceButton.isHidden = false
        buyResourceImage.isHidden = false
        incLineArrayByID(st1ID: st1ID, st2ID: st2ID) //increases connected stations
        lineNum += 1
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
