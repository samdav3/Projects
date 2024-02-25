//
//  ViewController.swift
//  AlertPickerMiniApp
//
//  Created by Sam Davenport on 2/24/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    //PickerView Functions
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
            case 0: return additionsCreamSelectorData.count
            default: return additionsFlavorSelectorData.count
            }
        }
        let returns = "\(sizeSelectorData.count) \(beanSelectorData.count) \(additionsCreamSelectorData.count) \(additionsFlavorSelectorData.count)"
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
            case 0: return additionsCreamSelectorData[row]
            default: return additionsFlavorSelectorData[row]
            }
        }
        let returns = "\(sizeSelectorData[row]) \(beanSelectorData[row]) \(additionsCreamSelectorData[row]) \(additionsFlavorSelectorData[row])"
        return returns
    }
    
    //Picker Page
    @IBOutlet var datePicker: UIDatePicker!
    let dateFormatter: DateFormatter = DateFormatter()
    @IBOutlet var sizeBeanSelector: UIPickerView!
    var sizeSelectorData: [String] = [String]()
    var beanSelectorData: [String] = [String]()
    @IBOutlet var sizeDsiplayReviewText: UILabel!
    @IBOutlet var beanDisplayReviewText: UILabel!
    @IBOutlet var dateDisplayReviewText: UILabel!
    
    //Submition Page
    @IBOutlet var additionsSelector: UIPickerView!
    var additionsCreamSelectorData: [String] = [String]()
    var additionsFlavorSelectorData: [String] = [String]()
    @IBOutlet var reviewOrder: UILabel!
    
    //Order Details Page
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
        additionsSelector.dataSource = self
        additionsSelector.delegate = self
        additionsCreamSelectorData = ["Whole", "Skim", "Almond Milk", "Coconut Milk", "Heavy Cream", "Half & Half"]
        additionsFlavorSelectorData = ["Vanilla", "Caramel", "Hazelnut", "Blueberry", "Mocha", "Salted Caramel"]
    }
    
    
    
    //Picker Page Functions
    @IBAction func saveSizeBeanSelectionsNext(_ sender: UIButton) {
        let sizeIndex = sizeBeanSelector.selectedRow(inComponent: 0)
        let beanIndex = sizeBeanSelector.selectedRow(inComponent: 1)
        let selectedDate: String = dateFormatter.string(from: datePicker.date)
        
        
        let alert = UIAlertController(title: "Preview Selections", message: "\(sizeSelectorData[sizeIndex])\(beanSelectorData[beanIndex])\(selectedDate)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Continue", style: .default, handler: { [self]alert -> Void in
            self.dateDisplayReviewText.text = selectedDate
            self.sizeDsiplayReviewText.text = self.sizeSelectorData[sizeIndex]
            self.beanDisplayReviewText.text = self.beanSelectorData[beanIndex]
           })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {alert -> Void in
            self.sizeDsiplayReviewText.text = "Nothing Selected"
            self.beanDisplayReviewText.text = "Nothing Selected"
            self.dateDisplayReviewText.text = "Nothing Selected"
        })
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //Submition Page Functions
    @IBAction func previewSeletions(_ sender: UIButton) {
        let selectedDate: String = dateFormatter.string(from: datePicker.date)
        let sizeIndex = sizeBeanSelector.selectedRow(inComponent: 0)
        let size = sizeSelectorData[sizeIndex]
        let beanIndex = sizeBeanSelector.selectedRow(inComponent: 1)
        let bean = beanSelectorData[beanIndex]
        let creamIndex = additionsSelector.selectedRow(inComponent: 0)
        let cream = additionsCreamSelectorData[creamIndex]
        let flavorIndex = additionsSelector.selectedRow(inComponent: 1)
        let flavor = additionsFlavorSelectorData[flavorIndex]
        
        reviewOrder.text = "\(size) \(bean) \(cream) \(flavor) pikcup on \(selectedDate)"
        
    }
    @IBAction func submitSelections(_ sender: UIButton) {
        let selectedDate: String = dateFormatter.string(from: datePicker.date)
        let sizeIndex = sizeBeanSelector.selectedRow(inComponent: 0)
        let size = sizeSelectorData[sizeIndex]
        let beanIndex = sizeBeanSelector.selectedRow(inComponent: 1)
        let bean = beanSelectorData[beanIndex]
        let creamIndex = additionsSelector.selectedRow(inComponent: 0)
        let cream = additionsCreamSelectorData[creamIndex]
        let flavorIndex = additionsSelector.selectedRow(inComponent: 1)
        let flavor = additionsFlavorSelectorData[flavorIndex]
        
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

