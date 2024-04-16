//
//  ViewController.swift
//  FirebaseApp
//
//  Created by student on 4/11/24.
//

import UIKit
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseAppCheck
import CoreMedia

class ViewController: UIViewController {
    
    @IBOutlet var Name: UITextField!
    @IBOutlet var Email: UITextField!
    @IBOutlet var Password: UITextField!
    @IBOutlet var docID: UITextField!
    //@IBOutlet var responseText: UILabel!
    @IBOutlet var retrievedData: UITextView!
    
    let db = Firestore.firestore()
    
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func resetText(){
        //responseText.text = ""
        retrievedData.text = ""
        Name.text = ""
        Email.text = ""
        Password.text = ""
    }
    
    //BUTTON FUNCTIONS/ACTIONS
    
    @IBAction func addBtn(_ sender: UIButton) {
        Task {
            await addEntry()
        }
        listenForUsers()
    }
    
    @IBAction func refreshBtn(_ sender: UIButton) {
        resetText()
    }
    
    
    @IBAction func updateBtn(_ sender: UIButton) {
        Task {
            //await updateEntry()
        }
        
    }
    
    
    //FUNCTIONS FOR ACCESSING DATABASE
    
    @IBAction func retrieveBtn(_ sender: UIButton) {
            Task {
                await retrieveData()
            
            }
    }
    
    
    
    private func addEntry() async {
        // [START add_ada_lovelace]
        // Add a new document with a generated ID
        do {
            let ref = try await db.collection("users").addDocument(data: [
                "name": Name.text!,
                "email": Email.text!,
                "password": Password.text!
                //"id": db.document(Name.text!)
            ])
            print("Document added with ID: \(ref.documentID)")
            retrievedData.text = "Succesfully added with ID \(ref.documentID)"
            //let data = try await db.collection("users").document(\())
            Name.text = ""
            Email.text = ""
            Password.text = ""
        }
        catch {
            print("Error adding document: \(error)")
            retrievedData.text = "Failed to add, [please try again!"
        }

    }
    
//    private func updateEntry() async {
//        // [START update_document]
//        do{
//          let snapshot = try await db.collection("users").getDocuments()
//          let name = db.collection("users").whereField("name", arrayContains:                     Name.text as Any)
//          let email = name.value(forKey: "email")
//          let password = name.value(forKey: "password")
//              for name in snapshot.documents{
//                  docID.text = name.documentID
//                  Name.text = Name.text
//                  Email.text = email as? String
//                  Password.text = password as? String
//          }
//        }catch{
//      print("Error getting documents: \(error)")
//    }
//
//    }
    
    private func retrieveData() async {
        
        do{
            let snapshot = try await db.collection("users").getDocuments()
//            let name = db.collection("users").whereField("name", arrayContains: Name.text as Any)
//            let email = name.value(forKeyPath: "email")
//            let password = name.value(forKeyPath: "password")
            for document in snapshot.documents{
                retrievedData.text = ("\(document.data())")
//                docID.text = document.documentID
//                Name.text = Name.text
//                Email.text = email as? String
//                Password.text = password as? String
                print("\(document.data())")
                }
        }catch{
            print("Error getting documents: \(error)")
        }
        
        
    }

    
    private func listenForUsers() {
        // [START listen_for_users]
        // Listen to a query on a collection.
        //
        // We will get a first snapshot with the initial results and a new
        // snapshot each time there is a change in the results.
        db.collection("users")
          .whereField("name", isEqualTo: true)
          .addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
              print("Error retreiving snapshots \(error!)")
              return
            }
            print("Current users all have assinged names: \(snapshot.documents.map { $0.data() })")
          }
        // [END listen_for_users]
      }
    
    //start here
}
    
//    private func deleteCollection(collection: String) {
//        db.collection(collection).getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//                return
//            }
//        }
//    }
    
 
    

