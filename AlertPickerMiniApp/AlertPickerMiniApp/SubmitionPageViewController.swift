//
//  SubmitionPageViewController.swift
//  AlertPickerMiniApp
//
//  Created by Sam Davenport on 2/29/24.
//

import UIKit

class SubmitionPageViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //Submition Page
    @IBOutlet var additionsSelector: UIPickerView!
    var additionsCreamSelectorData: [String] = [String]()
    var additionsFlavorSelectorData: [String] = [String]()
    @IBOutlet var reviewOrder: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Submition Page
        additionsSelector.dataSource = self
        additionsSelector.delegate = self
        additionsCreamSelectorData = ["Whole", "Skim", "Almond Milk", "Coconut Milk", "Heavy Cream", "Half & Half"]
        additionsFlavorSelectorData = ["Vanilla", "Caramel", "Hazelnut", "Blueberry", "Mocha", "Salted Caramel"]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            switch component{
            case 0: return additionsCreamSelectorData.count
            default: return additionsFlavorSelectorData.count
            }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    @IBAction func previewSeletions(_ sender: UIButton) {
        //let selectedDate: String = dateFormatter.string(from: datePicker.date)
        //let sizeIndex = sizeBeanSelector.selectedRow(inComponent: 0)
        //let size = sizeSelectorData[sizeIndex]
        //let beanIndex = sizeBeanSelector.selectedRow(inComponent: 1)
        //let bean = beanSelectorData[beanIndex]
        let creamIndex = additionsSelector.selectedRow(inComponent: 0)
        let cream = additionsCreamSelectorData[creamIndex]
        let flavorIndex = additionsSelector.selectedRow(inComponent: 1)
        let flavor = additionsFlavorSelectorData[flavorIndex]
        //\(size) \(bean) \(selectedDate)
        reviewOrder.text = "'size' 'bean' \(cream) \(flavor) pickup on 'selectedDate'"
        
    }
    @IBAction func submitSelections(_ sender: UIButton) {
        //let selectedDate: String = dateFormatter.string(from: datePicker.date)
        //let sizeIndex = sizeBeanSelector.selectedRow(inComponent: 0)
        //let size = sizeSelectorData[sizeIndex]
        //let beanIndex = sizeBeanSelector.selectedRow(inComponent: 1)
        //let bean = beanSelectorData[beanIndex]
        let creamIndex = additionsSelector.selectedRow(inComponent: 0)
        let cream = additionsCreamSelectorData[creamIndex]
        let flavorIndex = additionsSelector.selectedRow(inComponent: 1)
        let flavor = additionsFlavorSelectorData[flavorIndex]
        //TODO -- HOW TO GET LAST PAGE DATE HERE
        //\(size)\(bean)\(selectedDate)
        let alert = UIAlertController(title: "You are about to submit this following order:", message: "'size' 'bean' \(cream)\(flavor) on 'selectedDate", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Submit", style: .default, handler: {alert -> Void in
            //TODO -- HOW TO GET LAST PAGE DATE HERE
            //self.orderDetailsSubmitted.text = "Your Order has been Submitted: \(size) \(bean) with \(cream) and \(flavor). Your Order was placed for \(selectedDate)C"
           })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {alert -> Void in
            //TODO -- HOW TO GET LAST PAGE DATE HERE
            //self.orderDetailsSubmitted.text = "Nothing Selected. Please go back and submit an order."
            
        })
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
