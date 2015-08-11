//
//  PlayerShip.swift
//  SpaceWar
//
//  Created by Super Admin on 15/8/8.
//  Copyright (c) 2015年 Apportable. All rights reserved.
//

import UIKit

class PlayerShip: NSObject {
    
    var armor: Double?
    var HP: Double?
    var shipSpritePath: String!
    var shipSprite: CCSprite!
    
    
    override init() {
        super.init()
        self.loadShipDataFromPlistFile()
        self.shipSprite = CCSprite(imageNamed: shipSpritePath)
    }
    
    func loadShipDataFromPlistFile() {
        var path = NSBundle.mainBundle().pathForResource("PlayerSavedData", ofType: "plist")
        
        var playerDataDic = NSDictionary(contentsOfFile: path!)
        
        var shipID = playerDataDic?.valueForKey("savedShip") as! NSNumber
        
        path = NSBundle.mainBundle().pathForResource("ShipList", ofType: "plist")
        
        var 船名单😃 = NSArray(contentsOfFile: path!)
        
        var ship0 = 船名单😃![Int(shipID)] as! NSDictionary
        shipSpritePath = ship0["spritePath"] as! String
        println(shipSpritePath)
    }
    
}
