//
//  LogInViewController.swift
//  iFarma
//
//  Created by admin on 12/02/19.
//  Copyright © 2019 MHO. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var tUsername: UITextField!
    @IBOutlet weak var tPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logIn(_ sender: Any) {
        let username = tUsername.text ?? ""
        let password = tPassword.text ?? ""
        
        print("username: \(username)")
        print("password: \(password)")
    }
    
    private func initView(){
        setTextFieldStyle(textField: tUsername)
        setTextFieldStyle(textField: tPassword)
    }
    
    private func setTextFieldStyle(textField: UITextField){
        textField.layer.borderColor = UIColor(named: "lightBlueColor")?.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8.0;
    }
}
