//
//  GameScene.swift
//  DivOnMars
//
//  Created by Shantini Vyas on 9/26/17.
//  Copyright © 2017 Shantini Vyas. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var viewController: UIViewController?
    var dogsprite: SKSpriteNode?
    var zombieSprite: SKSpriteNode?
    var healthSprite = SKSpriteNode()
    var groundSprite = Ground()
    var motionManager: CMMotionManager?
    var pitch: Double?
    let myq = OperationQueue()
    let array = ["bone", "cheese", "mailman", "cat"]
    var health = 0
    
    var groundCollisionCategory: UInt32 = 0x1 << 1
    var dogCollisionCategory: UInt32 = 0x1 << 2
    var badCollisionCategory: UInt32 = 0x1 << 3
    var goodCollisionCategory: UInt32 = 0x1 << 4

    
    
    func bump(node: SKSpriteNode){
        let jump = SKAction.moveBy(x: 0, y: 200, duration: 1)
        node.run(jump)
    }
    
    

    func didBegin(_ contact: SKPhysicsContact) {
        
        let a: SKSpriteNode = contact.bodyA.node as! SKSpriteNode
        let b: SKSpriteNode = contact.bodyB.node as! SKSpriteNode

        if a == dogsprite {
            if b.name == "bone"{
                b.removeFromParent()
                self.updateHealth(by: 1)
                self.faster()
                print(self.health)
            }
            else if b.name == "cheese"{
                b.removeFromParent()
                self.updateHealth(by: 1)
                self.faster()
                print(self.health)

            }
            else if b.name == "mailman"{
                b.removeFromParent()
                self.updateHealth(by: -1)
                self.slower()
                print(self.health)

            }
            else if b.name == "cat"{
                b.removeFromParent()
                self.updateHealth(by: -2)
                self.slower()
                print(self.health)
            }
            
            else if b.name == "zombie"{
                self.winGame()
            }
           
         }
        
        else if b == dogsprite{
            if a.name == "bone"{
                a.removeFromParent()
                self.updateHealth(by: 1)
                self.faster()
                print(self.health)
            }
            else if a.name == "cheese"{
                a.removeFromParent()
                self.updateHealth(by: 1)
                self.faster()
                print(self.health)
                
            }
            else if a.name == "mailman"{
                a.removeFromParent()
                self.updateHealth(by: -1)
                self.slower()
                print(self.health)
                
            }
            else if a.name == "cat"{
                a.removeFromParent()
                self.updateHealth(by: -2)
                self.slower()
                print(self.health)
            }
                
            else if a.name == "zombie"{
                self.winGame()
            }
            
        }
        
    }
    
    func winGame(){
        let wait = SKAction.wait(forDuration: 0.5)
        let change = SKAction.run{
            if let viewC = self.viewController as! GameViewController? {
            viewC.player.stop()
            let transition = SKTransition.doorsCloseVertical(withDuration: 2)
            let scene = SKScene(fileNamed: "YouWin")! as! YouWin
            scene.viewController = viewC
            self.view?.presentScene(scene, transition:transition)
            }
        }
        let sequence = SKAction.sequence([wait, change])
        run(sequence)
    }
    
    func endGame(){
        let wait = SKAction.wait(forDuration: 2)
        let change = SKAction.run{
            if let viewC = self.viewController as! GameViewController? {
                viewC.player.stop()
                let transition = SKTransition.doorsCloseVertical(withDuration: 2)
                let scene = SKScene(fileNamed: "YouLose")! as! YouLose
                scene.viewController = viewC
                self.view?.presentScene(scene, transition:transition)
            }
        }
        let sequence = SKAction.sequence([wait, change])
        run(sequence)
    }
    
    func tooFat(){
        let wait = SKAction.wait(forDuration: 2)
        let change = SKAction.run{
            if let viewC = self.viewController as! GameViewController? {
                viewC.player.stop()
                let transition = SKTransition.doorsCloseVertical(withDuration: 2)
                let scene = SKScene(fileNamed: "TooFat")! as! TooFat
                scene.viewController = viewC
                self.view?.presentScene(scene, transition:transition)
            }
        }
        let sequence = SKAction.sequence([wait, change])
        run(sequence)
        
    }
    
    func faster(){
        let runFast = SKAction.moveBy(x: 100, y: 0, duration: 1)
        dogsprite!.run(runFast)
    }
    
    func forwardDodge(){
        let slowDown = SKAction.moveBy(x: 50, y: 0, duration: 1)
        let speedUp = SKAction.moveBy(x: -50, y: 0, duration: 1)
        let sequence = SKAction.sequence([slowDown, speedUp])
        dogsprite!.run(sequence)
    }
    
    func backwardDodge(){
        let slowDown = SKAction.moveBy(x: -50, y: 0, duration: 1)
        let speedUp = SKAction.moveBy(x: 50, y: 0, duration: 1)
        let sequence = SKAction.sequence([slowDown, speedUp])
        dogsprite!.run(sequence)
    }
    
    func slower(){
        let slowDown = SKAction.moveBy(x: -100, y: 0, duration: 1)
        let wait = SKAction.wait(forDuration: 5)
        let speedUp = SKAction.moveBy(x: 100, y: 0, duration: 1)
        let sequence = SKAction.sequence([slowDown, wait, speedUp])
        dogsprite!.run(sequence)
    }
    
    func goToSleep(){
        let position = dogsprite?.position
        let size = dogsprite?.size
        dogsprite?.removeFromParent()
        let dog = dogSleep()
        let drift = SKAction.move(to: CGPoint(x: -200, y:-360), duration: 3)
        let sleep = SKAction.animate(with: dog.walk(), timePerFrame: 0.33)
        dogsprite = SKSpriteNode(texture: dog._00())
        dogsprite!.position = position!
        dogsprite!.size = size!
        addChild(dogsprite!)
        let sequence = SKAction.sequence([drift, sleep])
        dogsprite!.run(sequence)
    }
    
    func displayHealth(){
        healthSprite.removeAllChildren()
        for i in 0..<self.health{
            let heart = SKSpriteNode(imageNamed: "heart")
            heart.position = CGPoint(x: -300 + i*70, y: 160)
            heart.size = CGSize(width: 50, height: 50)
            healthSprite.addChild(heart)
        }
    }
    func createSprite(sprite: String){
       let newSprite = SKSpriteNode(imageNamed: sprite)
        newSprite.size = CGSize(width: 75, height: 75)
        newSprite.position = CGPoint(x: Double(arc4random_uniform(720)) - 360, y: Double(arc4random_uniform(100)+200))
        newSprite.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        newSprite.physicsBody?.affectedByGravity = false
        newSprite.physicsBody?.allowsRotation = false
        newSprite.name = sprite
        addChild(newSprite)
        var fly = SKAction()
        if sprite == "cat" || sprite == "mailman" {
            fly = SKAction.move(to: self.dogsprite!.position, duration: 4)
        }
        else{
            fly = SKAction.move(to: self.dogsprite!.position, duration: 10)
        }
        let wait = SKAction.wait(forDuration: 4)
        let remove = SKAction.removeFromParent()
        let sequence = SKAction.sequence([fly, wait, remove])
        newSprite.run(sequence)
    }

    
    func deploySprites(){
        let create = SKAction.run { [unowned self] in
            self.displaySprites()
        }
        let wait = SKAction.wait(forDuration: 3)
        let sequence = SKAction.sequence([wait, create])
        let repeatForever = SKAction.repeatForever(sequence)
        run(repeatForever)
    }
    
    
    func displaySprites(){
        let spritenum = Int(arc4random_uniform(4))
        createSprite(sprite: self.array[spritenum])
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
        let dog = dogWalkClass()
        dogsprite = SKSpriteNode(texture: dog._01())
        let range = SKRange(upperLimit: 160)
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
        dogsprite!.physicsBody?.allowsRotation = false
        dogsprite!.physicsBody?.mass = 13
        dogsprite!.physicsBody?.categoryBitMask = dogCollisionCategory
        dogsprite!.physicsBody!.contactTestBitMask = dogsprite!.physicsBody!.collisionBitMask
        addChild(dogsprite!)
        dogsprite!.run(walkForever)
    }

    func createZombie(){
        let new_zombie = zombieClass()
        zombieSprite = SKSpriteNode(texture: new_zombie._01())
        let range = SKRange(upperLimit: 200)
        let lockToCenter = SKConstraint.positionY(range)
        zombieSprite!.constraints = [ lockToCenter ]
        let walk = SKAction.animate(with: new_zombie.walk(), timePerFrame: 0.033)
        let walkForever = SKAction.repeatForever(walk)
        zombieSprite!.name = "zombie"
        zombieSprite!.position = CGPoint(x: 150, y: 0)
        zombieSprite!.zPosition = 0
        zombieSprite!.size.height = 150
        zombieSprite!.size.width = 150
        zombieSprite!.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        zombieSprite!.physicsBody?.affectedByGravity = true
        zombieSprite!.physicsBody?.mass = 40
        zombieSprite!.physicsBody?.categoryBitMask = groundCollisionCategory
        zombieSprite!.physicsBody?.contactTestBitMask = zombieSprite!.physicsBody!.collisionBitMask
        addChild(zombieSprite!)
        zombieSprite!.run(walkForever)
    }
    
    
    override func sceneDidLoad() {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -1.6)
        physicsWorld.contactDelegate = self
        groundSprite.animateGround(scene: self)
        createCharacter()
        createSatellite()
        createZombie()
        deploySprites()
        addChild(healthSprite)
        self.health = 5
        displayHealth()
        startMotion()
        
    }
    
    func startMotion(){
        motionManager = CMMotionManager()
        if let manager = motionManager {
            print("We have a motion manager \(manager)")
            if manager.isDeviceMotionAvailable {
                let myq = OperationQueue()
                manager.deviceMotionUpdateInterval = 1
                manager.startDeviceMotionUpdates(to: myq){
                    (data: CMDeviceMotion?, error: Error?) in
                    if let mydata = data {
                        self.pitch = mydata.attitude.pitch
                        print(self.pitch)
                        if self.pitch! > 0.3{
                            self.backwardDodge()
                        }
                        else if self.pitch! < -0.3 {
                            self.forwardDodge()
                        }
                    }
                }
                
            }
            else { print("We cannot detect motion") }
        }
        else { print("No manager") }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        bump(node: dogsprite!)
    }
    
    func updateHealth(by: Int){
        self.health  = self.health + by
        if self.health <= 0{
            self.endGame()
        }
        
        else if self.health >= 10{
            dogsprite!.removeFromParent()
            dogsprite = SKSpriteNode(imageNamed:"36")
            dogsprite!.size.height = 200
            dogsprite!.size.width = 200
            dogsprite!.position = CGPoint(x: 0, y: -175)
            addChild(dogsprite!)
            self.endGame()
        }
        
        else if self.health > 0{
            displayHealth()
        }
    }
}
