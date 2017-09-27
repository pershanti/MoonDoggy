//
//  GameScene.swift
//  DivOnMars
//
//  Created by Shantini Vyas on 9/26/17.
//  Copyright © 2017 Shantini Vyas. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var viewController: UIViewController?
    
    override func sceneDidLoad() {
        makeBackground()
        createGround()
        createGroundDetail()
        createCharacter()
    }
    func createGround() {
        let groundTexture = SKTexture(imageNamed: "space-layer-2")
        for i in 0 ... 1 {
            let ground = SKSpriteNode(texture: groundTexture)
            ground.zPosition = -10
            ground.position = CGPoint(x: (groundTexture.size().width * CGFloat(i)) - CGFloat(1 * i), y: -100)
            addChild(ground)
            
            let moveLeft = SKAction.moveBy(x: -groundTexture.size().width, y: 0, duration: 5)
            let moveReset = SKAction.moveBy(x: groundTexture.size().width, y: 0, duration: 0)
            let moveLoop = SKAction.sequence([moveLeft, moveReset])
            let moveForever = SKAction.repeatForever(moveLoop)
            
            ground.run(moveForever)
        }
    }
    
    func createGroundDetail(){
        let groundTopTexture = SKTexture(imageNamed: "space-layer-1")
        for i in 0 ... 1 {
            let groundTop = SKSpriteNode(texture: groundTopTexture)
            groundTop.zPosition = -10
            groundTop.position = CGPoint(x: (groundTopTexture.size().width * CGFloat(i)) - CGFloat(1 * i), y: -100)
            addChild(groundTop)
            let moveLeft = SKAction.moveBy(x: -groundTopTexture.size().width, y: 0, duration: 2)
            let moveReset = SKAction.moveBy(x: groundTopTexture.size().width, y: 0, duration: 0)
            let moveLoop = SKAction.sequence([moveLeft, moveReset])
            let moveForever = SKAction.repeatForever(moveLoop)
            
            groundTop.run(moveForever)
        }
    }
    
    
    func makeBackground(){
        let background = SKSpriteNode(imageNamed: "space-layer-5")
        background.zPosition = -20
        background.size.width = 800
        background.size.height = 600
        addChild(background)
        
    }
    
    func createCharacter(){
        let dog = dogWalkClass()
        let dogsprite = SKSpriteNode(texture: dog._01())
        let walk = SKAction.animate(with: dog.walk(), timePerFrame: 0.033)
        let walkForever = SKAction.repeatForever(walk)
        dogsprite.position = CGPoint(x: -200, y: -100)
        dogsprite.size.height = 100
        dogsprite.size.width = 100
        addChild(dogsprite)
        dogsprite.run(walkForever)
        
    }
}
