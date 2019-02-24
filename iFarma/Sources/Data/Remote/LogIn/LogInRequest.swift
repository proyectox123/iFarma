//
//  LogInRequest.swift
//  iFarma
//
//  Created by admin on 2/23/19.
//  Copyright © 2019 MHO. All rights reserved.
//

import Alamofire

class LogInRequest {
    
    let username: String
    let password: String
    let onLogInRequestProtocol: OnLogInRequestProtocol
    
    init(username: String, password: String, onLogInRequestProtocol: OnLogInRequestProtocol) {
        self.username = username
        self.password = password
        self.onLogInRequestProtocol = onLogInRequestProtocol
    }
    
    public func request(){
        AF.request(
            getUrl(),
            method: getHTTPMethod(),
            parameters: getParameters(username, password),
            encoding: getEncoding(),
            headers: getHeaders()
        ).responseJSON { response in
            self.validateResponse(response: response)
        }
    }
    
    private func validateResponse(response: DataResponse<Any>){
        print("Request: \(String(describing: response.request))")
        print("Response: \(String(describing: response.response))")
        print("Result: \(response.result)")
        
        if let responses = response.result.value as? NSDictionary {
            let result = responses.object(forKey: "response") as? String
            let detail = responses.object(forKey: "detail") as? String ?? "Error"
            
            if(result == "success"){
                onLogInRequestProtocol.onRequestSuccess()
            }else{
                onLogInRequestProtocol.onRequestFailed(messageError: detail)
            }
            
            return
        }
        
        onLogInRequestProtocol.onRequestFailed(messageError: "Error")
    }
    
    private func getUrl() -> String {
        return "https://us-central1-trip-60746.cloudfunctions.net/login"
    }
    
    private func getHTTPMethod() -> HTTPMethod{
        return HTTPMethod.post
    }
    
    private func getParameters(_ username: String, _ password: String) -> Parameters {
        return [
            "userID": username,
            "password": password
        ]
    }
    
    private func getEncoding() -> JSONEncoding{
        return JSONEncoding.default
    }
    
    private func getHeaders() -> HTTPHeaders{
        return [
            "Content-Type": "application/json"
        ]
    }
}

public protocol OnLogInRequestProtocol {
    func onRequestSuccess()
    func onRequestFailed(messageError: String)
}
