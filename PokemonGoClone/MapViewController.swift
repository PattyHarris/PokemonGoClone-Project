//
//  ViewController.swift
//  PokemonGoClone
//
//  Created by Patty Harris on 8/31/17.
//  Copyright © 2017 Patty Harris. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var manager : CLLocationManager = CLLocationManager()
    
    // The updateCountLimit allows the location manager to update the location several times,
    // basically to get it right the first time.  Then we turn it off so that it allows the
    // user to move the location and zoom in and out.  Otherwise, the location manager snaps
    // back to the original location.  Nick used a 0 value and then incremented - I think this
    // is clearer...
    
    var updateCountLimit = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Also needed to prompt the user to allow current location
        // usage.  "When is use" is the most user-friendly of
        // the other options.  Along with these 2 things, we also
        // need the custom privacy items in the plist.
        
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            // Set the current location and tell the location manager to
            // start watching
            mapView.showsUserLocation = true
            manager.startUpdatingLocation()
        }
        else {
            // Otherwise, we'll need to ask again....
            manager.requestWhenInUseAuthorization()
        }
    }
    
    // Handle the user's new location and zoom into that location.  E.g. where is the user right now.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // 1. Make a region - the location manager has the center of the current region.
        // For the Pokemon game, 1000 by 1000  seems to work (according to Nick).
        if let regionCenter = manager.location?.coordinate {
            
            if updateCountLimit > 0 {
                let region = MKCoordinateRegionMakeWithDistance(regionCenter, 1000, 1000)
                
                // 2. Set the region in the mapView - you can set animated to true, but that will cause a
                // big zoom in (or out) as the app renders.
                mapView.setRegion(region, animated: false)
                
                updateCountLimit -= 1
            }
        }
        
    }
}

