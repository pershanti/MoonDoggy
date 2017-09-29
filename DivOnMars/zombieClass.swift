// ---------------------------------------
// Sprite definitions for 'Zombie'
// Generated with TexturePacker 4.5.0
//
// http://www.codeandweb.com/texturepacker
// ---------------------------------------

import SpriteKit


class zombieClass {
    // sprite names
    let _0 = "50"
    let _1 = "51"
    let _2 = "52"
    let _3 = "53"
    let _4 = "54"
    let _5 = "55"
    let _6 = "56"
    
    
    // load texture atlas
    let textureAtlas = SKTextureAtlas(named: "zombieWalk")
    
    
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
