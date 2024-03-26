//
//  Landmark.swift
//  Landmark
//
//  Created by Sam Davenport on 3/25/24.
//
import SwiftUI
import Foundation
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var coordinates: Coordinates
    private var imageName: String
    var isFavorite: Bool
    
}


struct Coordinates: Hashable, Codable{
    var latitude: Double
    var longitude: Double
}
