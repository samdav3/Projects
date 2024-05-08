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

    let orderDetails = OrderDetailsViewController()
    var userEmail = ""
    
    
    @IBOutlet var order1: UILabel!
    @IBOutlet var order2: UILabel!
    @IBOutlet var order3: UILabel!
    @IBOutlet var order4: UILabel!
    @IBOutlet var order5: UILabel!
    
    
    let sizeArray: Array = ["16oz", "20oz", "24oz"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(userEmail)")
        Task{
            print("you made it to the task")
            await loadHistory()
        }

        // Do any additional setup after loading the view.
    }

    
    func loadHistory() async {
        print("you made it to the load function")
        do{
            var orderSz = ""
            var orderCf = ""
            var orderCrm = ""
            var orderFlvr = ""
            
            let orders = try await db.collection("users").document(userEmail).collection("orders").getDocuments()
            if (orders.isEmpty){
                print("failure")
                let updateAlert = UIAlertController(title: "No Order History Found", message: "You have no saved Orders in your Account.", preferredStyle: .alert)
                updateAlert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(updateAlert, animated: true, completion: nil)
                
            }else{
                print("you made it to the order docs")
                
                let docIDA = db.collection("users").document(userEmail).collection("orders").document("Americano").documentID
                let docIDCB = db.collection("users").document(userEmail).collection("orders").document("Cold Brew").documentID
                let docIDC = db.collection("users").document(userEmail).collection("orders").document("Cappucino").documentID
                let docIDD = db.collection("users").document(userEmail).collection("orders").document("Decaf").documentID
                let docIDL = db.collection("users").document(userEmail).collection("orders").document("Latte").documentID
                let orderDocA = try await db.collection("users").document(userEmail).collection("orders").document(docIDA).getDocument()
                let orderDocCB = try await db.collection("users").document(userEmail).collection("orders").document(docIDCB).getDocument()
                let orderDocC = try await db.collection("users").document(userEmail).collection("orders").document(docIDC).getDocument()
                let orderDocD = try await db.collection("users").document(userEmail).collection("orders").document(docIDD).getDocument()
                let orderDocL = try await db.collection("users").document(userEmail).collection("orders").document(docIDL).getDocument()
                //print(orderDoc)
//                orderSz = orderDoc.get("size") as! String
//                orderCf = orderDoc.get("coffee") as! String
//                orderCrm = orderDoc.get("cream") as! String
//                orderFlvr = orderDoc.get("flavor") as! String
//     PUT ORDER HISTORY FROM DATABASE IN UI TETFIELDS
                if orderDocA.exists {
                    order1.text = "\(orderDocA.get("size") as! String) \(orderDocA.get("coffee") as! String) \(orderDocA.get("cream") as! String) \(orderDocA.get("flavor") as! String)"
                }
                else{
                    print("no values")
                }
                if orderDocCB.exists {
                    order2.text = "\(orderDocCB.get("size") as! String) \(orderDocCB.get("coffee") as! String) \(orderDocCB.get("cream") as! String) \(orderDocCB.get("flavor") as! String)"
                }else{
                    print("no values")
                }
                if orderDocC.exists {
                    order3.text = "\(orderDocC.get("size") as! String) \(orderDocC.get("coffee") as! String) \(orderDocC.get("cream") as! String) \(orderDocC.get("flavor") as! String)"
                }
                else{
                    print("no values")
                }
                if orderDocD.exists {
                    order4.text = "\(orderDocD.get("size") as! String) \(orderDocD.get("coffee") as! String) \(orderDocD.get("cream") as! String) \(orderDocD.get("flavor") as! String)"
                }
                else{
                    print("no values")
                }
                if orderDocL.exists {
                    order5.text = "\(orderDocL.get("size") as! String) \(orderDocL.get("coffee") as! String) \(orderDocL.get("cream") as! String) \(orderDocL.get("flavor") as! String)"
                }
                else{
                    print("no values")
                }
                
                
                

            }
        }catch {
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
