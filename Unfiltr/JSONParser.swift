//
//  SocketParser.swift
//  Unfiltr
//
//  Created by Md Tauseef on 1/2/21.
//

import Foundation

class JSONParser {
    
    static func convert<T: Decodable>(data: Any) throws -> T {
        let jsonData = try JSONSerialization.data(withJSONObject: data)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: jsonData)
    }
    
    static func convert<T: Decodable>(dataArr: [Any]) throws -> [T] {
        return try dataArr.map{ (dict) -> T in
            let jsonData = try JSONSerialization.data(withJSONObject: dict)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: jsonData)
        }
    }
}
