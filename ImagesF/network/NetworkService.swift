//
//  NetworkService.swift
//  ImagesF
//
//  Created by andriy kruglyanko on 23.04.2022.
//

import Foundation

class NetworkService: NSObject {
    
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    //token for requests
    var authToken: String?
    
    
    //MARK: Singleton
    
    static var sharedService: NetworkService = NetworkService(session: URLSessionMock())
    
    
    //MARK: Requests
    
    func getAllEvents(success: @escaping (Data)->(), failure: @escaping (Error?) -> ()) {
        
        //get all events method, use self.session
        var request = URLRequest(url: URL.init(string: "/api/v1/events")!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.setValue(authToken ?? "", forHTTPHeaderField: "authToken")
        //request.addValue(authToken ?? "", forHTTPHeaderField:"Authorization")
        request.setValue("en", forHTTPHeaderField: "lang")
        request.setValue("1", forHTTPHeaderField: "version")
        let task = self.session.dataTask(with: request) { data, response, error -> Void in
            
            DispatchQueue.main.async {
                if let currentData = data {
                        success(currentData)
                }
                if let currentError = error {
                    failure(currentError as NSError)
                }
            }
        }
        task.resume()

    }
}
