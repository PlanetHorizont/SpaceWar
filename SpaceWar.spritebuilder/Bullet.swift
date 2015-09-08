//
//  bullets.swift
//  SpaceWar
//
//  Created by Alcatraz on 2015-09-05.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Bullet: CCSprite {
    
    var baseDamage: Double!
    
    func removeBullet(){
        self.removeFromParent()
    }
    
    func calcDamage() {
    
    }
}