//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Taha Özmen on 13.11.2023.
//

import UIKit
import ParseUI

class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var usarnameText: UITextField!
    
    
    @IBOutlet weak var passwordText: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
         
        
        
        
    }

    
    @IBAction func signInClicked(_ sender: Any) {
        
        if usarnameText.text != "" && passwordText.text != "" {
            
            PFUser.logInWithUsername(inBackground: usarnameText.text!, password: passwordText.text!) { (user, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "ERROR !!")
                } else {
                    
                    // Segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                    
                }
            }
            
        } else {
            makeAlert(titleInput: "ERROR", messageInput: "Usarname / Password ??")
        }
        
        
        
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if usarnameText.text != "" && passwordText.text != "" {
            
            let user = PFUser()
            user.username = usarnameText.text!
            user.password = passwordText.text!
            
            user.signUpInBackground { (success, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error!!")
                } else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
            
        } else {
            makeAlert(titleInput: "ERROR", messageInput: "Username / Password ??")
            
        }
        
        
        
        }
        
    func makeAlert (titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
        
    }
    
}

