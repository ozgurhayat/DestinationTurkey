//
//  MapViewController.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 23/09/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, MKAnnotation {
    
    var coordinate = CLLocationCoordinate2D()

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        mapManager()
    }
    
    func mapManager() {
        mapView.delegate = self
        let lat = data[selectedRow].lat
        let long = data[selectedRow].long
        
        let place = CLLocationCoordinate2D(latitude: lat, longitude: long)

        var mapRegion = MKCoordinateRegion()
        let mapRegionSpan = 1.02
        
        mapRegion.center = place
        mapRegion.span.latitudeDelta = mapRegionSpan
        mapRegion.span.longitudeDelta = mapRegionSpan
        
        mapView.mapType = .hybridFlyover
        
        let camera = MKMapCamera(lookingAtCenter: place, fromDistance: 880000, pitch: 0, heading: 0)
        
        mapView.camera = camera
        
        let placeAnnotation = MKPointAnnotation()
        
        placeAnnotation.coordinate = place
        placeAnnotation.title = data[selectedRow].city
        mapView.addAnnotation(placeAnnotation)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyMarker"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        // Reuse the annotation if possible
        var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        annotationView?.glyphText = "😍"
        annotationView?.markerTintColor = .red
        
        return annotationView
    }

}
