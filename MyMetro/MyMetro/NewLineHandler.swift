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
        addStationOutlet.isHidden = true
        buttonTask = 1 // sets the button task to extend line
        addStationVisibility(x: false, phase : 1)
        stationUIVisibility(tf: true)
    }
    
    func drawLine(colorID: UIColor, start: CGPoint, end: CGPoint)
    {
        //design the path
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        //design path in layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = colorID.cgColor
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 8.0
        view.layer.insertSublayer(shapeLayer, at: 2)
    }
}
