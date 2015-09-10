//
//  NextToArriveDelegate.swift
//  SEPTAKit
//
//  Created by Rocky Breslow on 8/20/15.
//  Copyright (c) 2015 Rocky Breslow. All rights reserved.
//

import Foundation

public protocol NextToArriveDelegate {
    func didLoadData(trips: [Trip])
}