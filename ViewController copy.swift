//
//  ViewController.swift
//  GoogleMapsPractice
//
//  Created by Macbook on 03.11.2022.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    let coordinate = CLLocationCoordinate2D(latitude: 37.34033264974476, longitude: -122.06892632102273)
    var marker: GMSMarker?
    var geoCoder: CLGeocoder?
    var route: GMSPolyline?
    var locationManger: CLLocationManager?
    var routePath: GMSMutablePath?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMap()
        configureLocationManager()
    }
    
    private func configureLocationManager() {
        locationManger = CLLocationManager()
        locationManger?.delegate = self
        locationManger?.allowsBackgroundLocationUpdates = true
        locationManger?.startMonitoringSignificantLocationChanges()
        locationManger?.pausesLocationUpdatesAutomatically = false
        locationManger?.requestAlwaysAuthorization()
    }
    
    private func configureMap() {
        let camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: 13)
        mapView.camera = camera
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
    }
    
    private func addMarker() {
        marker = GMSMarker(position: coordinate)
        marker?.title = "Marker"
        marker?.snippet = "My new Marker"
        marker?.map = mapView
    }
    
    private func removeMarker() {
        marker?.map = nil
        marker = nil
    }
    
    @IBAction func didTapUpdateLocation(_ sender: UIButton) {
        locationManger?.requestLocation()
        route?.map = nil
        route = GMSPolyline()
        routePath = GMSMutablePath()
        route?.map = mapView

        locationManger?.startUpdatingLocation()
    }
    
    @IBAction func addMarkerDidTap(_ sender: UIButton) {
        if marker == nil {
            mapView.animate(toLocation: coordinate)
            addMarker()
        } else {
            removeMarker()
        }
    }
}

extension ViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print(coordinate)
        let manualMarker = GMSMarker(position: coordinate)
        manualMarker.map = mapView
        
        if geoCoder == nil {
            geoCoder = CLGeocoder()
        }
        
        geoCoder?.reverseGeocodeLocation(CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude), completionHandler: { places, error in
            print(places?.last)
        })
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        routePath?.add(location.coordinate)
        route?.path = routePath
        
        let position = GMSCameraPosition.camera(withTarget: location.coordinate, zoom: 15)
        mapView.animate(to: position)

        print(location.coordinate)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}



/*
        let camera = GMSCameraPosition.camera(withTarget: coordinates, zoom: 15)
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        view.addSubview(mapView)
        mapView.camera = camera

         Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = coordinates
        marker.map = mapView
 */
