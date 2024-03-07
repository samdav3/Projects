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
    
    @IBAction func saveBtn(_ sender: UIButton) {
        UserDefaults.standard.set(mySwitch.isOn, forKey: "Switch")
        UserDefaults.standard.set(mySlider.value, forKey: "Slider")
        let about = NSEntityDescription.insertNewObject(forEntityName: "Data", into: dataManager)
        about.setValue(nameText.text, forKey: "name")
        do {
            try self.dataManager.save()
            listArray.append(about)
        }catch{
            print("Error saving data")
        }
/*       let age = NSEntityDescription.insertNewObject(forEntityName: "Data", into: dataManager)
       }catch{
            print("Error saving data")
        }
        let profession = NSEntityDescription.insertNewObject(forEntityName: "Data", into: dataManager)
        profession.setValue(professionText.text, forKey: "profession")
        do {
            try self.dataManager.save()
            listArray.append(profession)
        }catch{
            print("Error saving data")
        }
 */
        aboutMeDisplay.text?.removeAll()
        fetchData()
    }
    
    @IBAction func loadBtn(_ sender: UIButton) {
        mySwitch.isOn = UserDefaults.standard.bool(forKey: "Switch")
        mySlider.value = UserDefaults.standard.float(forKey: "Slider")
        fetchData()
   
    }
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        mySwitch.isOn = true
        mySlider.value = 0.5
        let deleteAbout = nameText.text!
//        let deleteAge = ageInt.text!
//        let deleteProfession = professionText.text!
        for item in listArray{
            if item.value(forKey: "name") as! String == deleteAbout{
                dataManager.delete(item)
            }
/*            if item.value(forKey: "age") as! String == deleteAge{
                dataManager.delete(item)
            }
            if item.value(forKey: "profession") as! String == deleteProfession{
                dataManager.delete(item)
            }
 */
            do {
                try self.dataManager.save()
            }catch{
                print("Error deleting data")
            }
            aboutMeDisplay.text?.removeAll()
            nameText.text?.removeAll()
 //           ageInt.text?.removeAll()
 //           professionText.text?.removeAll()
            fetchData()
        }
    }
    
    @IBOutlet var nameText: UITextField!
//    @IBOutlet var ageInt: UITextField!
//    @IBOutlet var professionText: UITextField!
    @IBOutlet var aboutMeDisplay: UITextView!
    @IBOutlet var mySlider: UISlider!
    @IBOutlet var mySwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        dataManager = appDelegate.persistentContainer.viewContext
        aboutMeDisplay.text?.removeAll()
        fetchData()
        
    }
    
    func fetchData(){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Data")
        do {
            let result = try dataManager.fetch(fetchRequest)
            listArray = result as! [NSManagedObject]
            for item in listArray {
                let aboutEntry = item.value(forKey: "name") as! String
//                let ageEntry = item.value(forKey: "age") as! String
 //               let professionEntry = item.value(forKey: "profession") as! String
                //let displayString = "Hi! My Name is \(nameEntry), I am \(ageEntry) years old and my profession is \(professionEntry)"
                aboutMeDisplay.text! += aboutEntry
//                aboutMeDisplay.text! += ageEntry
 //               aboutMeDisplay.text! += professionEntry
            }
        }catch{
            print("Error retrieving data")
        }
    }


}

