//
//  MenuController.swift
//  AlertPickerMiniApp
//
//  Created by Sam Davenport on 3/28/24.
//

import UIKit

class MenuController: UIViewController {
    
    var userEmail = ""
    @IBOutlet var userEmailTextBox: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(userEmail)")
        userEmailTextBox.text = userEmail
        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login"{
            let accountVC = segue.destination as! LoginController
            accountVC.loginEmail?.text = userEmail
            accountVC.navigationItem.title = "Login"
        }
        else if segue.identifier == "home"{
            let homeVC = segue.destination as! ViewController
            homeVC.userEmail = userEmail
            homeVC.navigationItem.title = "Home"
        }
        else if segue.identifier == "contact"{
            let contactVC = segue.destination as! ContactController
            contactVC.userEmail = userEmail
            contactVC.navigationItem.title = "Contact"
        }
        else if segue.identifier == "order"{
            let orderVC = segue.destination as! PickerPageViewController
            orderVC.userEmail = userEmail
            orderVC.navigationItem.title = "Picker Page"
        }
    }

}
