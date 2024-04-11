//
//  LandmarkList.swift
//  Landmark
//
//  Created by Sam Davenport on 3/25/24.
//

import SwiftUI
import MapKit

@available(iOS 17.0, *)
struct LandmarkList: View {
    
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredLandmarks) { landmark in
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }//detail:
        //            Text("Select a Landmark")
        //        }
        
    }
    
    
    struct LandmarkList_Previews: PreviewProvider {
        static var previews: some View {
            if #available(iOS 17.0, *) {
                LandmarkList()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
