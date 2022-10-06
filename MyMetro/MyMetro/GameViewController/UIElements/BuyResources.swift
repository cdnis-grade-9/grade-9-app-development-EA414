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
        exitButtonFunction()
        if resourceButtonFunc == "buyResources"
        {
            addStationOutlet.isHidden = true
            buyResourcesUI(show: true)
            UIresourceButton.setTitle("Exit", for: .normal)
            resourceButtonFunc = "exit"
        }
        else if resourceButtonFunc == "exit"
        {
            addStationOutlet.isHidden = false
            buyResourcesUI(show: false)
            UIresourceButton.setTitle("Buy Resources", for: .normal)
            resourceButtonFunc = "buyResources"
        }
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
        if money >= trainPrice
        {
            trainNum += 1
            UItrainNumLabel.text = String(trainNum)
            money -= trainPrice
            UImoneyLabel.text = String(money)
        }
        if money < trainPrice
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
}
