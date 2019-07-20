//
//  ViewController.swift
//  FaceID
//
//  Created by Sidharth Nayyar on 2019-07-18.
//  Copyright © 2019 Sidharth Nayyar. All rights reserved.
//

import UIKit
import LocalAuthentication
class ViewController: UIViewController {

    var context = LAContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
    }

    
@IBAction func touchId(_ sender: UIButton) {
    
    context = LAContext()
    
    context.localizedCancelTitle = "Enter Username/Password"
   
    var error:NSError?
    if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
        let reason = "Log in to your account with account password"
        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason){ success, error in
            
            if success{
                DispatchQueue.main.async {
                    
                    let alert = UIAlertController(title: "Logged In", message: "Logged In with Face Id", preferredStyle: UIAlertController.Style.alert)
                    
                    let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                    let actionCanel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(actionOk)
                    alert.addAction(actionCanel)
                    self .present(alert, animated: true ,completion: nil)
                    
                    
                    print("logged in")
                }
            }else{
                print(error?.localizedDescription ?? "Failed to authenticate")
            }
        }
    }else {
        print(error?.localizedDescription ?? "Can't evaluate policy")
        
    }
    
}



}
