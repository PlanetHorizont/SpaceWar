//
//  Bullet.swift
//  SpaceWar
//
//  Created by Tianyi Zhang on 30/08/2015.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Bullet: CCSprite {
    
    func didLoadFromCCB() {
        
        var moveAnimation = CCActionMoveBy(duration: 0.5, position: CGPoint(x: 0, y: 200))
        
        var actionAfterAnimation = CCActionCallFunc (target: self, selector: "removeBullet")
        
        var moveSeq = CCActionSequence(one: moveAnimation, two: actionAfterAnimation)
        
        self.runAction(moveSeq)
        
    }
    
    func removeBullet(){
        self.removeFromParent()
    }
    
}