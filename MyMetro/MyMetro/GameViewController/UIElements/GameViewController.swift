//
//  GameViewController.swift
//  MyMetro
//
//  Created by Eton Au on 2/9/2022.
//

import UIKit
import AVFoundation
// literally only outlets and variables
class GameViewController: UIViewController {

    //Station UI outlets
    @IBOutlet var stationUIName: UILabel!
    @IBOutlet var stationUICrowdDensity: UILabel!
    @IBOutlet var stationUIDensityBar: UIProgressView!
    
    //Genral Game Outlets
    @IBOutlet var timeBar: UIProgressView!
    @IBOutlet var playPic: UIImageView!
    @IBOutlet var dayLabel: UILabel!

    
    //New station UI outlets
    @IBOutlet var addStationOutlet: UIButton!
    @IBOutlet var stationUILineLabel: UILabel!
    @IBOutlet var stationUIGreenLine: UIButton!
    @IBOutlet var stationUIBlueButton: UIButton!
    @IBOutlet var stationUIYellowButton: UIButton!
    @IBOutlet var stationUIRedButton: UIButton!
    @IBOutlet var colorLabelDiff: UILabel!
    @IBOutlet var colorLabel: UILabel!
    @IBOutlet var fromStationLabelDiff: UILabel!
    @IBOutlet var toStationLabelDiff: UILabel!
    @IBOutlet var downArrowPic: UIImageView!
    
    //station outlets
    @IBOutlet var AdmiraltyOutlet: UIButton!
    @IBOutlet var CentralOutlet: UIButton!
    @IBOutlet var HungHomOutlet: UIButton!
    
    //station image outlets
    @IBOutlet var HungHomImage: UIImageView!
    @IBOutlet var exitButtonOutlet: UIButton!
    
    // resource outlets
    @IBOutlet var UImoneyLabel: UILabel!
    @IBOutlet var UItunnelLabel: UILabel!
    
    //variables
    var time = 0.00
    var speedIncrease = 2
    var currentSpeedRound = 0
    var day = 1
    var infloop = true
    var totalDays = 1
    var startStID = Int()
    var endStID = Int()
    var firstX = Int()
    var firstY = Int()
    var secondX = Int()
    var secondY = Int()
    var currentRound = 0 //either 1 or 2
    var buttonTask = 0 // 0 = show station info, 1 = extend line
    var colorSelected = false // if color is selected
    var money = 500
    var st1 = String()
    var st2 = String()
    var tunnelNum = 3
    var unlockedStationsID = [1,2]
    
    //sfx
    var buildSound: AVAudioPlayer?
    
    static var newColorLine = UIColor()
    static var newColorLineString = String()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        runTimer()
    }
}


