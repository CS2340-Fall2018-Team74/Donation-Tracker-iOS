//
//  SignInViewController.swift
//  Donation Tracker
//
//  Created by Uyen Dinh on 2/10/19.
//  Copyright © 2019 Uyen Dinh. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth


class SignInViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            email.delegate = self
            password.delegate = self
        }
    
    
    @IBAction func signInAction(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error == nil{
                self.performSegue(withIdentifier: "signInToHome", sender: self)
            } else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }

}


