//
//  AuthHttpService.swift
//  GreenGroceryCloneApp
//
//  Created by 부재식 on 12/21/24.
//

import Alamofire

final class AuthHttpService : HttpService {
    var sessionManager: Session = Session.default
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        return sessionManager.request(urlRequest).validate(statusCode: 200..<400)
    }
}
