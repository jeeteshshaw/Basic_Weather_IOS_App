//
//  Api Call.swift
//  WeatherApp
//
//  Created by Jeetesh Shaw on 04/03/24.
//

import Foundation

//let headers = ["accept": "application/json"]
//
//let request = NSMutableURLRequest(url: NSURL(string: "https://api.tomorrow.io/v4/weather/forecast?location=new%20york&apikey=jYsWOKxiHJkitmDmePK9iSUYloZR3Gq9")! as URL,
//                                        cachePolicy: .useProtocolCachePolicy,
//                                    timeoutInterval: 10.0)
//request.httpMethod = "GET"
//request.allHTTPHeaderFields = headers
//
//let session = URLSession.shared
//let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//  if (error != nil) {
//    print(error as Any)
//  } else {
//    let httpResponse = response as? HTTPURLResponse
//      print(httpResponse ?? "")
//  }
//})
//
//dataTask.resume()
func UpdateWeather(){
    let headers = ["accept": "application/json"]
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://api.tomorrow.io/v4/weather/forecast?location=new%20york&apikey=jYsWOKxiHJkitmDmePK9iSUYloZR3Gq9")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
      if (error != nil) {
        print(error as Any)
      } else {
        let httpResponse = response as? HTTPURLResponse
          print(httpResponse ?? "")
      }
    })
    
    dataTask.resume()
}

