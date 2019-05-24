//
//  Enemy.swift
//  iRPG
//
//  Created by Ing Pipin on 4/16/19.
//  Copyright © 2019 Israel. All rights reserved.
//
import Foundation
import SpriteKit

open class Enemy {
    // Texturas enemy
    var enemyViewN: SKTexture = SKTexture()
    var enemyViewS: SKTexture = SKTexture()
    var enemyViewE: SKTexture = SKTexture()
    var enemyViewW: SKTexture = SKTexture()
    
    var skeletonWalkingFramesN: [SKTexture] = []
    var skeletonWalkingFramesS: [SKTexture] = []
    var skeletonWalkingFramesE: [SKTexture] = []
    var skeletonWalkingFramesW: [SKTexture] = []
    
    var skeletonSlashN: [SKTexture] = []
    var skeletonSlashS: [SKTexture] = []
    var skeletonSlashE: [SKTexture] = []
    var skeletonSlashW: [SKTexture] = []
    
    var deadSkeleton: [SKTexture] = []
   
    //Velocidad enemigo
    var velocidadXp: CGFloat = 1.0
    var velocidadXm: CGFloat = 1.0
    var velocidadYp: CGFloat = 1.0
    var velocidadYm: CGFloat = 1.0
    var velocidad: CGFloat = 1.0

    //var orientacionPersonaje: Int = 3
    
    let escala: CGFloat = 3.0
    // Controles de la fisica
    var Enemigo = SKNode()
    var avatarEnemy = SKSpriteNode()
    var weapon = SKSpriteNode()
    var myWeapon = Weapon()
    var hair = SKSpriteNode()
    var helm = SKSpriteNode()
    var leggs = SKSpriteNode()
    //var myHelm = Armor()
    //var myLeggs = ArmorLeggs()
    //vida
    var vida = 200.0
    var vidaMax = 200.0
    var isAlive: Bool  = true
    var isAtack: Bool = false
    var stop: Bool = false
    // CategoriesitMasks: Determinan que objetos colisionan con que
    //TileMapCategories
    let Wall1Category: UInt32 = 0x01 << 1
    let Wall2Category: UInt32 = 0x01 << 2
    let Wall3Category: UInt32 = 0x01 << 3
    let Wall4Category: UInt32 = 0x01 << 4
    //PlayerCategory
    let playerCategory: UInt32 = 0x01 << 0
    //ArmsCategory
    let armsCategory: UInt32 = 0x01 << 5
    //EnemyCategory
    let enemyCategory: UInt32 = 0x01 << 6
    
    var enemyxPosition: CGFloat = 0.0
    var enemyyPosition: CGFloat = 0.0
    
    var orientaCaminata = 3
    
    init(position: CGPoint, tipo: String){
        
        createAnimations(tipo: tipo)
        
        avatarEnemy = SKSpriteNode(texture: enemyViewS) //textura inicial del enemigo
        // se añade un physicsbody al jugador para detectar colisiones
        avatarEnemy.physicsBody = SKPhysicsBody(texture: enemyViewS, size: avatarEnemy.size)
        avatarEnemy.physicsBody!.categoryBitMask = enemyCategory // categoria del jugador
        // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
        avatarEnemy.physicsBody!.contactTestBitMask = Wall1Category | Wall2Category | Wall3Category | Wall4Category | playerCategory
        avatarEnemy.physicsBody!.collisionBitMask = 0 // esta opcion debe estar en 0
        // estas configuraciones tambien son necesarias
        avatarEnemy.physicsBody!.isDynamic=true
        avatarEnemy.zPosition = 1
        
        //Equipo del jugador
        myWeapon = Weapon(nombreAtlas: "Swords", nombreWeapon: "sword")
        weapon = myWeapon.weaponNode
        //myHelm = Armor(nombre: "bronce_helm")
        //helm = myHelm.helm
        //myLeggs = ArmorLeggs(nombre: "Roman_Leggs")
        //leggs = myLeggs.leggs
        
        

        
        
        //Juntando elementos del jugador
        Enemigo.addChild(avatarEnemy)
        Enemigo.addChild(weapon)
        //Enemy.addChild(helm)
        //Enemy.addChild(leggs)
        
        Enemigo.position = position
        Enemigo.setScale(escala)
        
    }
    
    func setWeaponPhysicsBody(){
        
        if let temp = SKPhysicsBody(texture: weapon.texture!, size: weapon.size) as? SKPhysicsBody {
            weapon.physicsBody = temp
            weapon.physicsBody?.categoryBitMask = armsCategory // categoria del jugador
            // en contactTestBitMask se agregan todos los objetos con los que colisionara el jugador
            weapon.physicsBody?.contactTestBitMask = Wall1Category | Wall2Category | Wall3Category | Wall4Category | playerCategory
            weapon.physicsBody?.collisionBitMask = 0 // esta opcion debe estar en 0
            // estas configuraciones tambien son necesarias
            weapon.physicsBody?.isDynamic=true
        }
    }
    
    
    init(){
    }
    
    func createAnimations(tipo: String) {
        
        let enemyAtlas = SKTextureAtlas(named: tipo)
        
        enemyViewN = enemyAtlas.textureNamed("\(tipo)_N-1")
        enemyViewS = enemyAtlas.textureNamed("\(tipo)_S-1")
        enemyViewE = enemyAtlas.textureNamed("\(tipo)_E-1")
        enemyViewW = enemyAtlas.textureNamed("\(tipo)_W-1")
        
        for i in 1...8 {
            //Body
            let playerTextureName1 = "\(tipo)_N-\(i)"
            skeletonWalkingFramesN.append(enemyAtlas.textureNamed(playerTextureName1))
            let playerTextureName2 = "\(tipo)_S-\(i)"
            skeletonWalkingFramesS.append(enemyAtlas.textureNamed(playerTextureName2))
            let playerTextureName3 = "\(tipo)_E-\(i)"
            skeletonWalkingFramesE.append(enemyAtlas.textureNamed(playerTextureName3))
            let playerTextureName4 = "\(tipo)_W-\(i)"
            skeletonWalkingFramesW.append(enemyAtlas.textureNamed(playerTextureName4))
        }
        
        for i in 1...7 {
            //body atack
            let playerTextureName1 = "slash_\(tipo)_N-\(i)"
            skeletonSlashN.append(enemyAtlas.textureNamed(playerTextureName1))
            let playerTextureName2 = "slash_\(tipo)_S-\(i)"
            skeletonSlashS.append(enemyAtlas.textureNamed(playerTextureName2))
            let playerTextureName3 = "slash_\(tipo)_E-\(i)"
            skeletonSlashE.append(enemyAtlas.textureNamed(playerTextureName3))
            let playerTextureName4 = "slash_\(tipo)_W-\(i)"
            skeletonSlashW.append(enemyAtlas.textureNamed(playerTextureName4))
        }
        for i in 1...6 {
            let deadBody = "dead_\(tipo)-\(i)"
            deadSkeleton.append(enemyAtlas.textureNamed(deadBody))
        }
    }
    
    func animateMove() {
        switch orientaCaminata {
        case 1:
            avatarEnemy.run(SKAction.repeatForever(SKAction.animate(with: skeletonWalkingFramesE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingSkeleton")
            /*helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetSkeleton")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggsMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsSkeleton")*/
        case 2:
            avatarEnemy.run(SKAction.repeatForever(SKAction.animate(with: skeletonWalkingFramesW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingSkeleton")
            
           /* helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetSkeleton")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggsMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsSkeleton")*/
            
        case 3:
            avatarEnemy.run(SKAction.repeatForever(SKAction.animate(with: skeletonWalkingFramesS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingSkeleton")
            
            /*helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetSkeleton")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggsMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsSkeleton")*/
            
        case 4:
           avatarEnemy.run(SKAction.repeatForever(SKAction.animate(with: skeletonWalkingFramesN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingEnemy")
            
            /*helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetSkeleton")
            leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggsMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsSkeleton")*/
            
        default:
            break
        }
        
    }
    
    func atack(){
        
        switch orientaCaminata {
        case 4:
           avatarEnemy.run(SKAction.animate(with: skeletonSlashN, timePerFrame: 0.1))
           weapon.run(SKAction.animate(with: myWeapon.weaponAttackN, timePerFrame: 0.1))
            
        case 2:
            avatarEnemy.run(SKAction.animate(with: skeletonSlashW, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.weaponAttackW, timePerFrame: 0.1))
            
        case 3:
           avatarEnemy.run(SKAction.animate(with: skeletonSlashS, timePerFrame: 0.1))
           weapon.run(SKAction.animate(with: myWeapon.weaponAttackS, timePerFrame: 0.1))
        case 1:
            avatarEnemy.run(SKAction.animate(with: skeletonSlashE, timePerFrame: 0.1))
            weapon.run(SKAction.animate(with: myWeapon.weaponAttackE, timePerFrame: 0.1))
        default:
            break
        }
        isAtack = false
        //orientarPersonaje()
    }
    
    
    func orientarPersonaje() {
        //resetpersonaje()
        switch orientaCaminata {
        case 1:
            avatarEnemy.run(SKAction.setTexture(enemyViewN))
            /*helm.run(SKAction.setTexture(helmFrames.textureNamed("Helm_N_1")))
            leggs.run(SKAction.setTexture(myLeggs.leggsMoves.textureNamed("Leggings_N-1")))*/
        case 2:
            avatarEnemy.run(SKAction.setTexture(enemyViewW))
        
            /*helm.run(SKAction.setTexture(helmFrames.textureNamed("Helm_W_I")))
            leggs.run(SKAction.setTexture(myLeggs.leggsMoves.textureNamed("Leggings_W-1")))*/
        case 3:
            avatarEnemy.run(SKAction.setTexture(enemyViewS))
            /*helm.run(SKAction.setTexture(helmFrames.textureNamed("Helm_S_I")))
            leggs.run(SKAction.setTexture(myLeggs.leggsMoves.textureNamed("Leggings_S-1")))*/
        case 4:
            avatarEnemy.run(SKAction.setTexture(enemyViewE))
            /*helm.run(SKAction.setTexture(helmFrames.textureNamed("Helm_E_I")))
            leggs.run(SKAction.setTexture(myLeggs.leggsMoves.textureNamed("Leggings_E-1")))*/
        default:
            
            break
        }
        
    }
    
    func muertePersonaje(){
        avatarEnemy.run(SKAction.animate(with: deadSkeleton, timePerFrame: 0.1))
        isAlive = false
    }
    
    
    func resetpersonaje(){
        avatarEnemy.removeAllActions()
        weapon.removeAllActions()
        hair.removeAllActions()
        leggs.removeAllActions()
        
    }
    func followPlayer(){
    
             
        switch orientaCaminata {
        case 1: //N
        Enemigo.run(SKAction.moveBy(x: CGFloat(1)*velocidad*velocidadXp, y: CGFloat(0), duration: 0.1))
         /*avatarEnemy.run(SKAction.repeatForever(SKAction.animate(with: skeletonWalkingFramesN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingSkeleton")
         helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
         leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggsMoveN,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")*/
        case 2: //W
         Enemigo.run(SKAction.moveBy(x: CGFloat(-1)*velocidad*velocidadXm, y: CGFloat(0), duration: 0.1))
       
         /*avatarEnemy.run(SKAction.repeatForever(SKAction.animate(with: skeletonWalkingFramesW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingSkeleton")
         helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
         leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggsMoveW,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")*/
            
        case 3: //S
         Enemigo.run(SKAction.moveBy(x: CGFloat(0), y: CGFloat(-1)*velocidad*velocidadYm, duration: 0.1))
         /*avatarEnemy.run(SKAction.repeatForever(SKAction.animate(with: skeletonWalkingFramesS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingSkeleton")
         helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
         leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggsMoveS,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")*/
            
        case 4: //E
         Enemigo.run(SKAction.moveBy(x: CGFloat(0), y: CGFloat(1)*velocidad*velocidadYp, duration: 0.1))
         /*avatarEnemy.run(SKAction.repeatForever(SKAction.animate(with: skeletonWalkingFramesE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"walkingSkeleton")
         helm.run(SKAction.repeatForever(SKAction.animate(with: myHelm.helmMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"helmetPlayer")
         leggs.run(SKAction.repeatForever(SKAction.animate(with: myLeggs.leggsMoveE,timePerFrame: 0.1,resize: false,restore: true)),withKey:"leggsPlayer")*/
        
        default:
            break
        }
        
    }
    
    
}
/*******/
