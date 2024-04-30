//
//  ViewController.swift
//  AlertPickerMiniApp
//
//  Created by Sam Davenport on 2/24/24.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

    let loginVC = LoginController()
    var userEmail = ""
    let db = Firestore.firestore()
    @IBOutlet var userEmailDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userEmailDisplay.text = userEmail
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: "account", sender: UIButton.self)
        performSegue(withIdentifier: "menu", sender: UIButton.self)
        performSegue(withIdentifier: "contact", sender: UIButton.self)
        performSegue(withIdentifier: "order", sender: UIButton.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login"{
            let accountVC = segue.destination as! LoginController
            accountVC.navigationItem.title = "Login"
        } else if segue.identifier == "menu"{
            let menuVC = segue.destination as! MenuController
            menuVC.navigationItem.title = "Menu"
        }
        else if segue.identifier == "contact"{
            let contactVC = segue.destination as! ContactController
            contactVC.navigationItem.title = "Contact"
        }
        else if segue.identifier == "order"{
            let orderVC = segue.destination as! PickerPageViewController
            orderVC.navigationItem.title = "Picker Page"
        }
    }
  
    
    @IBAction func unwindToHome (_ sender: UIStoryboardSegue) {}
    
}

