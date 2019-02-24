//
//  SignUpViewController.swift
//  iFarma
//
//  Created by admin on 12/02/19.
//  Copyright © 2019 MHO. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var tEmail: UITextField!
    @IBOutlet weak var tPassword: UITextField!
    @IBOutlet weak var tNickname: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signUp(_ sender: Any) {
        let email = tEmail.text ?? ""
        let password = tPassword.text ?? ""
        let nickname = tNickname.text ?? ""
        
        print("email: \(email)")
        print("password: \(password)")
        print("nickname: \(nickname)")
    }
    
    private func initView(){
        setTextFieldStyle(textField: tEmail)
        setTextFieldStyle(textField: tPassword)
        setTextFieldStyle(textField: tNickname)
    }
    
    private func setTextFieldStyle(textField: UITextField){
        textField.layer.borderColor = UIColor(named: "lightBlueColor")?.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8.0;
    }
}
