//
//  LoginViewController.swift
//  QuikKilo
//
//  Created by Dami Roberts on 2/22/18.
//  Copyright © 2018 Dami Roberts. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userfield: UITextField!
    @IBOutlet weak var passfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: userfield.text!, password: passfield.text!) { (user: PFUser?, error: Error?) in
            if user != nil {
                print("You're logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    @IBAction func OnSignUp(_ sender: Any) {
        
        let newUser = PFUser()
     newUser.username = userfield.text
    newUser.password = passfield.text
        
       
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                print("yay new user")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                print(error?.localizedDescription)
               
                    
                }
            }
            
            }
        
        
    }
    

