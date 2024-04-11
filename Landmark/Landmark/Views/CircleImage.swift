//
//  CircleImage.swift
//  Landmark
//
//  Created by Sam Davenport on 3/25/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        Text("Text")
        image
        if #available(iOS 15.0, *) {
            Image("turtlerock")
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.white, lineWidth: 4)
                }.shadow(radius: 7)
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            CircleImage(image: Image("turtlerock"))
        } else {
            // Fallback on earlier versions
        }
    }
}
