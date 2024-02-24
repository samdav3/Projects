//
//  ViewController.swift
//  ThreePickerApp
//
//  Created by Sam Davenport on 2/24/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var myPicker: UIPickerView!
    var componentOne: [String] = [String]()
    var componentTwo: [String] = [String]()
    var componentThree: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        componentOne = ["cat", "dog", "hamster", "lizard", "parrot", "goldfish"]
        componentTwo = ["house", "apartment", "condo", "RV"]
        componentThree = ["indoor", "outdoor"]
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component{
            case 0: return componentOne.count
            case 1: return componentTwo.count
        default: return componentThree.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component{
            case 0: return componentOne[row]
            case 1: return componentTwo[row]
        default: return componentThree[row]
        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let petIndex = myPicker.selectedRow(inComponent: 0)
        let homeIndex = myPicker.selectedRow(inComponent: 1)
        let placeIndex = myPicker.selectedRow(inComponent: 2)
        
        let alert = UIAlertController(title: "Your Choice", message: "\(componentOne[petIndex]) \(componentTwo[homeIndex]) \(componentThree[placeIndex])", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {action -> Void in
            
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

