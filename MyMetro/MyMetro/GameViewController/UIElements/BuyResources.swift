//
//  BuyResources.swift
//  MyMetro
//
//  Created by Eton Au on 27/9/2022.
//

import Foundation
import SwiftUI
import UIKit

extension GameViewController // this file lets you purchase resources
{
    @IBAction func buyResourcesButton(_ sender: Any)
    {
        
        exitButtonOutlet.isEnabled = false
        exitButtonFunction()
        enabilityOfStations(stID: 0, enability: false)
        addStationOutlet.isHidden = true
        newStationImage.isHidden = true
        homeMenuImage.isHidden = true
        crowdedStLabel.isHidden = true
        crowdedStProg.isHidden = true
        yellowLineProg.isHidden = true
        redLineProg.isHidden = true
        greenLineProg.isHidden = true
        blueLineProg.isHidden = true
        buyResourcesUI(show: true)
    }
    
    @IBAction func cartBuyButton(_ sender: Any)
    {
        if money >= cartPrice
        {
            cartNum += 1
            UIcartNumLabel.text = String(cartNum)
            money -= cartPrice
            UImoneyLabel.text = String(money)
        }
        if money < cartPrice
        {
            UIbuyCartButton.isEnabled = false
            print("cant buy cart: insufficient funds")
        }
    }
    
    @IBAction func trainBuyButton(_ sender: Any)
    {
        print("pressed")
        if money >= trainPrice
        {
            trainNum += 1
            UItrainNumLabel.text = String(trainNum)
            money -= trainPrice
            UImoneyLabel.text = String(money)
        }
        else if money < trainPrice
        {
            UIbuyTrainButton.isEnabled = false
            print("cant buy train: insufficient funds")
        }
    }
    
    @IBAction func buyTunnel(_ sender: Any)
    {
        if money >= tunnelPrice
        {
            tunnelNum += 1
            UItunnelLabel.text = String(tunnelNum)
            money -= tunnelPrice
            UImoneyLabel.text = String(money)
        }
        if money < tunnelPrice
        {
            UIBuyTunnelButton.isEnabled = false
            print("cant buy tunnel: insufficient funds")
        }
    }
    
    @IBAction func shopExitButton(_ sender: Any)
    {
        addStationOutlet.isHidden = false
        newStationImage.isHidden = false
        homeMenuImage.isHidden = false
        crowdedStProg.isHidden = false
        crowdedStLabel.isHidden = false
        yellowLineProg.isHidden = false
        redLineProg.isHidden = false
        greenLineProg.isHidden = false
        blueLineProg.isHidden = false
        buyResourcesUI(show: false)
        exitButtonOutlet.isEnabled = true
        enabilityOfStations(stID: 0, enability: true)
    }
}
