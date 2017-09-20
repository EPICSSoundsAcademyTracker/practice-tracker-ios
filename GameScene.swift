//
//  GameScene.swift
//  Waves
//
//  Created by James Arnold on 3/6/17.
//  Copyright © 2017 James Arnold. All rights reserved.
//

import SpriteKit
import GameplayKit

var scoreLabel: SKLabelNode!
//Font
let fontUsed = "Futura-Medium"


class GameScene: SKScene {
    let fish = SKSpriteNode(imageNamed: "fish")
    
    override func didMove(to view: SKView) {
        //Adds the fish to the screen
        fish.position = CGPoint(x: 0, y:0)
        fish.setScale(0.3)
        fish.zPosition = 10
        addChild(fish)
        
        let backgroundParticle = SKEmitterNode(fileNamed: "bubbles")

        backgroundParticle?.name = "backgroundParticle"
        backgroundParticle?.position = CGPoint(x: 0, y: -700)
        backgroundParticle?.targetNode = self.scene
        backgroundParticle?.particleZPosition = 0
        
        //Creates the score label
        scoreLabel = SKLabelNode(fontNamed: fontUsed)
        scoreLabel.text = "0"
        scoreLabel.fontSize = 100
        scoreLabel.horizontalAlignmentMode = .right
        //scoreLabel.zPosition = -1000
        
        
        //Make it so you can see the score on any device
        if DeviceType.IS_IPHONE_4_OR_LESS {
            print("4s, score label lowered slightly")
            scoreLabel.position = CGPoint(x: 600, y: 955)
        } else if DeviceType.IS_IPAD {
            print("iPad, score label lowered")
            scoreLabel.position = CGPoint(x: 600, y: 880)
        } else {
            scoreLabel.position = CGPoint(x: 600, y: 1020)
        }
        
        //Add the score label to the scene
        self.addChild(scoreLabel)
        
        
        //Bubbles
        self.addChild(backgroundParticle!)
        
        //Background Waves
        let waveA = childNode(withName: "waveA1") as? SKSpriteNode
        let moveLeft = SKAction.moveBy(x: 280, y: 0, duration: 1.5)
        let moveBack = SKAction.moveBy(x: -280, y: 0, duration: 0)
        let sequence = SKAction.sequence([moveLeft, moveBack])
        let constantWave = SKAction.repeatForever(sequence)
        waveA?.run(constantWave)
        
        let waveB = childNode(withName: "waveB1") as? SKSpriteNode
        let moveLeftB = SKAction.moveBy(x: 280, y: 0, duration: 2.5)
        let moveBackB = SKAction.moveBy(x: -280, y: 0, duration: 0)
        let sequenceB = SKAction.sequence([moveLeftB, moveBackB])
        let constantWaveB = SKAction.repeatForever(sequenceB)
        waveB?.run(constantWaveB)
        
        let waveC = childNode(withName: "waveC1") as? SKSpriteNode
        let moveLeftC = SKAction.moveBy(x: 280, y: 0, duration: 2.0)
        let moveBackC = SKAction.moveBy(x: -280, y: 0, duration: 0)
        let sequenceC = SKAction.sequence([moveLeftC, moveBackC])
        let constantWaveC = SKAction.repeatForever(sequenceC)
        waveC?.run(constantWaveC)
        
        let waveA2 = childNode(withName: "waveA2") as? SKSpriteNode
        let moveLeft2 = SKAction.moveBy(x: 280, y: 0, duration: 2.4)
        let moveBack2 = SKAction.moveBy(x: -280, y: 0, duration: 0)
        let sequence2 = SKAction.sequence([moveLeft2, moveBack2])
        let constantWave2 = SKAction.repeatForever(sequence2)
        waveA2?.run(constantWave2)
        
        let waveB2 = childNode(withName: "waveB2") as? SKSpriteNode
        let moveLeftB2 = SKAction.moveBy(x: 280, y: 0, duration: 3.0)
        let moveBackB2 = SKAction.moveBy(x: -280, y: 0, duration: 0)
        let sequenceB2 = SKAction.sequence([moveLeftB2, moveBackB2])
        let constantWaveB2 = SKAction.repeatForever(sequenceB2)
        waveB2?.run(constantWaveB2)
        
        let waveC2 = childNode(withName: "waveC2") as? SKSpriteNode
        let moveLeftC2 = SKAction.moveBy(x: 280, y: 0, duration: 1.0)
        let moveBackC2 = SKAction.moveBy(x: -280, y: 0, duration: 0)
        let sequenceC2 = SKAction.sequence([moveLeftC2, moveBackC2])
        let constantWaveC2 = SKAction.repeatForever(sequenceC2)
        waveC2?.run(constantWaveC2)
        
        let waveA3 = childNode(withName: "waveA3") as? SKSpriteNode
        let moveLeft3 = SKAction.moveBy(x: 280, y: 0, duration: 0.9)
        let moveBack3 = SKAction.moveBy(x: -280, y: 0, duration: 0)
        let sequence3 = SKAction.sequence([moveLeft3, moveBack3])
        let constantWave3 = SKAction.repeatForever(sequence3)
        waveA3?.run(constantWave3)
        
        let waveB3 = childNode(withName: "waveB3") as? SKSpriteNode
        let moveLeftB3 = SKAction.moveBy(x: 280, y: 0, duration: 2.3)
        let moveBackB3 = SKAction.moveBy(x: -280, y: 0, duration: 0)
        let sequenceB3 = SKAction.sequence([moveLeftB3, moveBackB3])
        let constantWaveB3 = SKAction.repeatForever(sequenceB3)
        waveB3?.run(constantWaveB3)
        
        let waveC3 = childNode(withName: "waveC3") as? SKSpriteNode
        let moveLeftC3 = SKAction.moveBy(x: 280, y: 0, duration: 2.7)
        let moveBackC3 = SKAction.moveBy(x: -280, y: 0, duration: 0)
        let sequenceC3 = SKAction.sequence([moveLeftC3, moveBackC3])
        let constantWaveC3 = SKAction.repeatForever(sequenceC3)
        waveC3?.run(constantWaveC3)
        
        let waveA4 = childNode(withName: "waveA4") as? SKSpriteNode
        let moveLeft4 = SKAction.moveBy(x: 280, y: 0, duration: 1.9)
        let moveBack4 = SKAction.moveBy(x: -280, y: 0, duration: 0)
        let sequence4 = SKAction.sequence([moveLeft4, moveBack4])
        let constantWave4 = SKAction.repeatForever(sequence4)
        waveA4?.run(constantWave4)
        
        let waveB4 = childNode(withName: "waveB4") as? SKSpriteNode
        let moveLeftB4 = SKAction.moveBy(x: 280, y: 0, duration: 3.4)
        let moveBackB4 = SKAction.moveBy(x: -280, y: 0, duration: 0)
        let sequenceB4 = SKAction.sequence([moveLeftB4, moveBackB4])
        let constantWaveB4 = SKAction.repeatForever(sequenceB4)
        waveB4?.run(constantWaveB4)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        // Called before each frame is rendered
        //let fish = childNode(withName: "fish") as? SKSpriteNode
        //print(global.frequency)
        let yPosition = (global.frequency*20+90)
        scoreLabel.text = "\(global.note)"
        print(yPosition)
        let point = CGPoint(x: 0,y :yPosition)
        let moveFish = SKAction.move(to: point, duration:0.2)
        fish.run(moveFish)
        
        //let spawnLocation = CGPoint(x:0.0, y:yPosition)
        //fish?.position = spawnLocation
        
        //Mirror image fish
        fish.xScale = fabs((fish.xScale)) * -1.0
        
        
    }
}
