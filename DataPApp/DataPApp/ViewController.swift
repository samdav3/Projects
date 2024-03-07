//
//  ViewController.swift
//  DataPApp
//
//  Created by Sam Davenport on 3/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var aboutText: UITextField!
    @IBOutlet var mySwitch: UISwitch!
    @IBOutlet var mySlider: UISlider!
    @IBOutlet var aboutDisplay: UITextView!
    
    @IBAction func saveBtn(_ sender: UIButton) {
        UserDefaults.standard.set(mySwitch.isOn, forKey: "Switch")
        UserDefaults.standard.set(mySlider.value, forKey: "Slider")
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            try aboutText.text?.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        }catch{
            print("Error writing file")
        }
    }
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        mySwitch.isOn = true
        mySlider.value = 0.5
        aboutDisplay.text?.removeAll()
    }
    
    @IBAction func loadBtn(_ sender: UIButton) {
        mySwitch.isOn = UserDefaults.standard.bool(forKey: "Switch")
        mySlider.value = UserDefaults.standard.float(forKey: "Slider")
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            aboutDisplay.text = fileContent
        }catch{
            print("Error writing file")
    }
    
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

