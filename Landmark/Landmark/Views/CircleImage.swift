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
//        if #available(iOS 15.0, *) {
//            Image("turtlerock")
//                .clipShape(Circle())
//                .overlay{
//                    Circle().stroke(.white, lineWidth: 4)
//                }.shadow(radius: 7)
//        } else {
//            //Fallback on earlier versions
//        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
