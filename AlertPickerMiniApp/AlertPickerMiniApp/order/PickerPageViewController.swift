//
//  PickerPageViewController.swift
//  AlertPickerMiniApp
//
//  Created by Sam Davenport on 2/29/24.
//

import UIKit

class PickerPageViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet var datePicker: UIDatePicker!
    let dateFormatter = DateFormatter()
    @IBOutlet var sizeBeanSelector: UIPickerView!
    var sizeSelectorData: [String] = [String]()
    var beanSelectorData: [String] = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Picker Page
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        sizeBeanSelector.dataSource = self
        sizeBeanSelector.delegate =  self
        sizeSelectorData = ["16oz", "20oz", "24oz"]
        beanSelectorData = ["Americano", "Cold Brew", "Latte", "Cappucino", "Decaf"]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: "next", sender: UIButton.self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let nextVC = segue.destination as! SubmitionPageViewController
            let sizeIndex = sizeBeanSelector.selectedRow(inComponent: 0)
            let beanIndex = sizeBeanSelector.selectedRow(inComponent: 1)
            let date = dateFormatter.string(from: datePicker.date)
            nextVC.navigationItem.title = "Submition Page"
            nextVC.rcvdDate = date
            nextVC.rcvdSize = sizeSelectorData[sizeIndex]
            nextVC.rcvdCoffee = beanSelectorData[beanIndex]
        } else if segue.identifier == "home1"{
            let homeVC = segue.destination as! ViewController
            homeVC.navigationItem.title = "Home"
        }
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
    
