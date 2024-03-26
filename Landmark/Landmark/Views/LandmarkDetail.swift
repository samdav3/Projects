//
//  LandmarkDetail.swift
//  Landmark
//
//  Created by Sam Davenport on 3/25/24.
//

import SwiftUI

struct LandmarkDetail: View {
    public var landmark: Landmark
    
    var body: some View {
        
        @Bindable var modelData = modelData
        
        ScrollView {
            if #available(iOS 15.0, *){
//                MapView(coordinate: landmark.coordinates)
//                .frame(height: 300)
//
//                CircleImage(image: Image(landmark.image))
//                .offset(y: -130)
//                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                Text("About Turtle Rock")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            Spacer()
        }
    }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
}
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
        
    }
}
