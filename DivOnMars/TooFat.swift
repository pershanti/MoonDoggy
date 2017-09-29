//
//  TooFat.swift
//  MoonDoggy
//
//  Created by Shantini Vyas on 9/29/17.
//  Copyright © 2017 Shantini Vyas. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class TooFat: SKScene {
    var viewController: UIViewController?
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let scene = self
        let touch = touches.first!
        let viewTouchLocation = touch.location(in: self.view!)
        let sceneTouchPoint = scene .convertPoint(fromView: viewTouchLocation)
        let touchedNode = scene.atPoint(sceneTouchPoint)
        
        if (touchedNode.name == "playAgain") {
            let transition = SKTransition.doorsOpenVertical(withDuration: 0.5)
            let scene = SKScene(fileNamed: "MainScene")! as! GameScene
            scene.viewController = viewController
            self.view!.presentScene(scene, transition: transition)
        }
    }
}
