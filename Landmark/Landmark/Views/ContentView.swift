//
//  ContentView.swift
//  Landmark
//
//  Created by Sam Davenport on 3/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.environment(ModelData())
    }
}
