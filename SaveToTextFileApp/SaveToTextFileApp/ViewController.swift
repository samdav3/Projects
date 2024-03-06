//
//  ViewController.swift
//  SaveToTextFileApp
//
//  Created by Sam Davenport on 3/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func writeTextButton(_ sender: UIButton) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            try writeTextBox.text.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        }catch{
            print("Error writing file")
        }
    }
    
    @IBAction func readTextButton(_ sender: UIButton) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            displayTextBox.text = fileContent
        }catch{
            print("Error writing file")
        }
    }
    
    @IBOutlet var writeTextBox: UITextView!
    @IBOutlet var displayTextBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        writeTextBox.text = "Type your new text here!"
        displayTextBox.text = ""
        
    }


}

