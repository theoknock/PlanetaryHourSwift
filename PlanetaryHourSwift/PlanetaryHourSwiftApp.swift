//
//  PlanetaryHourSwiftApp.swift
//  PlanetaryHourSwift
//
//  Created by Xcode Developer on 5/1/21.
//

import SwiftUI

@main
struct PlanetaryHourSwiftApp: App {
    @EnvironmentObject var locationViewModel: LocationViewModel
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(LocationViewModel())
        }
    }
}
