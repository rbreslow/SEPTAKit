//
//  SEPTAKit.swift
//  SEPTAKit
//
//  Created by Rocky Breslow on 8/19/15.
//  Copyright (c) 2015 Rocky Breslow. All rights reserved.
//

import Foundation

public class SEPTAKit {
    /**
    Queries for an array of the statuses of active SEPTA Regional Rail trains.
    
    :returns: An array of Train objects.
    */
    public static func trainView(delegate: TrainViewDelegate?) {
        /* Configure session, choose between:
        * defaultSessionConfiguration
        * ephemeralSessionConfiguration
        * backgroundSessionConfigurationWithIdentifier:
        And set session-wide properties, such as: HTTPAdditionalHeaders,
        HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
        */
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        /* Create session, and optionally set a NSURLSessionDelegate. */
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
        TrainView (GET http://www3.septa.org/hackathon/TrainView/)
        */
        
        var URL = NSURL(string: "http://www3.septa.org/hackathon/TrainView/")
        let request = NSMutableURLRequest(URL: URL!)
        request.HTTPMethod = "GET"
 
        /* Start a new Task */
        let task = session.dataTaskWithRequest(request, completionHandler: { (data : NSData!, response : NSURLResponse!, error : NSError!) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! NSHTTPURLResponse).statusCode
                println("URL Session Task Succeeded: HTTP \(statusCode)")
                
                var trains = [Train]()
                
                for dict in NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSArray {
                    if let dict = dict as? NSDictionary {
                        trains.append(Train.createFrom(dict))
                    }
                }
                
                delegate?.didLoadData(trains)
            }
            else {
                // Failure
                println("URL Session Task Failed: %@", error.localizedDescription)
            }
        })
        task.resume()
    }
    
}
