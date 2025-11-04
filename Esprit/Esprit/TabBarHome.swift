//
//  TabBarHome.swift
//  Esprit
//
//  Created by Harri SN on 11/1/23.
//

import SwiftUI

struct TabBarHome: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house.circle.fill")
                }
            
            JournalView()
                .tabItem {
                    Label("Journal", systemImage: "doc.append.fill")
                }
            MeditationView()
                .tabItem {
                    Label("Meditation", systemImage: "figure.mind.and.body")
                }
            HeartAlert()
                .tabItem {
                    Label("Alert", systemImage: "heart.text.square.fill")
                }
            HeartGraphView()
                .tabItem {
                    Label("Stress", systemImage: "arrow.up.heart.fill")
                }
        }
    }
}

struct TabBarHome_Previews: PreviewProvider {
    static var previews: some View {
        TabBarHome()
    }
}
