////
////  StartScreenScene.swift
////  Waves
////
////  Created by James Arnold on 3/30/17.
////  Copyright © 2017 James Arnold. All rights reserved.
////
//
//import Foundation
//import Foundation
//import SpriteKit
//import AVFoundation
//
//
//
//class StartScreenScene: SKScene, SKPhysicsContactDelegate {
//    
//    override func didMove(to view: SKView) {
//        super.didMove(to: view)
//        
//        
//        // 1. Create a physics body that borders the screen
//        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
//        // 2. Set the friction of that physicsBody to 0
//        borderBody.friction = 1
//        // 3. Set physicsBody of scene to borderBody
//        self.physicsBody = borderBody
//        
//        self.physicsWorld.contactDelegate = self
//        
//        
//        //Are music and effects sounds on?
//        print("Music is turned off:", UserDefaults.standard.bool(forKey: "music"))
//        print("Effects are turned off:", UserDefaults.standard.bool(forKey: "effects"))
//        
//        
//        //Hide sound off indicators
//        if UserDefaults.standard.bool(forKey: "music") == false {
//            let musicButtonOff = childNode(withName: MusicButtonOffCategoryName) as! SKSpriteNode
//            musicButtonOff.isHidden = true
//            
//            //Play music
//            GameViewController.MusicHelper.sharedHelper.audioPlayer!.volume = 1.0
//            
//        }
//        
//        if UserDefaults.standard.bool(forKey: "music") == true {
//            let musicButton = childNode(withName: MusicButtonCategoryName) as! SKSpriteNode
//            musicButton.isHidden = true
//            
//            //Mute music
//            GameViewController.MusicHelper.sharedHelper.audioPlayer!.volume = 0.0
//        }
//        
//        
//        
//        
//        //Effects button visibility set to user default
//        if UserDefaults.standard.bool(forKey: "effects") == false {
//            let effectsButtonOff = childNode(withName: EffectsButtonOffCategoryName) as! SKSpriteNode
//            effectsButtonOff.isHidden = true
//            
//        }
//        
//        if UserDefaults.standard.bool(forKey: "effects") == true {
//            let effectsButton = childNode(withName: EffectsButtonCategoryName) as! SKSpriteNode
//            effectsButton.isHidden = true
//        }
//        
//    }
//    
//    
//    //Pushing a button on the homescreen
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch: AnyObject in touches {
//            let location = touch.location(in: self)
//            let node = self.atPoint(location) //1
//            if node.name == "startButton" { //2
//                
//                //Change this to make the animations take longer or shorter
//                let animationDuration = 0.5
//                
//                //Animate the screen for a pro transition
//                let redBucket = childNode(withName: StartRedBucketCategoryName) as! SKSpriteNode
//                let blueBucket = childNode(withName: StartBlueBucketCategoryName) as! SKSpriteNode
//                let purpleBucket = childNode(withName: StartPurpleBucketCategoryName) as! SKSpriteNode
//                let orangeBucket = childNode(withName: StartOrangeBucketCategoryName) as! SKSpriteNode
//                
//                //let colorfulBackground = childNode(withName: ColorfulBackgroundCategoryName) as! SKSpriteNode
//                let gameName = childNode(withName: GameNameCategoryName) as! SKLabelNode
//                let gameName2 = childNode(withName: GameName2CategoryName) as! SKLabelNode
//                //let blurBall = childNode(withName: BlurBallCategoryName) as! SKSpriteNode
//                let startButton = childNode(withName: StartButtonCategoryName) as! SKSpriteNode
//                //let shadow = childNode(withName: ShadowCategoryName) as! SKSpriteNode
//                
//                let musicButton = childNode(withName: MusicButtonCategoryName) as! SKSpriteNode
//                let effectsButton = childNode(withName: EffectsButtonCategoryName) as! SKSpriteNode
//                let aboutButton = childNode(withName: AboutButtonCategoryName) as! SKSpriteNode
//                
//                let musicButtonOff = childNode(withName: MusicButtonOffCategoryName) as! SKSpriteNode
//                let effectsButtonOff = childNode(withName: EffectsButtonOffCategoryName) as! SKSpriteNode
//                
//                
//                let backgroundSwitch = SKAction.fadeOut(withDuration: animationDuration - 0.2)
//                //colorfulBackground.run(backgroundSwitch)
//                gameName.run(backgroundSwitch)
//                gameName2.run(backgroundSwitch)
//                //blurBall.run(backgroundSwitch)
//                startButton.run(backgroundSwitch)
//                //shadow.run(backgroundSwitch)
//                
//                musicButton.run(backgroundSwitch)
//                effectsButton.run(backgroundSwitch)
//                aboutButton.run(backgroundSwitch)
//                
//                musicButtonOff.run(backgroundSwitch)
//                effectsButtonOff.run(backgroundSwitch)
//                
//                
//                //Resize
//                let resizeRed = SKAction.resize(byWidth: -103, height: -133, duration: animationDuration)
//                redBucket.run(resizeRed)
//                
//                let resizeBlue = SKAction.resize(byWidth: -68, height: -87, duration: animationDuration)
//                blueBucket.run(resizeBlue)
//                
//                let resizePurple = SKAction.resize(byWidth: -36, height: -45, duration: animationDuration)
//                purpleBucket.run(resizePurple)
//                print(redBucket.size)
//                
//                let resizeOrange = SKAction.resize(byWidth: -11, height: -12, duration: animationDuration)
//                orangeBucket.run(resizeOrange)
//                
//                
//                //Move
//                let moveRed = SKAction.move(to: CGPoint(x:77.492, y:115.341), duration: TimeInterval(animationDuration))
//                redBucket.run(moveRed)
//                
//                let moveBlue = SKAction.move(to: CGPoint(x:238.096, y:116.049), duration: TimeInterval(animationDuration))
//                blueBucket.run(moveBlue)
//                
//                let movePurple = SKAction.move(to: CGPoint(x:397.647, y:115.912), duration: TimeInterval(animationDuration))
//                purpleBucket.run(movePurple)
//                
//                let moveOrange = SKAction.move(to: CGPoint(x:560.333, y:116.37), duration: TimeInterval(animationDuration))
//                orangeBucket.run(moveOrange)
//                
//                
//                
//                
//                //Switches to the GameScene after all the animation is done
//                let delay = animationDuration * Double(NSEC_PER_SEC)
//                let time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
//                DispatchQueue.main.asyncAfter(deadline: time) {
//                    score = 0
//                    let gameScene = GameScene(size: self.size)
//                    let transition = SKTransition.crossFade(withDuration: 0.1)
//                    gameScene.scaleMode = SKSceneScaleMode.aspectFill
//                    
//                    let newScene = GameScene(fileNamed:"GameScene")
//                    
//                    newScene!.scaleMode = .aspectFill
//                    
//                    self.scene!.view?.presentScene(newScene!, transition: transition)
//                    
//                }
//                
//                
//            }
//            
//            
//            //Controls the user toggling the music
//            
//            //If the Music Button is pressed
//            if node.name == "musicButton" {
//                print("Music turned off")
//                let musicButton = childNode(withName: MusicButtonCategoryName) as! SKSpriteNode
//                musicButton.isHidden = true
//                
//                let musicButtonOff = childNode(withName: MusicButtonOffCategoryName) as! SKSpriteNode
//                musicButtonOff.isHidden = false
//                
//                musicOff = true
//                print(musicOff)
//                
//                
//                //Music defaults
//                UserDefaults.standard.set(musicOff, forKey: "music")
//                UserDefaults.standard.synchronize()
//                
//                print("Music:", UserDefaults.standard.bool(forKey: "music"))
//                
//                //Mute music
//                GameViewController.MusicHelper.sharedHelper.audioPlayer!.volume = 0.0
//                
//            }
//            
//            //If the Music Button Off is pressed
//            if node.name == "musicButtonOff" {
//                print("Music turned on")
//                let musicButton = childNode(withName: MusicButtonCategoryName) as! SKSpriteNode
//                musicButton.isHidden = false
//                
//                let musicButtonOff = childNode(withName: MusicButtonOffCategoryName) as! SKSpriteNode
//                musicButtonOff.isHidden = true
//                
//                musicOff = false
//                print(musicOff)
//                
//                //Music defaults
//                UserDefaults.standard.set(musicOff, forKey: "music")
//                UserDefaults.standard.synchronize()
//                
//                print("Music:", UserDefaults.standard.bool(forKey: "music"))
//                
//                //Play music
//                GameViewController.MusicHelper.sharedHelper.audioPlayer!.volume = 1.0
//                
//            }
//            
//            //If the Sound Effects Button is pressed
//            if node.name == "effectsButton" {
//                print("Effects turned off")
//                let effectsButton = childNode(withName: EffectsButtonCategoryName) as! SKSpriteNode
//                effectsButton.isHidden = true
//                
//                let effectsButtonOff = childNode(withName: EffectsButtonOffCategoryName) as! SKSpriteNode
//                effectsButtonOff.isHidden = false
//                
//                effectsOff = true
//                print(effectsOff)
//                
//                
//                //Effects defaults
//                UserDefaults.standard.set(effectsOff, forKey: "effects")
//                UserDefaults.standard.synchronize()
//                
//                print("Effects:", UserDefaults.standard.bool(forKey: "effects"))
//                
//            }
//            
//            //If the Effects Button Off is pressed
//            if node.name == "effectsButtonOff" {
//                print("Effects turned on")
//                let effectsButton = childNode(withName: EffectsButtonCategoryName) as! SKSpriteNode
//                effectsButton.isHidden = false
//                
//                let effectsButtonOff = childNode(withName: EffectsButtonOffCategoryName) as! SKSpriteNode
//                effectsButtonOff.isHidden = true
//                
//                effectsOff = false
//                print(effectsOff)
//                
//                //Effects defaults
//                UserDefaults.standard.set(effectsOff, forKey: "effects")
//                UserDefaults.standard.synchronize()
//                
//                print("Effects:", UserDefaults.standard.bool(forKey: "effects"))
//                
//                
//                //Play pop sound to indicate sound effects are on
//                GameViewController.MusicHelperEffects.sharedHelper.ballPop()
//            }
//            
//            //If the About Button is pressed
//            if node.name == "aboutButton" {
//                print("About button")
//                let gameScene = AboutScreenScene(size: self.size)
//                let transition = SKTransition.crossFade(withDuration: 0.1)
//                gameScene.scaleMode = SKSceneScaleMode.aspectFill
//                
//                let newScene = AboutScreenScene(fileNamed:"AboutScreen")
//                
//                newScene!.scaleMode = .aspectFill
//                
//                self.scene!.view?.presentScene(newScene!, transition: transition)
//            }
//        }
//    }
//    
//}
