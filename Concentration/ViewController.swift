//
//  ViewController.swift
//  Concentration
//
//  Created by Siddiqui, Arham J on 12/7/18.
//  Copyright © 2018 Siddiqui, Arham J. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Sample", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        } catch {}
    }
    
    @IBAction func Play(_ sender: UIButton) {
        audioPlayer.play()
        
    }
    
    @IBAction func musicon(_ sender: UIButton) {
        audioPlayer.play()
    }
    
    @IBAction func musicoff(_ sender: UIButton) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        } else {
            audioPlayer.play()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is BoardController {
            let destination = segue.destination as! BoardController
            if segue.identifier == "easy" {
                destination.rows = 3
                destination.columns = 4
            } else if segue.identifier == "medium" {
                destination.rows = 4
                destination.columns = 6
            } else if segue.identifier == "hard" || segue.identifier == "extreme" {
                destination.rows = 6
                destination.columns = 6
            }
        }
    }
}


