//
//  Gameplay.swift
//  SpaceWar
//
//  Created by Super Admin on 15/8/8.
//  Copyright (c) 2015年 Apportable. All rights reserved.
//

import UIKit

class Gameplay: CCNode {
    
    weak var pNode: CCPhysicsNode?
   
    var playerShip = PlayerShip()
    
    var shipSprite: CCSprite?
    
    var touched = false
    
    func didLoadFromCCB() {
        userInteractionEnabled = true
        shipSprite = playerShip.shipSprite
        pNode?.addChild(shipSprite)
        shipSprite!.position = CGPoint(x: 160, y: 60)
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        
        touched = true
        
        var touchLocation = touch.locationInNode(self)
        
        var move = CCActionMoveTo(duration:0.08, position:touchLocation)
        shipSprite!.runAction(move)
    }
    
    
    override func touchMoved(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        
        var touchLocation = touch.locationInNode(self)
        shipSprite!.position = touchLocation
    }
    
    override func touchEnded(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        touched = false
    }

}
