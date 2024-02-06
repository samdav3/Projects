//
//  ViewController.swift
//  ChapterExercises
//
//  Created by Sam Davenport on 2/5/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelResult: UILabel!
    @IBOutlet var textMessage: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func changeButton(_ sender: UIButton) {
        labelResult.text = textMessage.text?.uppercased()
    }
    
}

