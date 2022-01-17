//
//  zombieDie.swift
//  MoonDoggy
//
//  Created by Shantini Vyas on 9/29/17.
//  Copyright © 2017 Shantini Vyas. All rights reserved.
//

import Foundation
import SpriteKit


class zombieDie {
    
    // sprite names
    let _0 = "60"
    let _1 = "61"
    let _2 = "62"
    let _3 = "63"
    let _4 = "64"
    let _5 = "65"
    let _6 = "66"
    
    
    // load texture atlas
    let textureAtlas = SKTextureAtlas(named: "dogWin")
    
    
    // individual texture objects
    func _00() -> SKTexture { return textureAtlas.textureNamed(_0) }
    func _01() -> SKTexture { return textureAtlas.textureNamed(_1) }
    func _02() -> SKTexture { return textureAtlas.textureNamed(_2) }
    func _03() -> SKTexture { return textureAtlas.textureNamed(_3) }
    func _04() -> SKTexture { return textureAtlas.textureNamed(_4) }
    func _05() -> SKTexture { return textureAtlas.textureNamed(_5) }
    func _06() -> SKTexture { return textureAtlas.textureNamed(_6) }
    
    //make 'em walk!
    
    func walk() -> [SKTexture] {
        return[
            _00(),
            _01(),
            _02(),
            _03(),
            _04(),
            _05(),
            _06()
        ]
    }
    
}

