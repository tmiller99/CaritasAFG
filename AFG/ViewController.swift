//
//  ViewController.swift
//  AFG
//
//  Created by Trey Miller on 12/7/17.
//  Copyright © 2017 Trey. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {


    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var Login: UIButton!
    
    @IBAction func Login(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                
                if error != nil {
                    self.errorLabel.text = ("Email and/or Password invalid.")
                    return
                }
                self.performSegue(withIdentifier: "login", sender: Any?.self)
                
            })
        }
        
    }
    
    @IBOutlet weak var Register: UIButton!
    
    @IBAction func Register(_ sender: Any) {
        
        self.performSegue(withIdentifier: "Register", sender: Any?.self)
        
    }
    

}
 
