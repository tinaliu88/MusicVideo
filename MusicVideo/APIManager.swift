//
//  APIManager.swift
//  MusicVideo
//
//  Created by Tina Liu on 12/08/2016.
//  Copyright © 2016 SunnyFridayApps. All rights reserved.
//

import Foundation

///REST API manager class, manages all the communicaiton to a REST API
class APIManager {
    
    func loadData(urlString : String, completion: (result: String) -> Void) {
        let url = NSURL(string: urlString)!
        
        //configuration for not caching NSURLSession data, we don't want to cache it
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        
        //create nsurl session and task to load the data
        let session = NSURLSession(configuration: config)
        let task = session.dataTaskWithURL(url) { (data, response, error) in
            dispatch_async(dispatch_get_main_queue(), {
                if error != nil {
                    completion(result: error!.localizedDescription)
                } else {
                    completion(result: "NSURLSession successful!")
                    print(data)
                }
            })
        }
        
        //start the task
        task.resume();
    }
}