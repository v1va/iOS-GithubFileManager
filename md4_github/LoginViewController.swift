//
//  LoginViewController.swift
//  md4_github
//
//  Created by viva brolite on 15/06/2020.
//  Copyright © 2020 vivabrolite. All rights reserved.
//

import UIKit
import FirebaseUI

class LoginViewController: UIViewController {
    
    func redirectHome(){
        let mainView = (storyboard?.instantiateViewController(withIdentifier: "tabController")) as! UITabBarController
        mainView.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(mainView, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                self.redirectHome()
            } else {
                // No User is signed in. Show user the login screen
            }
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        // Get the default auth UI obj
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else{
            return
        }
        
        // Set the delegate
        authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth()]
        
        // Get the reference to the auth UI view controller
        let authViewController = authUI!.authViewController()
        
        // Show it
        present(authViewController, animated: true, completion: nil)
        
    }
    
    
}

extension LoginViewController: FUIAuthDelegate{
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        // Check if there was an error
        guard error == nil else {
            return
        }
        
        //let userID = authDataResult?.user.uid
        
        //performSegue(withIdentifier: "goHome", sender: self)
        redirectHome()
    }
    
}
