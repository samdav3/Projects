//
//  ViewController.swift
//  AlertPickerMiniApp2
//
//  Created by Sam Davenport on 2/24/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    //Picker Page
    
    @IBOutlet var sizeBeanSelector: UIPickerView!
    var sizeSelectorData: [String] = [String]()
    var beanSelectorData: [String] = [String]()
    
    
    //Submition Page
    
    
    //Order Details Page
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Picker Page
        
        sizeBeanSelector.dataSource = self
        sizeBeanSelector.delegate = self
        sizeSelectorData = ["16oz", "20oz", "24oz"]
        beanSelectorData = ["Americano", "Cold Brew", "Latte", "Cappucino", "Decaf"]
        
        //Submition Page
    }
    
    //PickerView Functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            switch component{
            case 0: return sizeSelectorData.count
            default: return beanSelectorData.count
            }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
            switch component{
            case 0: return sizeSelectorData[row]
            default: return beanSelectorData[row]
            }
        }
    }
    
    //Picker Page Functions




