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
        // hides all gameobjects unrelated to buying resources to avoid bugs
        lineUpgradeButton.isHidden = true
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
        // first determines if you have enough money to buy
        if money >= cartPrice // if you have enough money
        {
            cartNum += 1 // cartnum var goes up
            uiCartNumLabel.text = String(cartNum) // updates the labels
            money -= cartPrice // changes money
            uiMoneyLabel.text = String(money) // updates money label
        }
        if money < cartPrice
        {
            uiBuyCartButton.isEnabled = false
            print("cant buy cart: insufficient funds")
        }
    }
    
    @IBAction func trainBuyButton(_ sender: Any)
    {
        // same as above but with a different price and diff item
        if money >= trainPrice
        {
            trainNum += 1
            uiTrainNumLabel.text = String(trainNum)
            money -= trainPrice
            uiMoneyLabel.text = String(money)
        }
        else if money < trainPrice
        {
            uiBuyTrainButton.isEnabled = false
            print("cant buy train: insufficient funds")
        }
    }
    
    @IBAction func buyTunnel(_ sender: Any)
    {
        // same as above but with a different price and diff item
        if money >= tunnelPrice
        {
            tunnelNum += 1
            uiTunnelLabel.text = String(tunnelNum)
            money -= tunnelPrice
            uiMoneyLabel.text = String(money)
        }
        if money < tunnelPrice
        {
            uiBuyTunnelButton.isEnabled = false
            print("cant buy tunnel: insufficient funds")
        }
    }
    
    @IBAction func shopExitButton(_ sender: Any)
    {
        // reenables all gameobjects unrelated to buying resources to avoid bugs
        addStationOutlet.isHidden = false
        newStationImage.isHidden = false
        homeMenuImage.isHidden = false
        crowdedStProg.isHidden = false
        crowdedStLabel.isHidden = false
        yellowLineProg.isHidden = false
        lineUpgradeButton.isHidden = false
        redLineProg.isHidden = false
        greenLineProg.isHidden = false
        blueLineProg.isHidden = false
        buyResourcesUI(show: false)
        exitButtonOutlet.isEnabled = true
        enabilityOfStations(stID: 0, enability: true)
    }
}
