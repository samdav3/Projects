//
//  OrderDetailsViewController.swift
//  AlertPickerMiniApp
//
//  Created by Sam Davenport on 2/29/24.
//

import UIKit
import SwiftUI
import FirebaseFirestore

class OrderDetailsViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    //Order Details Page
    @IBOutlet var orderDetails: UILabel!
    @IBOutlet var orderDate: UILabel!
    var date = ""
    @IBOutlet var sizeOrder: UILabel!
    var szOrder = ""
    @IBOutlet var coffeeOrder: UILabel!
    var cfOrder = ""
    @IBOutlet var creamOrder: UILabel!
    var crmOrder = ""
    @IBOutlet var flavorOrder: UILabel!
    var flvrOrder = ""
    var userEmail = ""
    @IBOutlet var userEmailTextBox: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userEmailTextBox.text = userEmail
        sizeOrder.text = szOrder
        coffeeOrder.text = cfOrder
        creamOrder.text = crmOrder
        flavorOrder.text = flvrOrder
        orderDate.text = "Pickup Date: " + date

    }
    

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
    
    func saveOrder() async {
        do{
            _ = try await db.collection("users").document("\(userEmail)").collection("orders").document("\(date)").setData([
                "size": szOrder,
                "coffee": cfOrder,
                "cream": crmOrder,
                "flavor": flvrOrder
            ])
            let docID = db.collection("users").document("\(userEmail)").collection("orders").document("\(date)").documentID
            print("Document added with ID \(docID)")
            
            let updateAlert = UIAlertController(title: "Order Saved", message: "Your Order has been added to your Accounts Order History!", preferredStyle: .alert)
                updateAlert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(updateAlert, animated: true, completion: nil)
        }
        catch{
            print("Error saving Order")
        }
    }
    
    @IBAction func saveOrder(_ sender: UIButton) {
        
        if (userEmail == ""){
            let updateAlert = UIAlertController(title: "Unable to Save Order", message: "You must be logged in to Save your Orders.", preferredStyle: .alert)
            updateAlert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(updateAlert, animated: true, completion: nil)
        }else {
            
            Task{
                await saveOrder()
            }
        }
        
        
    }
    
    
    
    
//    @IBAction func saveOrderBtn(_ sender: UIButton) {
//        
//        let orderHisVC = OrderHiatoryViewController()
//        orderHisVC.svdSize = szOrder
//        orderHisVC.svdCoffee = cfOrder
//        orderHisVC.svdCream = crmOrder
//        orderHisVC.svdFlavor = flvrOrder
//        
//        let updateAlert = UIAlertController(title: "Order Saved", message: "Your Order has been added to your Account Order History!", preferredStyle: .alert)
//        updateAlert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
//        self.present(updateAlert, animated: true, completion: nil)
//    }
    
}
