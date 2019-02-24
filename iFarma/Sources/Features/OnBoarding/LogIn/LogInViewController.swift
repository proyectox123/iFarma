//
//  LogInViewController.swift
//  iFarma
//
//  Created by admin on 12/02/19.
//  Copyright © 2019 MHO. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class LogInViewController: BaseViewController, OnLogInRequestProtocol {

    @IBOutlet weak var tUsername: UITextField!
    @IBOutlet weak var tPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ViewController
        destination?.idSession = "ABCD"
    }
    
    @IBAction func logIn(_ sender: Any) {
        let username = tUsername.text ?? ""
        let password = tPassword.text ?? ""
        
        self.showSpinner(onView: self.view)
        
        let logInRequest = LogInRequest(username: username, password: password, onLogInRequestProtocol: self)
        logInRequest.request()
    }
    
    func onRequestSuccess(){
        removeSpinner()
        
        performSegue(withIdentifier: "loginMainSegueu", sender: nil)
    }
    
    func onRequestFailed(messageError: String){
        removeSpinner()
        
        let alert = UIAlertController(title: "Error", message: messageError, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func initView(){
        setTextFieldStyle(textField: tUsername)
        setTextFieldStyle(textField: tPassword)
    }
}
