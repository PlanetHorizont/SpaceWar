import Foundation

class MainScene: CCNode {
    
    func menu() {
    
        let menuScene = CCBReader.loadAsScene("Menu")
        CCDirector.sharedDirector().presentScene(menuScene!)
        
        println("menu scene loaded")
        
    
    }
    
}
