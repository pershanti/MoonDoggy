
import UIKit
import SpriteKit
import CoreMotion

class SplashScreen: SKScene {
    var viewController: UIViewController?
    override func sceneDidLoad() {
        
    }
   
    func moveScene(){
        let transition = SKTransition.doorsOpenVertical(withDuration: 0.5)
        let scene = SKScene(fileNamed: "MainScene")! as! GameScene
        scene.viewController = viewController
        self.view!.presentScene(scene, transition: transition)
    }
}

