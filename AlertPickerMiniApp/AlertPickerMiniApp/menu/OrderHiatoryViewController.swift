//
//  OrderHiatoryViewController.swift
//  AlertPickerMiniApp
//
//  Created by student on 4/10/24.
//

import UIKit
import SwiftUI

class OrderHiatoryViewController: UIViewController {
    
    var svdSize = ""
    var svdCoffee = ""
    var svdCream = ""
    var svdFlavor = ""
    let orderDetails = OrderDetailsViewController()
    @IBOutlet var displayOrder: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // PULL IN SAVED ORDER DATA
        
        svdSize = orderDetails.szOrder
        svdCoffee = orderDetails.cfOrder
        svdCream = orderDetails.crmOrder
        svdFlavor = orderDetails.flvrOrder
        displayOrder.text = ("\(svdSize) \(svdCoffee) add \(svdCream) add \(svdFlavor)")
        
        
    }
    
//    func receiveOrders(){
//        
//        struct Item: Hashable {
//            var size: String
//            var coffee: String
//            var cream: String
//            var flavor: String
//            var color: UIColor
//        }
//        
//        struct OrderView: View {
//            
//            @State var listItems = [Item]()
//            //            @State var addSize: String = ""-0
//            //            @State var addCoffee: String = ""
//            //            @State var addCream: String = ""
//            //            @State var addFlavor: String = ""
//            @State var addItem = false
//            
//            var body: some View {
//                ZStack {
//                    VStack {
//                        NavigationView {
//                            List {
//                                ForEach(listItems, id: \.self) { item in
//                                    Text("\(item.size) \(item.coffee) \(item.cream) \(item.flavor)").listRowBackground(Color(.systemBrown)).padding(5)
//                                }
//                            }
//                            
//                        }
//                        
//                    }
//                }
//            }
//            
//            struct ContentView_Previews: PreviewProvider {
//                
//                var svdSize = orderDetails.szOrder
//                var svdCoffee = orderDetails.cfOrder
//                var svdCream = orderDetails.crmOrder
//                var svdFlavor = orderDetails.flvrOrder
//                
//                static var previews: some View {
//                    
//                    OrderView(listItems: [Item(size: svdSize, coffee: svdCoffee, cream: svdCream, flavor: svdFlavor, color: UIColor.white)], addItem: true)
//                }
//            }
//        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "home"){
            let homeVC = segue.destination as! ViewController
            homeVC.navigationItem.title = "Home"
        }
        else if (segue.identifier == "orderHis=orderNew"){
            let nextVC = segue.destination as! PickerPageViewController
            nextVC.navigationItem.title = "Picker Page"
        }
        else if(segue.identifier == "menu"){
            let menuVC = segue.destination as! MenuController
            menuVC.navigationItem.title = "Menu"
        }
        else if(segue.identifier == "account"){
            let accountVC = segue.destination as! AccountController
            accountVC.navigationItem.title = "Account"
        }
        else if(segue.identifier == "contact"){
            let contactVC = segue.destination as! ContactController
            contactVC.navigationItem.title = "Contact"
        }
    }
        
}
