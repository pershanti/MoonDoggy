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
    var dogsprite: SKSpriteNode?
    var zombieSprite: SKSpriteNode?
    var groundCollisionCategory: UInt32 = 0x1 << 1
    var dogCollisionCategory: UInt32 = 0x1 << 2
    
    
    func animateGround(){
        let cTexture = SKTexture(imageNamed:"space-layer-1")
        for i in 0 ... 1 {
            let craters = SKSpriteNode(texture: cTexture)
            craters.size.height = 80
            craters.size.width = 700
            craters.position = CGPoint(x: (700 * CGFloat(i)) - CGFloat(1 * i), y: -175)
            craters.zPosition = -1
            addChild(craters)
            let moveLeft = SKAction.moveBy(x: -700, y: 0, duration: 5)
            let moveReset = SKAction.moveBy(x: 700, y: 0, duration: 0)
            let moveLoop = SKAction.sequence([moveLeft, moveReset])
            let moveForever = SKAction.repeatForever(moveLoop)
            craters.run(moveForever)
            craters.physicsBody = SKPhysicsBody(rectangleOf: craters.size)
            craters.physicsBody?.categoryBitMask = groundCollisionCategory
            craters.physicsBody?.contactTestBitMask = dogCollisionCategory
            craters.physicsBody?.affectedByGravity = false
            craters.physicsBody?.isDynamic = false
            craters.physicsBody?.mass = 1000
            craters.physicsBody?.restitution = 0.5
            
        }
    }
    func bump(node: SKSpriteNode){
        let jump = SKAction.moveBy(x: 0, y: 100, duration: 2)
        node.run(jump)
    }
    
    func createSatellite(){
        let satelliteTexture = SKTexture(imageNamed: "space-layer-4")
        for i in 0 ... 1 {
            let satellite = SKSpriteNode(texture: satelliteTexture)
            satellite.size.height = 100
            satellite.size.width = 736
            satellite.position = CGPoint(x: (736 * CGFloat(i)) - CGFloat(1 * i), y: 0)
            satellite.zPosition = -5
            addChild(satellite)
            let moveLeft = SKAction.moveBy(x: -736, y: 0, duration: 10)
            let moveReset = SKAction.moveBy(x: 736, y: 0, duration: 0)
            let moveLoop = SKAction.sequence([moveLeft, moveReset])
            let moveForever = SKAction.repeatForever(moveLoop)
            satellite.run(moveForever)
        }
        
    }
    func createCharacter(){
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -1.6)
        let dog = dogWalkClass()
        dogsprite = SKSpriteNode(texture: dog._01())
        let range = SKRange(upperLimit: 200)
        let lockToCenter = SKConstraint.positionY(range)
        dogsprite!.constraints = [ lockToCenter ]
        let walk = SKAction.animate(with: dog.walk(), timePerFrame: 0.033)
        let walkForever = SKAction.repeatForever(walk)
        dogsprite!.position = CGPoint(x: -200, y: 0)
        dogsprite!.zPosition = 0
        dogsprite!.size.height = 150
        dogsprite!.size.width = 150
        dogsprite!.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        dogsprite!.physicsBody?.affectedByGravity = true
        dogsprite!.physicsBody?.mass = 13
        dogsprite!.physicsBody?.categoryBitMask = dogCollisionCategory
        addChild(dogsprite!)
        dogsprite!.run(walkForever)
    }
    
    func createZombie(){
        let zombie = Zombie()
        zombieSprite = SKSpriteNode(texture: zombie._01())
        let range = SKRange(upperLimit: 200)
        let lockToCenter = SKConstraint.positionY(range)
        zombieSprite!.constraints = [ lockToCenter ]
        let walk = SKAction.animate(with: zombie.walk(), timePerFrame: 0.033)
        let walkForever = SKAction.repeatForever(walk)
        zombieSprite!.position = CGPoint(x: 0, y: 0)
        zombieSprite!.zPosition = 0
        zombieSprite!.size.height = 150
        zombieSprite!.size.width = 150
        zombieSprite!.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        zombieSprite!.physicsBody?.affectedByGravity = true
        zombieSprite!.physicsBody?.mass = 40
        zombieSprite!.physicsBody?.categoryBitMask = dogCollisionCategory
        addChild(zombieSprite!)
        zombieSprite!.run(walkForever)
    }
    
    
    override func sceneDidLoad() {
        animateGround()
        createCharacter()
        createSatellite()
        createZombie()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        bump(node: dogsprite!)
    }
    
    
}
