//
//  StationClass.swift
//  MyMetro
//
//  Created by Eton Au on 6/9/2022.
//

import Foundation
class newStation
{
    var name: String
    var crowdedness: Float
    var stationSizeLvl: Int
    var stationFacilityLvl: Int
    var x: Int
    var y: Int
    var id: Int
    var loc: String // HK (hk island), KLN (kowloon) , LNT (lantau)

    init(id: Int, name: String, crowdedness: Float, stationSizeLvl: Int, stationFacilityLvl: Int, x: Int, y: Int, loc: String) {
        self.name = name
        self.crowdedness = crowdedness
        self.stationSizeLvl = stationSizeLvl
        self.stationFacilityLvl = stationFacilityLvl
        self.x = x
        self.y = y
        self.id = id
        self.loc = loc
    }
    
    static var st_central = newStation(id: 2, name: "Central Station", crowdedness: 2, stationSizeLvl: 1, stationFacilityLvl: 1, x: 298, y: 322, loc: "HK")
    static var st_admiralty = newStation(id: 1, name: "Admiralty Station", crowdedness: 3, stationSizeLvl: 1, stationFacilityLvl: 1, x: 385, y: 322, loc: "HK")
    static var st_hunghom = newStation(id: 3, name: "Hung Hom Station", crowdedness: 2, stationSizeLvl: 1, stationFacilityLvl: 1, x: 320, y: 247, loc: "KLN")
}
