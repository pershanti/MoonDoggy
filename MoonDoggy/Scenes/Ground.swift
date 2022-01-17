//
//  Ground.swift
//  MoonDoggy
//
//  Created by Shantini Vyas on 9/29/17.
//  Copyright © 2017 Shantini Vyas. All rights reserved.
//

import UIKit
import SpriteKit

class Ground: SKSpriteNode {
    
    var groundArray = [SKSpriteNode]()
    
    func animateGround(scene: SKScene){
        let cTexture = SKTexture(imageNamed:"space-layer-1")
        for i in 0 ... 1 {
            if groundArray.count > 2 {
                groundArray = []
            }
            let craters = SKSpriteNode(texture: cTexture)
            craters.size.height = 80
            craters.size.width = 700
            craters.position = CGPoint(x: (700 * CGFloat(i)) - CGFloat(1 * i), y: -175)
            craters.zPosition = -1
            scene.addChild(craters)
            let moveLeft = SKAction.moveBy(x: -700, y: 0, duration: 5)
            let moveReset = SKAction.moveBy(x: 700, y: 0, duration: 0)
            let moveLoop = SKAction.sequence([moveLeft, moveReset])
            let moveForever = SKAction.repeatForever(moveLoop)
            craters.run(moveForever)
            craters.physicsBody = SKPhysicsBody(rectangleOf: craters.size)
            craters.physicsBody?.affectedByGravity = false
            craters.physicsBody?.isDynamic = false
            craters.physicsBody?.mass = 1000
            craters.physicsBody?.restitution = 0.5
            groundArray.append(craters)
        }
    }
    
    func stopGround(scene: GameScene){
        for item in groundArray{
            let stop = SKAction.stop()
            item.run(stop)
            item.removeFromParent()
        }
        let craters = SKSpriteNode(imageNamed: "space-layer-1")
        craters.size.height = 80
        craters.size.width = 700
        craters.position = CGPoint(x: 0, y: -175)
        scene.addChild(craters)
    }

}
