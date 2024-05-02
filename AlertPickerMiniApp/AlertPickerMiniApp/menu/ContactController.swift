//
//  ContactController.swift
//  AlertPickerMiniApp
//
//  Created by Sam Davenport on 3/28/24.
//

import UIKit

class ContactController: UIViewController {
    
    var userEmail = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(userEmail)")

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
        else if segue.identifier == "menu"{
            let menuVC = segue.destination as! MenuController
            menuVC.userEmail = userEmail
            menuVC.navigationItem.title = "Menu"
        }
        else if segue.identifier == "order"{
            let orderVC = segue.destination as! PickerPageViewController
            orderVC.userEmail = userEmail
            orderVC.navigationItem.title = "Picker Page"
        }
    }

}
