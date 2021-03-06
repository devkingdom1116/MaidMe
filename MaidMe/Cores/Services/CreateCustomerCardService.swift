//
//  CreateCustomerCardService.swift
//  MaidMe
//
//  Created by Mai Nguyen Thi Quynh on 3/29/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CreateCustomerCardService: RequestManager {

    override func request(method: Alamofire.Method? = nil,
        _ URLString: URLStringConvertible? = nil,
        parameters: [String : AnyObject]?,
        encoding: ParameterEncoding? = nil,
        headers: [String : String]? = nil,
        completionHandler: Response<AnyObject, NSError> -> ()) {
            super.request(.POST, "\(Configuration.serverUrl)\(Configuration.createCustomerCardUrl)", parameters: parameters, encoding: .JSON, headers: self.getAuthenticateHeader()) {
                response in
                completionHandler(response)
            }
    }
    
    func getCustomerCardParams(paymentToken: String) -> [String: AnyObject] {
        return [
            "token_card": paymentToken,
            "default_card" : "false",
            "country_code_name" : NSLocale.locales("United Arab Emirates"),
            "country_name" : "United Arab Emirates",
        ]
    }
}
