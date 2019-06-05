//
//  Equip.swift
//  iRPG
//
//  Created by Israel on 5/27/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import Foundation
import SpriteKit

open class Equip {
    
    var equipNode = SKSpriteNode()
    
    var equipMoveN: [SKTexture] = []
    var equipMoveS: [SKTexture] = []
    var equipMoveE: [SKTexture] = []
    var equipMoveW: [SKTexture] = []
    var equipAttackN: [SKTexture] = []
    var equipAttackW: [SKTexture] = []
    var equipAttackS: [SKTexture] = []
    var equipAttackE: [SKTexture] = []
    var deadequip: [SKTexture] = []
    var equipN: SKTexture?
    var equipS: SKTexture?
    var equipE: SKTexture?
    var equipW: SKTexture?
    
    init(){
    }
    
    init(genero: String, tipo: String, nombre: String){
        
        let Atlas = SKTextureAtlas(named: "equip")
        //let sheet=SpriteSheet2(texture: Atlas.textureNamed("\(genero)_\(tipo)_\(nombre)"), rows: 21, columns: 13)
        let sheet=SpriteSheet(image: UIImage(named: "\(genero)_\(tipo)_\(nombre)")!, rows: 21, columns: 13)
        
        equipN = sheet.textureForColumn(column: 0, row: 0)
        equipW = sheet.textureForColumn(column: 0, row: 1)
        equipS = sheet.textureForColumn(column: 0, row: 2)
        equipE = sheet.textureForColumn(column: 0, row: 3)
        
        
        for i in 1...8 {
            //Body
            equipMoveN.append(sheet.textureForColumn(column: i, row: 8))
            equipMoveW.append(sheet.textureForColumn(column: i, row: 9))
            equipMoveS.append(sheet.textureForColumn(column: i, row: 10))
            equipMoveE.append(sheet.textureForColumn(column: i, row: 11))
        }
        
        for i in 0...5 {
            equipAttackN.append(sheet.textureForColumn(column: i, row: 12))
            equipAttackW.append(sheet.textureForColumn(column: i, row: 13))
            equipAttackS.append(sheet.textureForColumn(column: i, row: 14))
            equipAttackE.append(sheet.textureForColumn(column: i, row: 15))
        }
        
        equipAttackN.append(sheet.textureForColumn(column: 0, row: 12))
        equipAttackW.append(sheet.textureForColumn(column: 0, row: 13))
        equipAttackS.append(sheet.textureForColumn(column: 0, row: 14))
        equipAttackE.append(sheet.textureForColumn(column: 0, row: 15))
        
        for i in 0...5 {
            deadequip.append(sheet.textureForColumn(column: i, row: 20))
        }
        
        equipNode = SKSpriteNode(texture: equipS) //textura inicial del arma
        //equipNode.zPosition = 1.1
    }
    
    
    init(tipo: String, nombre: String){
        
        let Atlas = SKTextureAtlas(named: "equip")
        //let sheet=SpriteSheet2(texture: Atlas.textureNamed("male_\(tipo)_\(nombre)"), rows: 21, columns: 13)
        let sheet=SpriteSheet(image: UIImage(named: "male_\(tipo)_\(nombre)")!, rows: 21, columns: 13)
        
        equipN = sheet.textureForColumn(column: 0, row: 0)
        equipW = sheet.textureForColumn(column: 0, row: 1)
        equipS = sheet.textureForColumn(column: 0, row: 2)
        equipE = sheet.textureForColumn(column: 0, row: 3)
        
        
        for i in 1...8 {
            //Body
            equipMoveN.append(sheet.textureForColumn(column: i, row: 8))
            equipMoveW.append(sheet.textureForColumn(column: i, row: 9))
            equipMoveS.append(sheet.textureForColumn(column: i, row: 10))
            equipMoveE.append(sheet.textureForColumn(column: i, row: 11))
        }
        
        for i in 0...5 {
            equipAttackN.append(sheet.textureForColumn(column: i, row: 12))
            equipAttackW.append(sheet.textureForColumn(column: i, row: 13))
            equipAttackS.append(sheet.textureForColumn(column: i, row: 14))
            equipAttackE.append(sheet.textureForColumn(column: i, row: 15))
        }
        
        equipAttackN.append(sheet.textureForColumn(column: 0, row: 12))
        equipAttackW.append(sheet.textureForColumn(column: 0, row: 13))
        equipAttackS.append(sheet.textureForColumn(column: 0, row: 14))
        equipAttackE.append(sheet.textureForColumn(column: 0, row: 15))
        
        for i in 0...5 {
            deadequip.append(sheet.textureForColumn(column: i, row: 20))
        }
        
        equipNode = SKSpriteNode(texture: equipS) //textura inicial del arma
        //equipNode.zPosition = 1.1
    }
    
}