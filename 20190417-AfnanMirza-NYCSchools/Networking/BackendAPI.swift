//
//  BackendAPI.swift
//  20190417-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 4/17/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

typealias SuccessHandler = (Any) -> Void
typealias FailureHandler = (Error?) -> Void

enum APIUrls: String {
    case highSchoolInfoUrl = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    case highSchoolSATInfoUrl = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
}

class BackendAPI {
    static func fetchNYCHighSchoolInfo(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        guard let highSchoolsURL = URL(string: APIUrls.highSchoolInfoUrl.rawValue) else {
            let error = NSError(domain: "urlIsNil", code: 2413, userInfo: [NSLocalizedDescriptionKey: "High School SAT URL is Nil."])
            failure(error)
            return
        }
        
        self.createAPICall(with: highSchoolsURL, success: { (nycHighSchoolJsonData) in
            guard let highSchoolsDictArr = nycHighSchoolJsonData as? [[String: Any]] else{
                return
            }
            
            var highSchoolModelArr = [NYCHighSchools]()
            for highSchoolsDict in highSchoolsDictArr {
                let highSchoolModels = NYCHighSchools(schoolInfoJSON: highSchoolsDict)
                highSchoolModelArr.append(highSchoolModels)
            }
            
            success(highSchoolModelArr)
        }, failure: failure)    }
    
    static func fetchNYCHighSchoolSATInfo(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        guard let highSchoolsSATURL = URL(string: APIUrls.highSchoolSATInfoUrl.rawValue) else {
            let error = NSError(domain: "urlIsNil", code: 2413, userInfo: [NSLocalizedDescriptionKey: "High School SAT URL is Nil."])
            failure(error)
            return
        }
        
        self.createAPICall(with: highSchoolsSATURL, success: success, failure: failure)
    }
    
    static func createAPICall(with url: URL, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                failure(error)
                return
            }
            
            guard let data = data else {
                let dataError = NSError(domain: "nilData", code: 1248, userInfo: [NSLocalizedDescriptionKey: "Fetched Data was nil."])
                failure(dataError)
                return
            }
            
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                success(jsonObject)
            } catch {
                failure(error)
                return
            }
            
        }
        task.resume()
    }
    
}
