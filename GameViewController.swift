//
//  GameViewController.swift
//  Waves
//
//  Created by James Arnold on 3/6/17.
//  Copyright © 2017 James Arnold. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import Beethoven
import Pitchy
import Hue
import Cartography

class GameViewController: UIViewController {
    
    //Accessing the frequency
    var frequency = global.frequency
    
    //Initializing the Pitch Engine
    lazy var pitchEngine: PitchEngine = { [weak self] in
        var config = Config(estimationStrategy: .yin)
        let pitchEngine = PitchEngine(config: config, delegate: self)
        pitchEngine.levelThreshold = -30.0
        
        return pitchEngine
        }()
    
    //View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
            //Load the pitch engine
            pitchEngine.active ? pitchEngine.stop() : pitchEngine.start()
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

// MARK: - PitchEngineDelegate

extension GameViewController: PitchEngineDelegate {
    
    func pitchEngineDidReceivePitch(_ pitchEngine: PitchEngine, pitch: Pitch) {
        
        let offsetPercentage = pitch.closestOffset.percentage
        let absOffsetPercentage = abs(offsetPercentage)
        
        global.frequency = Double(pitch.note.index)
        print(pitch.note.letter)
        global.note = String(describing: pitch.note.letter)
        
        guard absOffsetPercentage > 1.0 else {
            return
        }
        
    }
    
    func pitchEngineDidReceiveError(_ pitchEngine: PitchEngine, error: Error) {
        print(error)
    }
    
    public func pitchEngineWentBelowLevelThreshold(_ pitchEngine: PitchEngine) {
        print("Below level threshold")
    }
}

