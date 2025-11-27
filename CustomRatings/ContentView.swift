//
//  ContentView.swift
//  CustomRatings
//
//  Created by Todd Hootman on 11/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var currentRating: Int = 0
    var body: some View {
        RatingsView (
            maxRating: 5,
            currentRating: $currentRating,
            width: 40
        )
    }
}

#Preview {
    ContentView()
}
