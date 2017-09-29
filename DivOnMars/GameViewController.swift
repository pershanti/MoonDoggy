//
//  GameViewController.swift
//  DivOnMars
//
//  Created by Shantini Vyas on 9/26/17.
//  Copyright © 2017 Shantini Vyas. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation
import CoreMotion

class GameViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var path =  Bundle.main.path(forResource: "thesting", ofType: "mp3")
    var isPlaying = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
        } catch {
            print("Error: File not loaded")
        }
        
        play()
        let scene = SKScene(fileNamed: "SplashScreen")! as! SplashScreen
        scene.viewController = self
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        scene.anchorPoint =  CGPoint(x: 0.5, y: 0.5)
        scene.size = skView.bounds.size
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            scene.moveScene()
        }
        skView.presentScene(scene)
    }
    
    
    
    func play(){
        if isPlaying == false {
            player.play()
            isPlaying = true
        } else {
            player.pause()
            isPlaying = false
        }
    }
    

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
