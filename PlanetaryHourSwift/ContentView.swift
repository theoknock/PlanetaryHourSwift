//
//  ContentView.swift
//  PlanetaryHourSwift
//
//  Created by Xcode Developer on 5/1/21.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreGraphics

struct ContentView: View {
    @ObservedObject var locationViewModel = LocationViewModel()
    
    var body: some View {
//            Text("\(locationViewModel.userLocation.coordinate.latitude), \(locationViewModel.userLocation.coordinate.longitude)").padding()
            MapView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MapView : UIViewRepresentable {
    @ObservedObject var locationViewModel = LocationViewModel()

    let map = MKMapView()
    
    func makeCoordinator() -> MapView.Coordinator {
        return Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        map.delegate = context.coordinator
        map.showsUserLocation = true
        map.setUserTrackingMode(.follow, animated: true)
        map.mapType = .satelliteFlyover
        let camera = MKMapCamera(lookingAtCenter: locationViewModel.userLocation.coordinate, fromEyeCoordinate: locationViewModel.userLocation.coordinate, eyeAltitude: CLLocationDistanceMax.magnitude)
        map.camera = camera;
        
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        print("\nupdateUIView called...\n")
    }
    
    class Coordinator : NSObject, MKMapViewDelegate {
       var parent : MapView
        
        init(parent1 : MapView) {
            parent = parent1
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            print("\nUser location updated\n ")
        }
        
        func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
            print("\nmapViewWillStartLocatingUser called\n")
        }
        
        
    }
}

