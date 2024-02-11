//
//  ViewController.swift
//  MiniApp-CarOptions
//
//  Created by Sam Davenport on 2/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    // MARK: PaintColor
    @IBOutlet var PaintColorSelectorLabel: UILabel!
    @IBOutlet var PaintColorSelected: UILabel!
    @IBOutlet var PaintColorText: UITextField!
    
    
     
    // MARK: InteriorColor
    @IBOutlet var InteriorColorSelectorLabel: UILabel!
    @IBOutlet var InteriorColorSelected: UILabel!
    @IBOutlet var InteriorColorText: UITextField!
    
    
    
    // MARK: EngineSize
    @IBOutlet var EngineSizeSelectorLabel: UILabel!
    @IBOutlet var EngineSizeSelected: UILabel!
    @IBOutlet var EngineSizeText: UITextField!
    
    
    
    // MARK: Preview
    @IBOutlet var PreviewButton: UIButton!
    @IBOutlet var PreviewTextBox: UITextField!
    
    // MARK: Submit
    @IBOutlet var SubmitButton: UIButton!
    @IBOutlet var SelectionsSubmittedTextBox: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: Methods
    // MARK: Selectors
    
    
    // MARK: ButtonActions
    @IBAction func PreviewButtonAction(_ sender: UIButton) {
        //Actions when Preview Button Selected
        PreviewTextBox.text = "Preview Vehicle Selections:"
        PaintColorSelected.text = PaintColorText.text
        InteriorColorSelected.text = InteriorColorText.text
        EngineSizeSelected.text = EngineSizeText.text
        
    }
    
    @IBAction func SubmitButtonAction(_ sender: UIButton) {
        //Actions when Submit Button Selected
        SelectionsSubmittedTextBox.text = "Your Selections have been submitted!"
        
        
    }
    
    

}

