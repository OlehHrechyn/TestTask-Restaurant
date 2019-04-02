//
//  APIManager.swift
//  Restaurant
//
//  Created by Oleh Hrechyn on 4/2/19.
//  Copyright © 2019 Natife. All rights reserved.
//

import Foundation

class APIManager {
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
}

//MARK: - Food
extension APIManager {
    class func getFood(successCompletion: @escaping (_ food: Food) -> Void = {_ in }, failCompletion: @escaping (_ error: Error) -> Void = {_ in }) {
        let urlString = "https://gist.githubusercontent.com/gonchs/b657e6043e17482cae77a633d78f8e83/raw/7654c0db94a3f430888fac0caac675c7e811030a/test_data.json"
        guard let url = URL(string: urlString) else {
            return
        }
        request(url: url, successCompletion: { (data) in
            guard let food = try? JSONDecoder().decode(Food.self, from: data) else {
                return
            }
            successCompletion(food)
        }, failCompletion: failCompletion)
    }
}

//MARK: - Private
private extension APIManager {
    class func request(url: URL, method: Method = .get, successCompletion: @escaping (_ result: Data) -> Void = {_ in }, failCompletion: @escaping (_ error: Error) -> Void = {_ in }) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                failCompletion(error)
            } else if let data = data {
                successCompletion(data)
            }
            }.resume()
    }
}
