//
//  StationClass.swift
//  MyMetro
//
//  Created by Eton Au on 6/9/2022.
//

import Foundation
class stationClass // a class file to store every stations data
{
    var name: String
    var crowdedness: Float
    var stationSizeLvl: Int
    var stationFacilityLvl: Int
    var x: Int
    var y: Int
    var id: Int
    var loc: String // HK (hk island), KLN (kowloon) , LNT (lantau)
    var isConnected: Bool //true = connected, false = not connected
    var score: Int // out of 10

    init(id: Int, name: String, crowdedness: Float, stationSizeLvl: Int, stationFacilityLvl: Int, x: Int, y: Int, loc: String, isConnected: Bool, score: Int) {
        self.name = name
        self.crowdedness = crowdedness
        self.stationSizeLvl = stationSizeLvl
        self.stationFacilityLvl = stationFacilityLvl
        self.x = x
        self.y = y
        self.id = id
        self.loc = loc
        self.isConnected = isConnected
        self.score = score
    }
// -- HK ISLAND --
    static var st_central = stationClass(id: 2, name: "Central Station", crowdedness: 2, stationSizeLvl: 1, stationFacilityLvl: 1, x: 298, y: 322, loc: "HK", isConnected: false, score: 2)
    static var st_admiralty = stationClass(id: 1, name: "Admiralty Station", crowdedness: 3, stationSizeLvl: 1, stationFacilityLvl: 1, x: 385, y: 322, loc: "HK", isConnected: false, score: 2)
    static var st_chaiwan = stationClass(id: 4, name: "Chai Wan Station", crowdedness: 2, stationSizeLvl: 1, stationFacilityLvl: 1, x: 565, y: 360, loc: "HK", isConnected: false, score: 2)
    static var st_taikoo = stationClass(id: 5, name: "Tai Koo Station", crowdedness: 2, stationSizeLvl: 1, stationFacilityLvl: 1, x: 460, y: 355, loc: "HK", isConnected: false, score: 2)
    static var st_causewaybay = stationClass(id: 6, name: "Causeway Bay St.", crowdedness: 3, stationSizeLvl: 1, stationFacilityLvl: 1, x: 460, y: 305, loc: "HK", isConnected: false, score: 2)
    static var st_wongchukhang = stationClass(id: 7, name: "Wong Chuk Hang St.", crowdedness: 1, stationSizeLvl: 1, stationFacilityLvl: 1, x: 398, y: 370, loc: "HK", isConnected: false, score: 2)
    static var st_hku = stationClass(id: 8, name: "HKU Station", crowdedness: 2, stationSizeLvl: 1, stationFacilityLvl: 1, x: 207, y: 325, loc: "HK", isConnected: false, score: 2)
    
// -- KOWLOON --
    static var st_kowloon = stationClass(id: 9, name: "Kowloon Station", crowdedness: 3, stationSizeLvl: 1, stationFacilityLvl: 1, x: 275, y: 227, loc: "KLN", isConnected: false, score: 2)
    static var st_tst = stationClass(id: 10, name: "Tsim Sha Tsui St.", crowdedness: 3, stationSizeLvl: 1, stationFacilityLvl: 1, x: 368, y: 253, loc: "KLN", isConnected: false, score: 2)
    static var st_austin = stationClass(id: 11, name: "Austin Station", crowdedness: 2, stationSizeLvl: 1, stationFacilityLvl: 1, x: 308, y: 192, loc: "KLN", isConnected: false, score: 2)
    static var st_whampoa = stationClass(id: 12, name: "Whampoa Station", crowdedness: 1, stationSizeLvl: 1, stationFacilityLvl: 1, x: 390, y: 195, loc: "KLN", isConnected: false, score: 2)
    static var st_hunghom = stationClass(id: 3, name: "Hung Hom Station", crowdedness: 2, stationSizeLvl: 1, stationFacilityLvl: 1, x: 320, y: 247, loc: "KLN", isConnected: false, score: 2)
}
