//
//  ViewController.swift
//  SaveMyDefaultsApp
//
//  Created by Sam Davenport on 3/5/24.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func saveButton(_ sender: UIButton) {
        UserDefaults.standard.set(serialNumberText.text, forKey: "Text")
        UserDefaults.standard.set(mySwitch.isOn, forKey: "Switch")
        UserDefaults.standard.set(slider.value, forKey: "Slider")
    }
    
    @IBAction func loadButton(_ sender: UIButton) {
        mySwitch.isOn = UserDefaults.standard.bool(forKey: "Switch")
        slider.value = UserDefaults.standard.float(forKey: "Slider")
        serialNumberText.text = UserDefaults.standard.string(forKey: "Text")
    }
    
    
    @IBAction func deleteButton(_ sender: UIButton) {
        mySwitch.isOn = true
        slider.value = 0.5
        serialNumberText.text = ""
    }
    
    @IBOutlet var serialNumberText: UITextField!
    @IBOutlet var slider: UISlider!
    @IBOutlet var mySwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

