//
//  ViewController.swift
//  TickTackToe
//
//  Created by Sam Davenport on 2/5/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cell1Selection: UILabel!
    @IBOutlet var cell2Selection: UILabel!
    @IBOutlet var cell3Selection: UILabel!
    @IBOutlet var cell4Selection: UILabel!
    @IBOutlet var cell5Selection: UILabel!
    @IBOutlet var cell6Selection: UILabel!
    @IBOutlet var cell7Selection: UILabel!
    @IBOutlet var cell8Selection: UILabel!
    @IBOutlet var cell9Selection: UILabel!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    
    @IBAction func cell1X(_ sender: UIButton) {
        cell1Selection.text = "X"
    }
    
    @IBAction func cell1O(_ sender: UIButton) {
        cell1Selection.text = "O"
    }
    
    @IBAction func cell2X(_ sender: UIButton) {
        cell2Selection.text = "X"
    }
    
    @IBAction func cell2O(_ sender: UIButton) {
        cell2Selection.text = "O"
    }
    
    @IBAction func cell3X(_ sender: UIButton) {
        cell3Selection.text = "X"
    }
    
    @IBAction func cell3O(_ sender: UIButton) {
        cell3Selection.text = "O"
    }
    
    @IBAction func cell4X(_ sender: UIButton) {
        cell4Selection.text = "X"
    }
    
    @IBAction func cell4O(_ sender: UIButton) {
        cell4Selection.text = "O"
    }
    
    @IBAction func cell5X(_ sender: UIButton) {
        cell5Selection.text = "X"
    }
    @IBAction func cell5O(_ sender: UIButton) {
        cell5Selection.text = "O"
    }
    
    @IBAction func cell6X(_ sender: UIButton) {
        cell6Selection.text = "X"
    }
    
    @IBAction func cell6O(_ sender: UIButton) {
        cell6Selection.text = "O"
    }
    
    @IBAction func cell7X(_ sender: UIButton) {
        cell7Selection.text = "X"
    }
    
    @IBAction func cell7O(_ sender: UIButton) {
        cell7Selection.text = "O"
    }
    
    @IBAction func cell8X(_ sender: UIButton) {
        cell8Selection.text = "X"
    }
    
    @IBAction func cell8O(_ sender: UIButton) {
        cell8Selection.text = "O"
    }
    
    @IBAction func cell9X(_ sender: UIButton) {
        cell9Selection.text = "X"
    }
    
    @IBAction func cell9O(_ sender: UIButton) {
        cell9Selection.text = "O"
    }
    
    
    
    
    
}

