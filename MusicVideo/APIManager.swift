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
        
        //create nsurl session and task to retrieve the data
        let session = NSURLSession(configuration: config)
        let task = session.dataTaskWithURL(url) { (data, response, error) in
            if error != nil {
                //UI update on the main quene
                dispatch_async(dispatch_get_main_queue(), {
                    completion(result: error!.localizedDescription)
                })
            } else {
                do {
                    if let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [String: AnyObject] {
                        print(jsonData)
                        
                        //high priority queue
                        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
                            //dispatch the update back to the main queue
                            dispatch_async(dispatch_get_main_queue(), {
                                completion(result: "NSJSONSerialization successful")
                            })
                        })
                    }
                } catch {
                    dispatch_async(dispatch_get_main_queue(), {
                        completion(result: "Error is NSJSONSerialization")
                    })
                }
            }
        }
        
        //start the task
        task.resume();
    }
}