//
//  ContentView.swift
//  Landmark
//
//  Created by Sam Davenport on 3/25/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

@available(iOS 17.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(ModelData())
    }
}
