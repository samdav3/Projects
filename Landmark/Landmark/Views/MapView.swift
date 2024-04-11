//
//  MapView.swift
//  Landmark
//
//  Created by Sam Davenport on 3/25/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Text("Text")
        if #available(iOS 17.0, *) {
            Map(position: .constant(.region(region)))
        } else {
            // Fallback on earlier versions
        }
    }
    private var region: MKCoordinateRegion{
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(position: .constant(.region(landmark.region)))
    }
}
