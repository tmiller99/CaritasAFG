//
//  RegistrationViewController.swift
//  AFG
//
//  Created by Trey Miller on 12/13/17.
//  Copyright © 2017 Trey. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegistrationViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var stateTextField: UITextField!
    
    @IBOutlet weak var zipcodeTextField: UITextField!
    
    @IBOutlet weak var organizationNameTextField: UITextField!
    
    @IBOutlet weak var organizationPhoneTextField: UITextField!
    
    var fireBaseRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FirebaseApp.configure()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var backToLogin: UIButton!
    @IBAction func backToLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "BackToLogin", sender: Any?.self)
    }
    
    
    @IBOutlet weak var Register: UIButton!
    
    @IBAction func Register(_ sender: Any) {
        fireBaseRef = Database.database().reference()
        
        
        if let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text, let phone = phoneTextField.text, let name = nameTextField.text, let address = addressTextField.text, let city = cityTextField.text, let state = stateTextField.text, let zipcode = zipcodeTextField.text, let organizationName = organizationNameTextField.text, let organizationPhone = organizationPhoneTextField.text{
            
            if password == confirmPassword
            {
                Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                    
                    if let firebaseError = error {
                        self.errorLabel.text = "Email in use or invalid email"
                        print(firebaseError.localizedDescription)
                        return
                    }
                 
                    let userID = Auth.auth().currentUser!.uid
                    self.fireBaseRef.child("users").child(userID).child("email").setValue(email)
                    self.fireBaseRef.child("users").child(userID).child("password").setValue(password)
                    self.fireBaseRef.child("users").child(userID).child("phone").setValue(phone)
                    self.fireBaseRef.child("users").child(userID).child("name").setValue(name)
                    self.fireBaseRef.child("users").child(userID).child("address").setValue(address)
                    self.fireBaseRef.child("users").child(userID).child("city").setValue(city)
                    self.fireBaseRef.child("users").child(userID).child("state").setValue(state)
                    self.fireBaseRef.child("users").child(userID).child("zipcode").setValue(zipcode)
        self.fireBaseRef.child("users").child(userID).child("OrgName").setValue(organizationName)
        self.fireBaseRef.child("users").child(userID).child("OrgPhone").setValue(organizationPhone)
                    self.performSegue(withIdentifier: "RegisterToLogin", sender: Any?.self)
                    
                    
                })
                
            }
            else
            {
                self.errorLabel.text = "Passwords do not match"
            }
            
        }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}
