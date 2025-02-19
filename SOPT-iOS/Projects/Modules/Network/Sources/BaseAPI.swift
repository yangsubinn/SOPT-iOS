//
//  BaseAPI.swift
//  Network
//
//  Created by 양수빈 on 2022/10/06.
//  Copyright © 2022 SOPT-iOS. All rights reserved.
//

import Alamofire
import Moya
import Foundation

enum BaseAPI {
    case sample(platform: String)
}

extension BaseAPI: TargetType {
    var baseURL: URL {
        var base = Config.Network.baseURL
        
        switch self {
        case .sample:
            base += ""
        }
        
        guard let url = URL(string: base) else {
            fatalError("baseURL could not be configured")
        }
        return url
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .sample:
            return ""
        }
    }
    
    // MARK: - Method
    var method: Moya.Method {
        switch self {
        case .sample:
            return .post
        }
    }
    
    // MARK: - Parameters
    /// - note :
    ///  post를 할때, body Parameter를 담아서 전송해야하는 경우가 있는데,
    ///  이 경우에 사용하는 부분입니다.
    ///
    ///  (get에서는 사용 ❌, get의 경우에는 쿼리로)
    ///
    private var bodyParameters: Parameters? {
        var params: Parameters = [:]
        switch self {
        case .sample(let provider):
            params["platform"] = provider
        }
        return params
    }
    
    /// - note :
    ///  query문을 사용하는 경우 URLEncoding 을 사용해야 합니다
    ///  나머지는 그냥 전부 다 default 처리.
    ///
    private var parameterEncoding : ParameterEncoding{
        switch self {
        case .sample:
            return URLEncoding.init(destination: .queryString, arrayEncoding: .noBrackets, boolEncoding: .literal)
//        default :
//            return JSONEncoding.default
            
        }
    }
    
    /// - note :
    ///  body Parameters가 있는 경우 requestParameters  case 처리.
    ///  일반적인 처리는 모두 requestPlain으로 사용.
    ///
    var task: Task {
        switch self {
        case .sample:
            return .requestParameters(parameters: bodyParameters ?? [:], encoding: parameterEncoding)
//        default:
//            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
