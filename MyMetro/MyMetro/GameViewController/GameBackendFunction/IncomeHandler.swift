//
//  File.swift
//  MyMetro
//
//  Created by Eton Au on 29/9/2022.
//

import Foundation
extension GameViewController
{
    func incomeCalculator()
    {
        let stCount = connectedStationsID.count
        print(stCount)
        var income = 0
        income = income + (stCount * 30)
        income = income + (lineNum * 20)
        money = money + income
        UImoneyLabel.text = String(money)
        UIIncomeLabel.text = "+\(income)"
        UIIncomeLabel.isHidden = false
    }
}
