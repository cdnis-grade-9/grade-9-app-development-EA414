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
    @IBOutlet var useTrainButton: UIButton!
    @IBOutlet var useCartButton: UIButton!
    @IBOutlet var stSizePriceLabel: UILabel!
    @IBOutlet var stServicePriceLabel: UILabel!
    @IBOutlet var sizeButton: UIButton!
    @IBOutlet var serviceButton: UIButton!
    @IBOutlet var starImage: UIImageView!

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
    @IBOutlet var AdmiraltyButtonOutlet: UIButton!
    @IBOutlet var CentralButtonOutlet: UIButton!
    @IBOutlet var HungHomButtonOutlet: UIButton!
    @IBOutlet var WongChukHangButtonOutlet: UIButton!
    @IBOutlet var HKUButtonOutlet: UIButton!
    @IBOutlet var ChaiWanButtonOutlet: UIButton!
    @IBOutlet var TaiKooButtonOutlet: UIButton!
    @IBOutlet var CausewayBayButtonOutlet: UIButton!
    @IBOutlet var TSTButtonOutlet: UIButton!
    @IBOutlet var WhampoaButtonOutlet: UIButton!
    @IBOutlet var KowloonButtonOutlet: UIButton!
    @IBOutlet var AustinButtonOutlet: UIButton!
    
    //station image outlets
    @IBOutlet var HKUImage: UIImageView!
    @IBOutlet var HungHomImage: UIImageView!
    @IBOutlet var exitButtonOutlet: UIButton!
    @IBOutlet var WongChukHangImage: UIImageView!
    @IBOutlet var CausewayBayImage: UIImageView!
    @IBOutlet var ChaiWanImage: UIImageView!
    @IBOutlet var TaiKooImage: UIImageView!
    @IBOutlet var TSTImage: UIImageView!
    @IBOutlet var WhampoaImage: UIImageView!
    @IBOutlet var AustinImage: UIImageView!
    @IBOutlet var KowloonImage: UIImageView!
    
    // resource outlets bottom
    @IBOutlet var UIbuyCartButton: UIButton!
    @IBOutlet var UIbuyTrainButton: UIButton!
    @IBOutlet var UIBuyTunnelButton: UIButton!
    @IBOutlet var UImoneyLabel: UILabel!
    @IBOutlet var UIIncomeLabel: UILabel!
    @IBOutlet var UItunnelLabel: UILabel!
    @IBOutlet var UIcartNumLabel: UILabel!
    @IBOutlet var UItrainNumLabel: UILabel!
    
    // resource menu outlets
    @IBOutlet var UIresourceButton: UIButton!
    @IBOutlet var shopExitOutlet: UIButton!
    @IBOutlet var shopImage: UIImageView!
    
    //game button images
    @IBOutlet var buyResourceImage: UIImageView!
    @IBOutlet var newStationImage: UIImageView!
    @IBOutlet var homeMenuImage: UIImageView!
    @IBOutlet var newLineLayout: UIImageView!
    @IBOutlet var stationMenuImage: UIImageView!
    @IBOutlet var lineUpgradeImage: UIImageView!
    
    // home data outlets
    @IBOutlet var crowdedStProg: UIProgressView!
    @IBOutlet var crowdedStLabel: UILabel!
    @IBOutlet var blueLineProg: UIProgressView!
    @IBOutlet var redLineProg: UIProgressView!
    @IBOutlet var yellowLineProg: UIProgressView!
    @IBOutlet var greenLineProg: UIProgressView!
    
    // line upgrades
    @IBOutlet var lineUpgradeButton: UIButton!
    @IBOutlet var lineUpgradesExit: UIButton!
    @IBOutlet var upgColorLabel: UILabel!
    @IBOutlet var redLineUpg: UIButton!
    @IBOutlet var greenLineUpg: UIButton!
    @IBOutlet var yellowLineUpg: UIButton!
    @IBOutlet var blueLineUpg: UIButton!
    @IBOutlet var lineUpgProgBar: UIProgressView!
    
    
    //variables
    var time = 0.00
    var speedIncrease = 2
    var currentSpeedRound = 0
    var day = 1
    var infloop = true
    var totalDays = 1
    var currentPage = 0
    var startStID = Int()
    var endStID = Int()
    var firstX = Int()
    var firstY = Int()
    var secondX = Int()
    var secondY = Int()
    var currentRound = 0 //either 1 or 2
    var buttonTask = 0 // 0 = show station info, 1 = extend line
    var colorSelected = false // if color is selected
    var money = 5000
    var menuStationID = Int()
    var st1 = String()
    var st2 = String()
    var tunnelNum = 2
    var cartNum = 1
    var trainNum = 1
    var lineNum = 0
    var unlockedStationsID = [1,2]
    var connectedStationsID = [] as NSMutableArray
    var blueStationsID = [] as NSMutableArray
    var blueSubtractor = Int()
    var redStationsID = [] as NSMutableArray
    var redSubtractor = Int()
    var yellowStationsID = [] as NSMutableArray
    var yellowSubtractor = Int()
    var greenStationsID = [] as NSMutableArray
    var greenSubtractor = Int()
    var mostCrowdedStID = Int()
    var resourceButtonFunc = "buyResources"
    var currentEditingLine = String()
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
        UImoneyLabel.text = String(money)
        updateMenuData()
        runTimer()
    }
}


