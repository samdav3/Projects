//
//  AccountController.swift
//  AlertPickerMiniApp
//
//  Created by Sam Davenport on 3/28/24.
//
 
import UIKit
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseAppCheck
import CoreMedia

class AccountController: UIViewController {
    
    let db = Firestore.firestore()
    
    // USER INPUT FIELDS
    // ACCOUNT
    @IBOutlet var userEmail: UITextField!
    @IBOutlet var userPassword: UITextField!
    @IBOutlet var userName: UITextField!
    @IBOutlet var userPhone: UITextField!
    @IBOutlet var userAddress: UITextField!
    
    // PAYMENT INFO
    @IBOutlet var userCardNum: UITextField!
    @IBOutlet var userCardExp: UITextField!
    @IBOutlet var userCardCVV: UITextField!
    var rcvdUserEmail = ""

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userEmail.text = rcvdUserEmail
        
    }
    
    @IBAction func refreshBtn(_ sender: UIButton) {
        // TEMPORARY FOR TESTING
        userName.text = ""
        userEmail.text = ""
        userPassword.text = ""
        userPhone.text = ""
        userAddress.text = ""
        userCardCVV.text = ""
        userCardExp.text = ""
        userCardNum.text = ""
    }
    
    
    
    // ADD OR UPDATE ACCOUNT INFO
    
    @IBAction func updateButton(_ sender: UIButton) {
        
        Task {
            await updateEntry()
        }
        
        
    }
    
    func updateEntry() async {
        do {
            _ = try await db.collection("users").document(userEmail.text!).setData([
                "email": userEmail.text!,
                "password": userPassword.text!,
                "name": userName.text!,
                "phone": userPhone.text!,
                "address": userAddress.text!,
                "cardNum": userCardNum.text!,
                "cardExp": userCardExp.text!,
                "CVV": userCardCVV.text!
            ])
            let docID = db.collection("users").document(userEmail.text!).documentID

            print("Document added/updated with ID: \(docID)")

            let updateAlert = UIAlertController(title: "Account Info Saved", message: "Document added.updated with ID: \(docID)", preferredStyle: .alert)
            updateAlert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(updateAlert, animated: true, completion: nil)
            

        }
        catch {
            print("Error adding document: \(error)")
            
        }
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


