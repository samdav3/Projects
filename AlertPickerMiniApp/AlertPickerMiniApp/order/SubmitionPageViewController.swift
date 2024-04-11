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
    @IBOutlet var reviewSize: UILabel!
    @IBOutlet var reviewCoffee: UILabel!
    @IBOutlet var reviewCream: UILabel!
    @IBOutlet var reviewFlavor: UILabel!
    
    @IBOutlet var receivedDate: UILabel!
    var rcvdDate = ""
    @IBOutlet var receivedSize: UILabel!
    var rcvdSize = ""
    @IBOutlet var receivedCoffee: UILabel!
    var rcvdCoffee = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedDate.text = rcvdDate
        receivedSize.text = rcvdSize
        receivedCoffee.text = rcvdCoffee

        //Submition Page
        additionsSelector.dataSource = self
        additionsSelector.delegate = self
        additionsCreamSelectorData = ["Whole Milk", "Skim Milk", "Oat Milk", "Coconut Milk", "Heavy Cream", "Half & Half"]
        additionsFlavorSelectorData = ["Vanilla", "Caramel", "Hazelnut", "Blueberry", "Mocha", "Salted Caramel"]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: "next", sender: UIButton.self)
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let nextVC = segue.destination as! OrderDetailsViewController
            let creamIndex = additionsSelector.selectedRow(inComponent: 0)
            let flavorIndex = additionsSelector.selectedRow(inComponent: 1)
            nextVC.navigationItem.title = "Order Page"
            nextVC.szOrder = rcvdSize
            nextVC.cfOrder = rcvdCoffee
            nextVC.date = rcvdDate
            nextVC.crmOrder = additionsCreamSelectorData[creamIndex]
            nextVC.flvrOrder = additionsFlavorSelectorData[flavorIndex]
        }else if segue.identifier == "home2"{
            let homeVC = segue.destination as! ViewController
            homeVC.navigationItem.title = "Home"
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            switch component{
            case 0: return additionsCreamSelectorData.count
            default: return additionsFlavorSelectorData.count
            }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component{
        case 0: return additionsCreamSelectorData[row]
        default: return additionsFlavorSelectorData[row]
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    @IBAction func previewSeletions(_ sender: UIButton) {
        let creamIndex = additionsSelector.selectedRow(inComponent: 0)
        let flavorIndex = additionsSelector.selectedRow(inComponent: 1)
        let previewCrm = additionsCreamSelectorData[creamIndex]
        let previewFlvr = additionsFlavorSelectorData[flavorIndex]
        reviewSize.text = rcvdSize
        reviewCoffee.text = rcvdCoffee
        reviewCream.text = "with " + previewCrm
        reviewFlavor.text = "and " + previewFlvr
        
    }
    

}
