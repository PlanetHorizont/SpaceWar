//
//  PlayerShip.swift
//  SpaceWar
//
//  Created by Super Admin on 15/8/8.
//  Copyright (c) 2015年 Apportable. All rights reserved.
//

import Foundation

class PlayerShip: NSObject {
    
    var armor: Double?
    var HP: Double?
    
    var shipSpritePath: String!
    var shipSprite: CCSprite!
    
    var weapon1Name: String!
    var weapon2Name: String!
    var weapon3Name: String!
    var weapon1: NSDictionary? //weapon info is stored in WeaponList.plist ["weaponName"]
    var weapon2: NSDictionary?
    var weapon3: NSDictionary?
    
    
    var bullet1Name: String? = nil
    var bullet2Name: String? = nil
    var bullet3Name: String? = nil
    var bullet1CCBPath: String? = nil
    var bullet2CCBPath: String? = nil
    var bullet3CCBPath: String? = nil
    var bullet1Damage: Double? = nil
    var bullet2Damage: Double? = nil
    var bullet3Damage: Double? = nil
    
    var bulletTypeNumber: Int8 = 3
    
    var shipName: String!
    
    
    override init() {
        super.init()
        self.loadShipDataFromPlistFile()
        self.shipSprite = CCBReader.load("\(shipName)") as! CCSprite //PlayerShip.CCB contains all the collisionCategories and collisionMasks that is initialized.
    }
    
    func loadShipDataFromPlistFile() {
        
        //loads shipID from PlayerSavedData.plist first
        var path = NSBundle.mainBundle().pathForResource("PlayerSavedData", ofType: "plist")
        
        var playerDataDic = NSDictionary(contentsOfFile: path!)
        
        var shipID = playerDataDic?.valueForKey("savedShip") as! NSNumber
        
        //loads weapon
        weapon1Name = playerDataDic?.valueForKey("weapon1") as! String
        weapon2Name = playerDataDic?.valueForKey("weapon2") as! String
        weapon3Name = playerDataDic?.valueForKey("weapon3") as! String
        
        
        //loads ship with shipID from ShipList.plist
        path = NSBundle.mainBundle().pathForResource("ShipList", ofType: "plist")
        
        var 船名单😃 = NSArray(contentsOfFile: path!)
        
        var ship = 船名单😃![Int(shipID)] as! NSDictionary
        shipName = ship["shipName"] as! String
        
        
        
        
        
        
        
        path = NSBundle.mainBundle().pathForResource("WeaponList", ofType: "plist")
        
        
        
        var weaponList = NSDictionary(contentsOfFile: path!)!
        
        
        if weapon1Name != "" { //omg strings can't be nil in swift; this nil shit is driving me crazy. "" takes a little bit more memory, but the memory amount should be negligible
            
            weapon1 = weaponList.objectForKey(weapon1Name) as! NSDictionary
            
            bullet1CCBPath = weapon1!.objectForKey("bulletCCBPath") as! String
            
            bullet1Damage = weapon1!.objectForKey("baseDamage") as! Double
        }
        
        if weapon2Name != "" {
            
            weapon2 = weaponList.objectForKey(weapon2Name) as! NSDictionary
            
            bullet2CCBPath = weapon2!.objectForKey("bulletCCBPath") as! String
            
            bullet2Damage = weapon2!.objectForKey("baseDamage") as! Double
        }
        
        if weapon3Name != "" {
            
            weapon3 = weaponList.objectForKey(weapon3Name) as! NSDictionary
            
            bullet3CCBPath = weapon3!.objectForKey("bulletCCBPath") as! String
            
            bullet3Damage = weapon3!.objectForKey("baseDamage") as! Double
            
            
        }
        
        
        
    }
    
    func shootBullet() {
        
        shootBulletForJustOneTypeOfBulletAndABaseDamage(bullet1CCBPath, baseDamage: bullet1Damage)
        shootBulletForJustOneTypeOfBulletAndABaseDamage(bullet2CCBPath, baseDamage: bullet2Damage)
        shootBulletForJustOneTypeOfBulletAndABaseDamage(bullet3CCBPath, baseDamage: bullet3Damage)
        
    }
    
    
    func shootBulletForJustOneTypeOfBulletAndABaseDamage(bulletPath:String?, baseDamage: Double?) {
        
        if bulletPath != nil && baseDamage != nil{
            var bulletPath = bulletPath
            var bullet = CCBReader.load(bulletPath) as! CCSprite
            bullet.position = shipSprite!.position
            shipSprite.parent.addChild(bullet) //bullet is added to pNode in Gameplay class (pNode is the physics node)
            bullet.physicsBody.sensor = true
        }
    }
    
}
