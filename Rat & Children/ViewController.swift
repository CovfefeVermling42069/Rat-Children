//
//  ViewController.swift
//  Rat & Children
//
//  Created by paul alcott on 3/9/20.
//  Copyright © 2020 paul alcott. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    var audioPlayer:AVAudioPlayer?
    var audioPlayerMusic:AVAudioPlayer?
    let bearCuts = [ "BearCut1", "BearCut2", "BearCut3", "BearCut4" ]
    let bear2Cuts = [ "Bear2Cut1", "Bear2Cut2", "Bear2Cut3", "Bear2Cut4" ]
    let daBears = [ "Da Bear", "Da Bear 2" ]
    let motorcycles = [ "Motorcycle", "Motorcycle2" ]
    let rats = [ "Rat", "RatCut1" ]

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        playSound("Under the Skin Fade Out", true)
        
        UIView.animate(withDuration: 14, delay: 0, options: [.allowUserInteraction], animations:
            {
                self.mainView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            },
            completion: nil
        )

    }

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        mainView.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        playSound("Under the Skin with Strings", true)
        
        UIView.animate(withDuration: 18, delay: 0, options: [.curveEaseIn, .allowUserInteraction], animations:
            {
                self.mainView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            },
            completion: nil
        )
    }
    
    @IBAction func ratTapped(_ sender: UIButton) {
        handleButtonPressed(sender)
        playSound(rats.randomElement() ?? "Rat")
    }
    
    @IBAction func ratTouchDown(_ sender: UIButton) {
        handleButtonDown(sender)
    }

    @IBAction func bearClawTapped(_ sender: UIButton) {
        handleButtonPressed(sender)
        playSound(bear2Cuts.randomElement() ?? "Bear")
    }
    
    @IBAction func bearClawTouchDown(_ sender: UIButton) {
        handleButtonDown(sender)
    }

    @IBAction func bearHeadTapped(_ sender: UIButton) {
        handleButtonPressed(sender)
        playSound(bearCuts.randomElement() ?? "Bear2")
    }
    
    @IBAction func bearHeadTouchDown(_ sender: UIButton) {
        handleButtonDown(sender)
    }

    @IBAction func strawTapped(_ sender: UIButton) {
        handleButtonPressed(sender)
        playSound("Slurp")
    }
    
    @IBAction func strawTouchDown(_ sender: UIButton) {
        handleButtonDown(sender)
    }

    @IBAction func motorcycleTapped(_ sender: UIButton) {
        handleButtonPressed(sender)
        playSound(motorcycles.randomElement() ?? "Motorcycle")
    }
    
    @IBAction func motorcycleTouchDown(_ sender: UIButton) {
        handleButtonDown(sender)
    }
    
    @IBAction func ditkaTapped(_ sender: UIButton) {
        handleButtonPressed(sender)
        playSound(daBears.randomElement() ?? "Da Bear")
    }
    
    @IBAction func ditkaTouchDown(_ sender: UIButton) {
        handleButtonDown(sender)
    }
        
    fileprivate func handleButtonPressed(_ sender: UIButton) {
        sender.alpha = 1
    }
    
    fileprivate func handleButtonDown(_ sender: UIButton) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        sender.pulsate()
        sender.alpha = 0.5
    }
    
    fileprivate func playSound(_ fileName: String, _ playInBackground: Bool = false, _ fileExtension: String="wav") {
        let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        
        if url != nil
        {
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback)
                if (playInBackground)
                {
                    audioPlayerMusic = try AVAudioPlayer(contentsOf: url!)
                    audioPlayerMusic?.play()
                }
                else
                {
                    audioPlayer = try AVAudioPlayer(contentsOf: url!)
                    audioPlayer?.play()
                }
            }
            catch {
                print("error")
            }
        }
    }
}

