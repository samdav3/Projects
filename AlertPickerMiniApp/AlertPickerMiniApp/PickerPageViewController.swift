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
    //@IBOutlet var sizeBeanSelectorCollection: UIPickerView!
    var sizeSelectorData: [String] = [String]()
    var beanSelectorData: [String] = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Picker Page
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .medium
        sizeBeanSelector.dataSource = self
        sizeBeanSelector.delegate =  self
        sizeSelectorData = ["16oz", "20oz", "24oz"]
        beanSelectorData = ["Americano", "Cold Brew", "Latte", "Cappucino", "Decaf"]
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
    @IBAction func saveSizeBeanSelectionsButton(_ sender: UIButton) {
        let sizeIndex = sizeBeanSelector.selectedRow(inComponent: 0)
        let beanIndex = sizeBeanSelector.selectedRow(inComponent: 1)
        let selectedDate: String = dateFormatter.string(from: datePicker.date)
        
        
        let alert = UIAlertController(title: "Preview Selections", message: "\(sizeSelectorData[sizeIndex])\(beanSelectorData[beanIndex])\(selectedDate)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Continue", style: .default, handler: { alert -> Void in
            //TODO -- HOW TO GET THIS DATA TO THE NEXT PAGE
            //self.dateDisplayReviewText.text = selectedDate
            //self.sizeDsiplayReviewText.text = self.sizeSelectorData[sizeIndex]
            //self.beanDisplayReviewText.text = self.beanSelectorData[beanIndex]
           })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {alert -> Void in
            //TODO -- HOW TO GET THIS DATA TO THE NEXT PAGE  OR  TO STAY ON CURRENT PAGE
            //self.sizeDsiplayReviewText.text = "Nothing Selected"
            //self.beanDisplayReviewText.text = "Nothing Selected"
            //self.dateDisplayReviewText.text = "Nothing Selected"
        })
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


