//
//  OnLogInRequestProtocol.swift
//  iFarma
//
//  Created by admin on 2/23/19.
//  Copyright © 2019 MHO. All rights reserved.
//

import UIKit
import Alamofire

public protocol OnLogInRequestProtocol {
    //func onRequestSuccess()
    //func onRequestFailed()
    func onRequestResult(response: DataResponse<Any>)
}
