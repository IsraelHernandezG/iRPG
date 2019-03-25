//
//  GameUI.swift
//  iRPG
//
//  Created by Israel on 3/11/19.
//  Copyright © 2019 Israel. All rights reserved.
//

import Foundation
import SpriteKit

open class GameUI {
    
    //Camera
    var cam: SKCameraNode?
    // UI Textures
    let textureHud = SKTexture(image: UIImage(named: "Hud")!)
    
    let textureRightHPBar = SKTexture(image: UIImage(named: "HPRightBar")!)
    let textureRightSPBar = SKTexture(image: UIImage(named: "SPRightBar")!)
    let textureRightMPBar = SKTexture(image: UIImage(named: "MPRightBar")!)
    let textureCenterBar = SKTexture(image: UIImage(named: "CenterBar")!)
    
    let textureLeftHP = SKTexture(image: UIImage(named: "leftHP")!)
    let textureRightHP = SKTexture(image: UIImage(named: "rightHP")!)
    let textureCenterHP = SKTexture(image: UIImage(named: "centerHP")!)
    
    let textureLeftSP = SKTexture(image: UIImage(named: "leftSP")!)
    let textureRightSP = SKTexture(image: UIImage(named: "rightSP")!)
    let textureCenterSP = SKTexture(image: UIImage(named: "centerSP")!)
    
    let textureMenuButton = SKTexture(image: UIImage(named: "menuButton")!)
    let textureButtonUp = SKTexture(image: UIImage(named: "shadedLightUp")!)
    let textureButtonDown = SKTexture(image: UIImage(named: "shadedLightDown")!)
    let textureButtonLeft = SKTexture(image: UIImage(named: "shadedLightLeft")!)
    let textureButtonRight = SKTexture(image: UIImage(named: "shadedLightRight")!)
    
    let barScale: CGFloat = 2.0
    var lifePlayer: CGFloat  = 1.0
    var staminaPlayer: CGFloat  = 1.0
    var statusBar = SKNode()  // Las barras de estado estan compuestas por varios sprites, por lo que
                            // se crea un objeto que los contendra a todos
    
    init(_ ventana: CGRect){
        
        // Status Bars
        let originBar = SKSpriteNode(texture: textureHud)
        originBar.zPosition = 3
        originBar.xScale = barScale
        originBar.yScale = barScale
        originBar.position = CGPoint(x: -ventana.maxX+100, y: ventana.maxY-80)
        self.statusBar.addChild(originBar) // despues de que se crea cada sprite con su correspondiente textura,
                                    // dimensiones y posicion se agrega al nodo principal lifebar
        
        //Life bar
        let centerHPBar = SKSpriteNode(texture: textureCenterBar)
        centerHPBar.zPosition = 3
        centerHPBar.xScale = barScale * 2 // crear variable aparte
        centerHPBar.yScale = barScale
        centerHPBar.anchorPoint = CGPoint(x: 0, y: 0.5) // se cambia el punto de anclaje de los sprites
                                                        // del centro al extremo izquierdo del sprite, para
                                                        // cuando se escalen los objetos, su punto de origen
                                                        // no se modifique
        centerHPBar.position = CGPoint(x: originBar.position.x + originBar.size.width/2, y: originBar.position.y+40)
        self.statusBar.addChild(centerHPBar)
        let rightHPBar = SKSpriteNode(texture: textureRightHPBar)
        rightHPBar.zPosition = 3
        rightHPBar.xScale = barScale
        rightHPBar.yScale = barScale
        rightHPBar.anchorPoint = CGPoint(x: 0, y: 0.5)
        rightHPBar.position = CGPoint(x: centerHPBar.position.x + centerHPBar.size.width, y: centerHPBar.position.y)
        self.statusBar.addChild(rightHPBar)
        let leftHP = SKSpriteNode(texture: textureLeftHP)
        leftHP.zPosition = 3.1
        leftHP.xScale = barScale
        leftHP.yScale = barScale
        leftHP.anchorPoint = CGPoint(x: 0, y: 0.5)
        leftHP.position = CGPoint(x: centerHPBar.position.x-3, y: centerHPBar.position.y)
        self.statusBar.addChild(leftHP)
        let centerHP = SKSpriteNode(texture: textureCenterHP)
        centerHP.zPosition = 3.1
        centerHP.xScale = barScale * 4.0 * lifePlayer //crear variable aparte
        centerHP.yScale = barScale
        centerHP.anchorPoint = CGPoint(x: 0, y: 0.5)
        centerHP.position = CGPoint(x: leftHP.position.x + leftHP.size.width/2, y: leftHP.position.y)
        self.statusBar.addChild(centerHP)
        let rightHP = SKSpriteNode(texture: textureRightHP)
        rightHP.zPosition = 3.1
        rightHP.xScale = barScale
        rightHP.yScale = barScale
        rightHP.anchorPoint = CGPoint(x: 0, y: 0.5)
        rightHP.position = CGPoint(x: centerHP.position.x + centerHP.size.width, y: centerHP.position.y)
        self.statusBar.addChild(rightHP)
        //Stamina Bar
        let centerBar2 = SKSpriteNode(texture: textureCenterBar)
        centerBar2.zPosition = 3
        centerBar2.xScale = barScale * 1.5 // crear variable aparte
        centerBar2.yScale = barScale
        centerBar2.anchorPoint = CGPoint(x: 0, y: 0.5)
        centerBar2.position = CGPoint(x: originBar.position.x + originBar.size.width/2, y: originBar.position.y)
        self.statusBar.addChild(centerBar2)
        let rightBar2 = SKSpriteNode(texture: textureRightSPBar)
        rightBar2.zPosition = 3
        rightBar2.xScale = barScale
        rightBar2.yScale = barScale
        rightBar2.anchorPoint = CGPoint(x: 0, y: 0.5)
        rightBar2.position = CGPoint(x: centerBar2.position.x + centerBar2.size.width, y: centerBar2.position.y)
        self.statusBar.addChild(rightBar2)
        
        let leftSP = SKSpriteNode(texture: textureLeftSP)
        leftSP.zPosition = 3.1
        leftSP.xScale = barScale
        leftSP.yScale = barScale
        leftSP.anchorPoint = CGPoint(x: 0, y: 0.5)
        leftSP.position = CGPoint(x: centerBar2.position.x-3, y: centerBar2.position.y)
        self.statusBar.addChild(leftSP)
        let centerSP = SKSpriteNode(texture: textureCenterSP)
        centerSP.zPosition = 3.1
        centerSP.xScale = barScale * 2.8 * staminaPlayer //crear variable aparte
        centerSP.yScale = barScale
        centerSP.anchorPoint = CGPoint(x: 0, y: 0.5)
        centerSP.position = CGPoint(x: leftSP.position.x + leftSP.size.width/2, y: leftSP.position.y)
        self.statusBar.addChild(centerSP)
        let rightSP = SKSpriteNode(texture: textureRightSP)
        rightSP.zPosition = 3.1
        rightSP.xScale = barScale
        rightSP.yScale = barScale
        rightSP.anchorPoint = CGPoint(x: 0, y: 0.5)
        rightSP.position = CGPoint(x: centerSP.position.x + centerSP.size.width, y: centerSP.position.y)
        self.statusBar.addChild(rightSP)
        // Mana Bar
        let centerBar3 = SKSpriteNode(texture: textureCenterBar)
        centerBar3.zPosition = 3
        centerBar3.xScale = barScale * 1.5 // crear variable aparte
        centerBar3.yScale = barScale
        centerBar3.anchorPoint = CGPoint(x: 0, y: 0.5)
        centerBar3.position = CGPoint(x: originBar.position.x + originBar.size.width/2, y: originBar.position.y-40)
        self.statusBar.addChild(centerBar3)
        let rightBar3 = SKSpriteNode(texture: textureRightMPBar)
        rightBar3.zPosition = 3
        rightBar3.xScale = barScale
        rightBar3.yScale = barScale
        rightBar3.anchorPoint = CGPoint(x: 0, y: 0.5)
        rightBar3.position = CGPoint(x: centerBar3.position.x + centerBar3.size.width, y: centerBar3.position.y)
        self.statusBar.addChild(rightBar3)
        
        
    }
    
    open func createUI(_ ventana: CGRect, _ interfaz: SKNode) -> SKNode{
        
        //Menu Button
        let menuButton = SKSpriteNode(texture: textureMenuButton)
        menuButton.name = "Menu"
        menuButton.zPosition = 3
        menuButton.xScale = 2
        menuButton.yScale = 2
        menuButton.position = CGPoint(x: ventana.maxX-80, y: ventana.maxY-80)
        interfaz.addChild(menuButton)
        
        // Action Buttons
        let buttonUp = SKSpriteNode(texture: textureButtonUp)
        buttonUp.name = "Arriba"
        buttonUp.zPosition = 3
        buttonUp.xScale = 1.2
        buttonUp.yScale = 1.2
        buttonUp.position = CGPoint(x: ventana.maxX-150, y: -ventana.maxY+190)
        interfaz.addChild(buttonUp)
        
        let buttonDown = SKSpriteNode(texture: textureButtonDown)
        buttonDown.name = "Abajo"
        buttonDown.zPosition = 3
        buttonDown.xScale = 1.2
        buttonDown.yScale = 1.2
        buttonDown.position = CGPoint(x: buttonUp.position.x, y: buttonUp.position.y-110)
        interfaz.addChild(buttonDown)
        
        let buttonRight = SKSpriteNode(texture: textureButtonRight)
        buttonRight.name = "Der"
        buttonRight.zPosition = 3
        buttonRight.xScale = 1.2
        buttonRight.yScale = 1.2
        buttonRight.position = CGPoint(x: buttonUp.position.x+50, y: buttonUp.position.y-55)
        interfaz.addChild(buttonRight)
        
        let buttonLeft = SKSpriteNode(texture: textureButtonLeft)
        buttonLeft.name = "Izq"
        buttonLeft.zPosition = 3
        buttonLeft.xScale = 1.2
        buttonLeft.yScale = 1.2
        buttonLeft.position = CGPoint(x: buttonUp.position.x-50, y: buttonUp.position.y-55)
        interfaz.addChild(buttonLeft)
        
        return interfaz
        
    }
   
    
    
    
    
    
}
