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
        
        // Do any additional setup after loading the view
        
    }
    
    
    
    // NAVIGATION
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: "login", sender: UIButton.self)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) async {
        userEmail = loginEmail.text ?? ""
        if segue.identifier == "login"{
            let nextVC = segue.destination as! AccountController
            
            do{
                let document = try await db.collection("users").document(loginEmail.text ?? "").getDocument()
                let userPassD = document.get("password")
                let userNameD = document.get("name")
                let userPhoneD = document.get("phone")
                let userAddressD = document.get("address")
                let userCardNumD = document.get("cardNum")
                let userCardExpD = document.get("cardExp")
                let userCardCVVD = document.get("CVV")
                nextVC.rcvdUserEmail = userEmail
                nextVC.userPassD = userPassD as! String
                nextVC.userNameD = userNameD as! String
                nextVC.userPhoneD = userPhoneD as! String
                nextVC.userAddressD = userAddressD as! String
                nextVC.userCardNumD = userCardNumD as! String
                nextVC.userCardExpD = userCardExpD as! String
                nextVC.userCardCVVD = userCardCVVD as! String
            }catch {
                print("Error retrieving data or user skipped login.")
                
            }
            nextVC.navigationItem.title = "Account"
        } else if segue.identifier == "skipLogin"{
            let homeVC = segue.destination as! AccountController
            homeVC.navigationItem.title = "Account"
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
    

