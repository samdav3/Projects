//
//  OrderHiatoryViewController.swift
//  AlertPickerMiniApp
//
//  Created by student on 4/10/24.
//

import UIKit

class OrderHiatoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                let homeVC = segue.destination as! ViewController
                homeVC.navigationItem.title = "Home"
        }
    
    
}
