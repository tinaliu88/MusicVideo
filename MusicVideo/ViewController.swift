//
//  ViewController.swift
//  MusicVideo
//
//  Created by Tina Liu on 9/08/2016.
//  Copyright © 2016 SunnyFridayApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let itunesURL = "https://itunes.apple.com/au/rss/topmusicvideos/limit=10/json"
        let apiManager = APIManager()
        apiManager.loadData(itunesURL, completion: didLoadData)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didLoadData(result: String) {
        let alert = UIAlertController(title: result, message: nil, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

