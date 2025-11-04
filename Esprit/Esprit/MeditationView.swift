//
//  MeditationView.swift
//  Esprit
//
//  Created by Harri SN on 10/29/23.
//

import SwiftUI

struct MeditationView: View {
    @State private var isShowing = false
    var body: some View {
        VStack (spacing: 0) {
            Image("image-stones")
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3)
            
            ZStack {
                Color(red: 24/255, green: 23/255, blue: 22/255)
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Esprit")
                        Text("15 minutes")
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    Text("Inner Calm Meditation")
                        .font(.title)
                    
                    Button(action: {
                        isShowing.toggle()
                    }) {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                    }
                    .sheet(isPresented: $isShowing) {
                        PlayerView(isShowing: $isShowing)
                    }
                    
                    Text("Find your centre in a chaotic world. Clear your mind and venture into a peaceful oasis.")
                    
                    Spacer()
                }
                .foregroundColor(.white)
                .padding(20)
                
            }
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
        }
        .ignoresSafeArea()
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}
