//
//  OrderHistoryViewController.swift
//  AlertPickerMiniApp
//
//  Created by student on 5/1/24.
//

import UIKit
import FirebaseFirestore

class OrderHistoryViewController: UIViewController {
    
    let db = Firestore.firestore()

    var svdSize = ""
    var svdCoffee = ""
    var svdCream = ""
    var svdFlavor = ""
    let orderDetails = OrderDetailsViewController()
    var userEmail = ""
    
    
    @IBOutlet var order1: UITextField!
    @IBOutlet var order2: UITextField!
    @IBOutlet var order3: UITextField!
    @IBOutlet var order4: UITextField!
    @IBOutlet var order5: UITextField!
    @IBOutlet var order6: UITextField!
    @IBOutlet var order7: UITextField!
    @IBOutlet var order8: UITextField!
    @IBOutlet var order9: UITextField!
    @IBOutlet var order10: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func loadHistory() async {
        do{
            var orderSz = ""
            var orderCf = ""
            var orderCrm = ""
            var orderFlvr = ""

            let document = try await db.collection("users").document(userEmail).collection("orders").document("").getDocument()
            var orderDate = document.documentID
            if(document.exists){
                orderSz = document.get("size") as! String
                orderCf = document.get("coffee") as! String
                orderCrm = document.get("cream") as! String
                orderFlvr = document.get("flavor") as! String
//     PUT ORDER HISTORY FROM DATABASE IN UI TETFIELDS
                order1.text = "\(document.documentID) \(orderSz) \(orderCf) \(orderCrm) \(orderFlvr)"
//                userSz.text = orderSz
//                userCf.text = orderCf
//                userCrm.text = orderCrm
//                userFlvr.text = orderFlvr
            }else{
                let updateAlert = UIAlertController(title: "No Order History Found", message: "You have no saved Orders in your Account.", preferredStyle: .alert)
                updateAlert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(updateAlert, animated: true, completion: nil)
            }

        }
        catch {
            print("Error retrieving data from database.")

        }
    }

    /*
    // MARK: - Navigation*/

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "new order"{
             let newVC = segue.destination as! PickerPageViewController
             newVC.userEmail = userEmail
             newVC.navigationItem.title = "Picker Page"
         }else if segue.identifier == "home"{
             let homeVC = segue.destination as! ViewController
             homeVC.userEmail = userEmail
             homeVC.navigationItem.title = "Home"
         }
         else if(segue.identifier == "login"){
             let accountVC = segue.destination as! LoginController
             accountVC.loginEmail?.text = userEmail
             accountVC.navigationItem.title = "Login"
         }
         else if segue.identifier == "menu"{
             let menuVC = segue.destination as! MenuController
             menuVC.userEmail = userEmail
             menuVC.navigationItem.title = "Menu"
         }
         else if segue.identifier == "contact"{
             let contactVC = segue.destination as! ContactController
             contactVC.userEmail = userEmail
             contactVC.navigationItem.title = "Contact"
         }
         
     }

}
