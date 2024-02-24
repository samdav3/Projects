//
//  ViewController.swift
//  AlertControllerApp
//
//  Created by Sam Davenport on 2/24/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Alert", message: "Spring is in the air!", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {action -> Void in
            
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

