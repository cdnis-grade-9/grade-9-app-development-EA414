//
//  UseResources.swift
//  MyMetro
//
//  Created by Eton Au on 9/10/2022.
//

import Foundation

extension GameViewController
{
    @IBAction func useTrainButton(_ sender: Any)
    {
        trainNum -= 1
        updateResourceUI()
        useResourcesMoneyCheck()
        let currentStClass = findStDetails(stationID: currentPage).0
        currentStClass.crowdedness -= 6
        if currentStClass.crowdedness < 0
        {
            currentStClass.crowdedness = 0
        }
        loadProgressView(stationID: currentStClass.id)
    }
    
    @IBAction func useCartButton(_ sender: Any)
    {
        cartNum -= 1
        updateResourceUI()
        useResourcesMoneyCheck()
        let currentStClass = findStDetails(stationID: currentPage).0
        currentStClass.crowdedness -= 1.5
        if currentStClass.crowdedness < 0
        {
            currentStClass.crowdedness = 0
        }
        loadProgressView(stationID: currentStClass.id)
    }
    
    func useResourcesMoneyCheck()
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
}
