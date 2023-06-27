//
//  ContentView.swift
//  RestoPick
//
//  Created by ZML on 2023/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Latitude: \(locationManager.latitude)")
            Text("Longitude: \(locationManager.longitude)")

            Button("Get Location") {
                locationManager.requestLocation()
            }
        }
        .padding()
        .alert(isPresented: $locationManager.showErrorAlert) {
            Alert(
                title: Text("Error"),
                message: Text("Unable to retrieve location information."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
