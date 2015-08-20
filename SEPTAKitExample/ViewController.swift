//
//  ViewController.swift
//  SEPTAKitExample
//
//  Created by Rocky Breslow on 8/19/15.
//  Copyright (c) 2015 Rocky Breslow. All rights reserved.
//

import UIKit
import MapKit
import SEPTAKit

class ViewController: UIViewController, TrainViewDelegate {

    @IBOutlet weak var MapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SEPTAKit.trainView(self)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reloadMap(sender: AnyObject) {
        SEPTAKit.trainView(self)
    }
    func didLoadData(trains: [Train]) {
        // http://stackoverflow.com/questions/10865088/how-do-i-remove-all-annotations-from-mkmapview-except-the-user-location-annotati
        // Clears all annotations from MapView
        let annotationsToRemove = MapView.annotations.filter { $0 !== self.MapView.userLocation }
        MapView.removeAnnotations(annotationsToRemove)
        
        for train in trains {
            var point = MKPointAnnotation()
            point.coordinate = CLLocationCoordinate2D(latitude: train.lat, longitude: train.lon)
            point.title = "\(train.dest) #\(train.trainNo)"
            point.subtitle = "Next Stop: \(train.nextStop)"
            MapView.addAnnotation(point)
        }
    }
}


