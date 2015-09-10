//
//  Trip.swift
//  SEPTAKit
//
//  Created by Rocky Breslow on 8/20/15.
//  Copyright (c) 2015 Rocky Breslow. All rights reserved.
//

import Foundation

/// A class representing a response from a SEPTA NextToArrive API call.
public class Trip {
    public var origTrain: Int = 0
    public var origLine: String = ""
    public var origDepartureTime: String = "" // why ........
    public var origArrivalTime: String = ""
    public var origDelay: String = ""
    public var termTrain: Int = 0
    public var termLine: String = ""
    public var termDepartureTime: String = ""
    public var termArrivalTime: String = ""
    public var connection: String = ""
    public var termDelay: String = ""
    public var isDirect: Bool = true

    class func createFrom(data: NSDictionary) -> Trip {
        var trip = Trip()
        
        if let origTrainStr = data["orig_train"] as? String {
            if let origTrain = origTrainStr.toInt() {
                trip.origTrain = origTrain
            }
        }
        
        if let origLine = data["orig_line"] as? String {
            trip.origLine = origLine
        }
        
        if let origDepatureTime = data["orig_departure_time"] as? String {
            trip.origDepartureTime = origDepatureTime
        }
        
        if let origArrivalTime = data["orig_arrival_time"] as? String {
            trip.origArrivalTime = origArrivalTime
        }
        
        if let origDelay = data["orig_delay"] as? String {
            trip.origDelay = origDelay
        }
        
        if let termTrainStr = data["term_train"] as? String {
            if let termTrain = termTrainStr.toInt() {
                trip.termTrain = termTrain
            }
        }
        
        if let termLine = data["term_line"] as? String {
            trip.termLine = termLine
        }
        
        if let termDepartureTime = data["term_depart_time"] as? String { // lol god damnit SEPTA
            trip.termDepartureTime = termDepartureTime
        }
        
        if let termArrivalTime = data["term_arrival_time"] as? String {
            trip.termArrivalTime = termArrivalTime
        }
        
        if let connection = data["Connection"] as? String {
            trip.connection = connection
        }
        
        if let isDirectStr = data["isdirect"] as? NSString {
            trip.isDirect = isDirectStr.boolValue
        }
        
        return trip
    }
}