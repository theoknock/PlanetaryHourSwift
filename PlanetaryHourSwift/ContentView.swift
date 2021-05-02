//
//  ContentView.swift
//  PlanetaryHourSwift
//
//  Created by Xcode Developer on 5/1/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationViewModel = LocationViewModel()

    var body: some View {
        Text("\(locationViewModel.userLocation.coordinate.latitude), \(locationViewModel.userLocation.coordinate.longitude)").padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
