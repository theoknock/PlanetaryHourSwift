//
//  ContentView.swift
//  PlanetaryHourSwift
//
//  Created by Xcode Developer on 5/1/21.
//

import SwiftUI
import MapKit
import CoreLocation

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
            let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.region = region
        }
        
        func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
            print("\nmapViewWillStartLocatingUser called...\n")
        }
    }
}

