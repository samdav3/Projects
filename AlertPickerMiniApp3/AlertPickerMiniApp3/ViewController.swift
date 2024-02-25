//
//  ViewController.swift
//  AlertPickerMiniApp3
//
//  Created by Sam Davenport on 2/24/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            switch component{
            case 0: return sizeSelectorData.count
            default: return beanSelectorData.count
            }
        }
        if pickerView.tag == 2{
            switch component{
            case 0: return additionCreamSelector.count
            default: return additionFlavorSelector.count
            }
        }
        let returns = "\(sizeSelectorData.count) \(beanSelectorData.count) \(additionCreamSelector.count) \(additionFlavorSelector.count)"
        return returns.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1{
            
            switch component{
            case 0: return sizeSelectorData[row]
            default: return beanSelectorData[row]
            }
        }
        
        if pickerView.tag == 2{
            switch component{
            case 0: return additionCreamSelector[row]
            default: return additionFlavorSelector[row]
            }
        }
        let returns = "\(sizeSelectorData[row]) \(beanSelectorData[row]) \(additionCreamSelector[row]) \(additionFlavorSelector[row])"
        return returns
    }
    

    @IBOutlet var dateTimePicker: UIDatePicker!
    let dateFormatter: DateFormatter = DateFormatter()
    @IBOutlet var sizeBeanSelector: UIPickerView!
    var sizeSelectorData: [String] = [String]()
    var beanSelectorData: [String] = [String]()
    @IBOutlet var additionSelector: UIPickerView!
    var additionCreamSelector: [String] = [String]()
    var additionFlavorSelector: [String] = [String]()
    @IBOutlet var orderDetailsSubmitted: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Picker Page
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .medium
        sizeBeanSelector.dataSource = self
        sizeBeanSelector.delegate =  self
        sizeSelectorData = ["16oz", "20oz", "24oz"]
        beanSelectorData = ["Americano", "Cold Brew", "Latte", "Cappucino", "Decaf"]
        
        //Submition Page
        additionSelector.dataSource = self
        additionSelector.delegate = self
        additionCreamSelector = ["Whole", "Skim", "Almond Milk", "Coconut Milk", "Heavy Cream", "Half & Half"]
        additionFlavorSelector = ["Vanilla", "Caramel", "Hazelnut", "Blueberry", "Mocha", "Salted Caramel"]
    }
    
    
    //Submition Page Functions
    
    @IBAction func submitSelections(_ sender: UIButton) {
        let selectedDate: String = dateFormatter.string(from: dateTimePicker.date)
        let sizeIndex = sizeBeanSelector.selectedRow(inComponent: 0)
        let size = sizeSelectorData[sizeIndex]
        let beanIndex = sizeBeanSelector.selectedRow(inComponent: 1)
        let bean = beanSelectorData[beanIndex]
        let creamIndex = additionSelector.selectedRow(inComponent: 0)
        let cream = additionCreamSelector[creamIndex]
        let flavorIndex = additionSelector.selectedRow(inComponent: 1)
        let flavor = additionFlavorSelector[flavorIndex]
        
        let alert = UIAlertController(title: "You are about to submit this following order:", message: "\(size)\(bean)\(cream)\(flavor) on \(selectedDate)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Submit", style: .default, handler: {alert -> Void in
            self.orderDetailsSubmitted.text = "Your Order has been Submitted: \(size) \(bean) with \(cream) and \(flavor). Your Order was placed for \(selectedDate)"
           })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {alert -> Void in
            self.orderDetailsSubmitted.text = "Nothing Selected. Please go back and submit an order."
            
        })
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }

}

