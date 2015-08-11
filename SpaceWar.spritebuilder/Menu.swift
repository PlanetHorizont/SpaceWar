//
//  Menu.swift
//  SpaceWar
//
//  Created by Super Admin on 15/8/8.
//  Copyright (c) 2015年 Apportable. All rights reserved.
//

import UIKit

class Menu: CCNode {
    
    func didLoadFromCCB() {
        userInteractionEnabled = true
        
        println("menu loaded")
    }
    
    func start() {
        let gamePlayScene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(gamePlayScene)
    }
   
}
