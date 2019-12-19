//
//  NetworkRequest.swift
//  AssignmentProject
//
//  Created by Vivekvardhan Kasthuri on 27/11/19.
//  Copyright © 2019 Vivekvardhan Kasthuri. All rights reserved.
//

import Foundation
import UIKit

enum ErrorHandling: Error {
    
    case error
    case success
}

open class NetworkRequest {
    
    static let sharedInstance = NetworkRequest()
    
    var complitionHandler: ((Welcome)->Void)?

     class func getList(success: @escaping ((Welcome)->Void), failure: @escaping ((ErrorHandling)->Void)) {

        let headers = [
          "User-Agent": "PostmanRuntime/7.20.1",
          "Accept": "*/*",
          "Cache-Control": "no-cache",
          "Postman-Token": "edb67938-485a-4e44-b373-5fbba43f402a,5705c7cc-d436-416e-9f1f-51c07c584ced",
          "Host": "dl.dropboxusercontent.com",
          "Accept-Encoding": "gzip, deflate",
          "Cookie": "uc_session=NMGbOVXmPgd5wqee7nzZbzvvwv0QOfbdaQF6gx3pmdew604ePuhXtjRKrTcfcqW1",
          "Content-Length": "0",
          "Connection": "keep-alive",
          "cache-control": "no-cache"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            failure(ErrorHandling.error)
          } else {
            let httpResponse = response as! HTTPURLResponse
            print(httpResponse)
            let utf8Data = String(decoding: data!, as: UTF8.self)
            let oridata = Data(utf8Data.utf8)
            let welcome = try? JSONDecoder().decode(Welcome.self, from: oridata)
            success(welcome!)
          }
        })

        dataTask.resume()
    }
    
    
     func getTestList(url: String,completionHandler: @escaping ((Welcome)->Void)) {
       
           let request = NSMutableURLRequest(url: NSURL(string: url )! as URL,
                                                   cachePolicy: .useProtocolCachePolicy,
                                               timeoutInterval: 10.0)
           request.httpMethod = "GET"
           let session = URLSession.shared
           let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
             if (error != nil) {
                print(error!)
             } else {
               let httpResponse = response as? HTTPURLResponse
               print(httpResponse!)
                let utf8Data = String(decoding: data!, as: UTF8.self)
                let convertdata = Data(utf8Data.utf8)
                let welcome = try? JSONDecoder().decode(Welcome.self, from: convertdata)
             completionHandler(welcome!)
             }
           })

           dataTask.resume()
       }
}
