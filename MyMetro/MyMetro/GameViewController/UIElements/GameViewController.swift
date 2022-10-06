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
    
    // resource outlets bottom
    @IBOutlet var UIbuyCartButton: UIButton!
    @IBOutlet var UIbuyTrainButton: UIButton!
    @IBOutlet var UIBuyTunnelButton: UIButton!
    @IBOutlet var UImoneyLabel: UILabel!
    @IBOutlet var UIIncomeLabel: UILabel!
    @IBOutlet var UItunnelLabel: UILabel!
    @IBOutlet var UIcartNumLabel: UILabel!
    @IBOutlet var UItrainNumLabel: UILabel!
    @IBOutlet var UItunnelInfoLabel: UILabel!
    @IBOutlet var UItunnelMoneyLabel: UILabel!
    @IBOutlet var UIbuyTunnelImage: UIImageView!
    
    // resource menu outlets
    
    @IBOutlet var UIresourceButton: UIButton!
    @IBOutlet var trainMoneyLabel: UILabel!
    @IBOutlet var cartMoneyLabel: UILabel!
    @IBOutlet var trainInfoLabel: UILabel!
    @IBOutlet var cartInfoLabel: UILabel!
    @IBOutlet var buyresourceTrainImage: UIImageView!
    @IBOutlet var buyResourceCartImage: UIImageView!
    
    
    
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
    var tunnelNum = 2
    var cartNum = 1
    var trainNum = 1
    var lineNum = 0
    var unlockedStationsID = [1,2]
    var connectedStationsID = [] as NSMutableArray
    var resourceButtonFunc = "buyResources"
    var cartPrice = 150
    var trainPrice = 600
    var tunnelPrice = 200
    var st1ID = Int()
    var st2ID = Int()
    
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


