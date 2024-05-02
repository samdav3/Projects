////
////  OrderHistoryCollectionViewController.swift
////  AlertPickerMiniApp
////
////  Created by student on 5/1/24.
////
//
//import UIKit
//import FirebaseFirestore
//
//private let reuseIdentifier = "Cell"
//
//class OrderHistoryCollectionViewController: UICollectionViewController {
//    
//    let db = Firestore.firestore()
//
//    var svdSize = ""
//    var svdCoffee = ""
//    var svdCream = ""
//    var svdFlavor = ""
//    let orderDetails = OrderDetailsViewController()
//    var userEmail = ""
//    
//    @IBOutlet var order1: UITextField!
//    @IBOutlet var order2: UITextField!
//    @IBOutlet var order3: UITextField!
//    @IBOutlet var order4: UITextField!
//    @IBOutlet var order5: UITextField!
//    @IBOutlet var order6: UITextField!
//    @IBOutlet var order7: UITextField!
//    @IBOutlet var order8: UITextField!
//    @IBOutlet var order9: UITextField!
//    @IBOutlet var order10: UITextField!
//    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("\(userEmail)")
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//
//        // Do any additional setup after loading the view.
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 10
//    }
//    
//    
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//        
//        return cell
//    }
//    
//    func loadHistory() async {
//        do{
//            var orderSz = ""
//            var orderCf = ""
//            var orderCrm = ""
//            var orderFlvr = ""
//
//            let document = try await db.collection("users").document(userEmail).collection("orders").document("").getDocument()
//            var orderDate = document.documentID
//            if(document.exists){
//                orderSz = document.get("size") as! String
//                orderCf = document.get("coffee") as! String
//                orderCrm = document.get("cream") as! String
//                orderFlvr = document.get("flavor") as! String
////     PUT ORDER HISTORY FROM DATABASE IN UI TETFIELDS
//                order1.text = "\(document.documentID) \(orderSz) \(orderCf) \(orderCrm) \(orderFlvr)"
////                userSz.text = orderSz
////                userCf.text = orderCf
////                userCrm.text = orderCrm
////                userFlvr.text = orderFlvr
//            }else{
//                let updateAlert = UIAlertController(title: "No Order History Found", message: "You have no saved Orders in your Account.", preferredStyle: .alert)
//                updateAlert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
//                self.present(updateAlert, animated: true, completion: nil)
//            }
//
//        }
//        catch {
//            print("Error retrieving data from database.")
//
//        }
//    }
//    
//    /*
//    // MARK: - Navigation*/
//
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         if segue.identifier == "new order"{
//             let newVC = segue.destination as! PickerPageViewController
//             newVC.userEmail = userEmail
//             newVC.navigationItem.title = "Picker Page"
//         }else if segue.identifier == "home"{
//             let homeVC = segue.destination as! ViewController
//             homeVC.userEmail = userEmail
//             homeVC.navigationItem.title = "Home"
//         }
//         else if(segue.identifier == "login"){
//             let accountVC = segue.destination as! LoginController
//             accountVC.loginEmail?.text = userEmail
//             accountVC.navigationItem.title = "Login"
//         }
//         else if segue.identifier == "menu"{
//             let menuVC = segue.destination as! MenuController
//             menuVC.userEmail = userEmail
//             menuVC.navigationItem.title = "Menu"
//         }
//         else if segue.identifier == "contact"{
//             let contactVC = segue.destination as! ContactController
//             contactVC.userEmail = userEmail
//             contactVC.navigationItem.title = "Contact"
//         }
//         
//     }
//     
//     
//     
//     
//     
// }
//
//    /*// MARK: UICollectionViewDataSource
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//
//    
//
//     */
//
//    // MARK: UICollectionViewDelegate
//
//    /*
//    // Uncomment this method to specify if the specified item should be highlighted during tracking
//    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    */
//
//    /*
//    // Uncomment this method to specify if the specified item should be selected
//    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    */
//
//    /*
//    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
//    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
//        return false
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
//        return false
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
//    
//    }
//    */
//
