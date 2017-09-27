// ---------------------------------------
// Sprite definitions for 'dogWalk'
// Generated with TexturePacker 4.5.0
//
// http://www.codeandweb.com/texturepacker
// ---------------------------------------

import SpriteKit


class dogWalkClass {

    // sprite names
    let _0 = "0"
    let _1 = "1"
    let _2 = "2"
    let _3 = "3"
    let _4 = "4"
    let _5 = "5"
    let _6 = "6"


    // load texture atlas
    let textureAtlas = SKTextureAtlas(named: "dogWalk")
    

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
