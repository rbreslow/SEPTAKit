//
//  Train.swift
//  SEPTAKit
//
//  Created by Rocky Breslow on 8/20/15.
//  Copyright (c) 2015 Rocky Breslow. All rights reserved.
//

import Foundation

/// A class representing a response from a SEPTA TrainView API call.
public class Train {
    public var lat: Double = 0.0
    public var lon: Double = 0.0
    public var trainNo: Int = 0
    public var service: String = "LOCAL"
    public var dest: String = ""
    public var nextStop: String = ""
    public var late: Int = 0
    public var source: String = ""
    public var track: String = ""
    public var trackChange: String = ""
    
    class func createFrom(data: NSDictionary) -> Train {
        var train = Train()
        
        if let lat = data["lat"] as? NSString {
            train.lat = lat.doubleValue
        }
        
        if let lon = data["lon"] as? NSString {
            train.lon = lon.doubleValue
        }
        
        if let trainNoStr = data["trainno"] as? String {
            if let trainNo = trainNoStr.toInt() {
                train.trainNo = trainNo
            }
        }
        
        if let service = data["service"] as? String {
            train.service = service
        }
        
        if let dest = data["dest"] as? String {
            train.dest = dest
        }
        
        if let nextStop = data["nextstop"] as? String {
            train.nextStop = nextStop
        }
        
        if let lateStr = data["late"] as? String {
            if let late = lateStr.toInt() {
                train.late = late
            }
        }
        
        if let source = data["SOURCE"] as? String {
            train.source = source
        }
        
        if let track = data["TRACK"] as? String {
            train.track = track
        }
        
        if let trackChange = data["TRACKCHANGE"] as? String {
            train.trackChange = trackChange
        }
        
        return train
    }
}