// ---------------------------------------
// Sprite definitions for 'dogWin'
// Generated with TexturePacker 4.5.0
//
// http://www.codeandweb.com/texturepacker
// ---------------------------------------

import SpriteKit


class dogWin {
    
    // sprite names
    let _0 = "40"
    let _1 = "41"
    let _2 = "42"
    let _3 = "43"
    let _4 = "44"
    let _5 = "45"
    let _6 = "46"
    
    
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

