//
//  ViewController.swift
//  AlertPickerMiniApp
//
//  Created by Sam Davenport on 2/24/24.
//

import UIKit
import FirebaseFirestore



class ViewController: UIViewController {
    
    let loginVC = LoginController()
    var userEmail = ""
    let db = Firestore.firestore()
    @IBOutlet var userEmailDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userEmailDisplay.text = userEmail
        print("\(userEmail)")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: "account", sender: UIButton.self)
        performSegue(withIdentifier: "menu", sender: UIButton.self)
        performSegue(withIdentifier: "contact", sender: UIButton.self)
        performSegue(withIdentifier: "order", sender: UIButton.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login"{
            let accountVC = segue.destination as! LoginController
            accountVC.loginEmail?.text = userEmail
            accountVC.navigationItem.title = "Login"
        } else if segue.identifier == "menu"{
            let menuVC = segue.destination as! MenuController
            menuVC.userEmail = userEmail
            menuVC.navigationItem.title = "Menu"
        }
        else if segue.identifier == "contact"{
            let contactVC = segue.destination as! ContactController
            contactVC.userEmail = userEmail
            contactVC.navigationItem.title = "Contact"
        }
        else if segue.identifier == "order"{
            let orderVC = segue.destination as! PickerPageViewController
            orderVC.userEmail = userEmail
            orderVC.navigationItem.title = "Picker Page"
        }
    }
}
    
//    @IBAction func unwindToHome (_ sender: UIStoryboardSegue) {
////        let accountSourceViewController = sender.destination as? AccountController
////        let orderHisSourceViewController = sender.source as? OrderHiatoryViewController
////        let menuSourceViewController = sender.source as? MenuController
////        let contactSourceViewController = sender.source as? ContactController
////        let orderSourceViewController = sender.source as? PickerPageViewController
////        let submitionSourceViewController = sender.source as? SubmitionPageViewController
////        let orderDetailSourceViewController = sender.source as? OrderDetailsViewController
//        
//        if let accountSourceViewController = sender.source as? AccountController{
//            userEmail = accountSourceViewController.rcvdUserEmail
//        }
//        
////        if (segue == accountSourceViewController){
////            accountSourceViewController?.rcvdUserEmail = userEmail
////        }
////        else if (sender == orderHisSourceViewController){
////            userEmail = orderHisSourceViewController?.userEmail ?? ""
////        }
////        else if (sender == menuSourceViewController){
////            userEmail = menuSourceViewController?.userEmail ?? ""
////        }
////        else if (sender == orderSourceViewController){
////            userEmail = orderSourceViewController?.userEmail ?? ""
////        }
////        else if (sender == submitionSourceViewController){
////            userEmail = submitionSourceViewController?.userEmail ?? ""
////        }
////        else if (sender == orderDetailSourceViewController){
////            userEmail = orderDetailSourceViewController?.userEmail ?? ""
////        }
////        else if (sender == contactSourceViewController){
////            userEmail = contactSourceViewController?.userEmail ?? ""
////        }
//        
//        
//        
//    }
    


