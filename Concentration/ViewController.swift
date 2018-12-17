//
//  ViewController.swift
//  Concentration
//
//  Created by Siddiqui, Arham J on 12/7/18.
//  Copyright © 2018 Siddiqui, Arham J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

