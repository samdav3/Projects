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
    public var rcvdUserEmail = ""
    var userPassD = ""
    var userNameD = ""
    var userPhoneD = ""
    var userAddressD = ""
    var userCardNumD = ""
    var userCardExpD = ""
    var userCardCVVD = ""
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (rcvdUserEmail == ""){
            print("do nothing")
        }else{
            Task{
                await login()
            }
        }
        
        
        
        
    }
    
        func login() async {
            do{
    
                var userPassD = ""
                var userNameD = ""
                var userPhoneD = ""
                var userAddressD = ""
                var userCardNumD = ""
                var userCardExpD = ""
                var userCardCVVD = ""
    
                let document = try await db.collection("users").document(rcvdUserEmail).getDocument()
                if(document.exists){
                    userPassD = document.get("password") as! String
                    userNameD = document.get("name") as! String
                    userPhoneD = document.get("phone") as! String
                    userAddressD = document.get("address") as! String
                    userCardNumD = document.get("cardNum") as! String
                    userCardExpD = document.get("cardExp") as! String
                    userCardCVVD = document.get("CVV") as! String
    
                    userEmail.text = rcvdUserEmail
                    userPassword.text = userPassD
                    userName.text = userNameD
                    userPhone.text = userPhoneD
                    userAddress.text = userAddressD
                    userCardNum.text = userCardNumD
                    userCardExp.text = userCardExpD
                    userCardCVV.text = userCardCVVD
                    
                }else{
                    let updateAlert = UIAlertController(title: "Email not Found", message: "Please try again or create a New Account.", preferredStyle: .alert)
                    updateAlert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                    self.present(updateAlert, animated: true, completion: nil)
                }
    
    
            }
            catch {
                print("Error retrieving data or user skipped login.")
    
            }
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
    
    // NAVIGATION
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "home"{
            let homeVC = segue.destination as! ViewController
            homeVC.userEmail = rcvdUserEmail
            homeVC.navigationItem.title = "Home"
        } else if segue.identifier == "menu"{
            let menuVC = segue.destination as! MenuController
            menuVC.userEmail = rcvdUserEmail
            menuVC.navigationItem.title = "Menu"
        }
        else if segue.identifier == "contact"{
            let contactVC = segue.destination as! ContactController
            contactVC.userEmail = rcvdUserEmail
            contactVC.navigationItem.title = "Contact"
        }
        else if segue.identifier == "order"{
            let orderVC = segue.destination as! PickerPageViewController
            orderVC.userEmail = rcvdUserEmail
            orderVC.navigationItem.title = "Picker Page"
        }
        else if segue.identifier == "orderHistory" {
//            let layout = UICollectionViewFlowLayout()
//            let vc = OrderHistoryCollectionViewController(collectionViewLayout: layout)
//            present(vc, animated: true)
            let nextVC = segue.destination as! OrderHistoryViewController
            nextVC.userEmail = rcvdUserEmail
            nextVC.navigationItem.title = "Order History"
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






