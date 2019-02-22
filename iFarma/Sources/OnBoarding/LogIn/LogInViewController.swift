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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func logIn(_ sender: Any) {
        let username = tUsername.text ?? ""
        let password = tPassword.text ?? ""
        
        print("username: \(username)")
        print("password: \(password)")
        
        let parameters: Parameters = [
            "userID": username,
            "password": password
        ]
        
        let headers: HTTPHeaders = [
             "Content-Type": "application/json"
        ]
        
        AF.request("https://us-central1-trip-60746.cloudfunctions.net/login",
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseJSON { [weak self] response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
                if let responses = response.result.value as? NSDictionary {
                    let result = responses.object(forKey: "response") as? String
                    let detail = responses.object(forKey: "detail") as? String
                    
                    if(result == "success"){
                        self?.performSegue(withIdentifier: "loginMainSegueu", sender: nil)
                    }
                    
                    let alert = UIAlertController(
                        title: "Alert",
                        message: "Result \(result) -> detail: \(detail)",
                        preferredStyle: .alert
                    )
                    
                    alert.addAction(
                        UIAlertAction(title: "OK", style: .default, handler: nil)
                    )
                    
                    self?.present(alert, animated: true, completion: nil)
                }else {
                    
                }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ViewController
        destination?.idSession = "ABCD"
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
