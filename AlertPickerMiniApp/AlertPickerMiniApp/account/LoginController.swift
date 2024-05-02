//
//  LoginController.swift
//  AlertPickerMiniApp
//
//  Created by student on 4/23/24.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import FirebaseCore
import FirebaseDatabaseInternal
import SwiftUI

class LoginController: UIViewController {
    
    let db = Firestore.firestore()
    
    
    
    @IBOutlet var loginEmail: UITextField!
    @IBOutlet var loginPass: UITextField!
    //let db = Firestore.firestore()
    var userEmail = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginEmail.text = userEmail
        // Do any additional setup after loading the view
        
    }
    
    
    
    // NAVIGATION
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        performSegue(withIdentifier: "login", sender: UIButton.self)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "login"{
            let accountVC = segue.destination as! AccountController
            userEmail = loginEmail.text ?? ""
            accountVC.rcvdUserEmail = userEmail
            accountVC.navigationItem.title = "Account"
        }else if segue.identifier == "skipLogin"{
            let homeVC = segue.destination as! AccountController
            homeVC.navigationItem.title = "Account"
        }
    }
    
    
    
}
        

