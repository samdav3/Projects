//
//  OrderDetailsViewController.swift
//  AlertPickerMiniApp
//
//  Created by Sam Davenport on 2/29/24.
//

import UIKit
import SwiftUI

class OrderDetailsViewController: UIViewController {
    
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
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sizeOrder.text = szOrder
        coffeeOrder.text = cfOrder
        creamOrder.text = crmOrder
        flavorOrder.text = flvrOrder
        orderDate.text = "Pickup Date: " + date

    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "new order"{
            let newVC = segue.destination as! PickerPageViewController
            newVC.navigationItem.title = "Picker Page"
        }else if segue.identifier == "home3"{
            let homeVC = segue.destination as! ViewController
            homeVC.navigationItem.title = "Home"
        }else if segue.identifier == "saveOrder"{
            let orderHisVC = OrderHiatoryViewController()
            orderHisVC.svdSize = szOrder
            orderHisVC.svdCoffee = cfOrder
            orderHisVC.svdCream = crmOrder
            orderHisVC.svdFlavor = flvrOrder
            
            let updateAlert = UIAlertController(title: "Order Saved", message: "Your Order has been added to your Account Order History!", preferredStyle: .alert)
            updateAlert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(updateAlert, animated: true, completion: nil)
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
