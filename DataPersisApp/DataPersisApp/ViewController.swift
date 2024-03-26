//
//  ViewController.swift
//  DataPersisApp
//
//  Created by Sam Davenport on 3/6/24.
//

import UIKit
import CoreData
import Foundation

class ViewController: UIViewController {
    
    var dataManager : NSManagedObjectContext!
    var listArray = [NSManagedObject]()
    
    @IBOutlet var mySlider: UISlider!
    @IBOutlet var mySwitch: UISwitch!
    @IBOutlet var aboutInput: UITextField!
    @IBOutlet var aboutDisplay: UITextView!
    
    @IBAction func saveBtn(_ sender: UIButton) {
        UserDefaults.standard.set(mySwitch.isOn, forKey: "Switch")
        UserDefaults.standard.setValue(mySlider.value, forKey: "Slider")
        let about = NSEntityDescription.insertNewObject(forEntityName: "Data", into: dataManager)
        about.setValue(aboutInput.text, forKey: "name")
        do{
            try self.dataManager.save()
        }catch{
            print("Error saving data ")
        }
        aboutDisplay.text?.removeAll()
        fetchData()
    }
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        mySwitch.isOn = true
        mySlider.value = 0.5
        
        
        let deleteAbout = aboutInput.text!
        for item in listArray{
            if item.value(forKey: "name") as! String == deleteAbout{
                dataManager.delete(item)
            }
            do {
                try self.dataManager.save()
            }catch{
                print("Error deleteing data")
            }
        }
        aboutDisplay.text?.removeAll()
        aboutInput.text?.removeAll()
        fetchData()
    }
    
    @IBAction func loadBtn(_ sender: UIButton) {
        mySwitch.isOn = UserDefaults.standard.bool(forKey: "Switch")
        mySlider.value = UserDefaults.standard.float(forKey: "Slider")
        fetchData()
        
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        dataManager = appDelegate.persistentContainer.viewContext
        aboutDisplay.text?.removeAll()
        fetchData()
        
    }
    
    func fetchData(){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Data")
        do {
            let result = try dataManager.fetch(fetchRequest)
            listArray = result as! [NSManagedObject]
            for item in listArray {
                let product = item.value(forKey: "name") as! String
                aboutDisplay.text! += product
            }
        }catch{
            print("Error retreiving data")
        }
    }


}

