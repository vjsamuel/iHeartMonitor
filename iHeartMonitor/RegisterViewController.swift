//
//  RegisterViewController.swift
//  iHeartMonitor
//
//  Created by Harini Balakrishnan on 5/12/18.
//  Copyright © 2018 Harini Balakrishnan. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.userName.delegate = self
        self.userPassword.delegate = self
    }

    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userName: UITextField!
    
    @IBAction func register(_ sender: Any) {
        if let email = userName.text, let password = userPassword.text{
            
            Auth.auth().createUser(withEmail: email, password:password, completion:{(user, error) in
                if let firebaseError = error{
                    print(firebaseError.localizedDescription)
                    return
                }
                //self.presentLoggedInScreen()
                //print("sucess")
                self.goToHome()
            })
            
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func goToHome(){
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBarViewController") as! TabBarViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }

    func userNameShouldReturn(_ userName: UITextField) -> Bool {
        userName.resignFirstResponder()
        return true
    }
    
    func userPasswordShouldReturn(_ userPassword: UITextField) -> Bool {
        userPassword.resignFirstResponder()
        return true
        
    }

}
