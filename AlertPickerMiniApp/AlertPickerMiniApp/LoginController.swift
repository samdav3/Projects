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
    
    @IBOutlet var loginEmail: UITextField!
    @IBOutlet var loginPass: UITextField!
    //let db = Firestore.firestore()
    var userEmail = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view
        
    }
    
    
    
    // NAVIGATION
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: "login", sender: UIButton.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        userEmail = loginEmail.text ?? ""
        if segue.identifier == "login"{
            let nextVC = segue.destination as! ViewController
            nextVC.navigationItem.title = "Home"
            nextVC.userEmail = userEmail
        } else if segue.identifier == "skipLogin"{
            let homeVC = segue.destination as! ViewController
            homeVC.navigationItem.title = "Home"
        }
    }
}
    
    
//    
//    @IBAction func LoginBtn(_ sender: UIButton) {
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) async {
//            
//            if segue.identifier == "login"{
//                
//                do{
//                    
//                    // SET CURRENT USER DATA
//                    
//                    let userDoc = try await db.collection("users").document(loginEmail.text ?? "").getDocument()
//                    var exists = userDoc.exists
//                    userEmail = loginEmail.text ?? ""
//                    
//                    if exists == true {
//                        let nextVC = segue.destination as! ViewController
//                        nextVC.navigationItem.title = "Home"
//                        nextVC.userEmail = userEmail
//                    }
//                    
//                    else if exists == false {
//                        
//                        // ALERT THAT EMAIL NOT FOUND
//                        
//                        loginEmail.text = ""
//                        loginPass.text = ""
//                        @State var showingAlert = false
//                        
//                        var updateAlert: some View {
//                            Button("Show Alert") {
//                                showingAlert = true
//                            }
//                            .alert("Email not found. Please try again or skip Login.", isPresented: $showingAlert) {
//                                Button("OK", role: .cancel) { }
//                            }
//                        }
//                        
//                    }
//                    
//                }
//                
//                catch{
//                    print("ERROR: Actions not accepted")
//                }
//                
//                //}
//                
//                //            else if segue.identifier == "skipLogin" {
//                //                    let homeVC = segue.destination as! ViewController
//                //                    homeVC.navigationItem.title = "Home"
//                //            }
//                
//            }
//        }
    

