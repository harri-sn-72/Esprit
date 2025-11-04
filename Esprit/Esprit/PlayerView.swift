//
//  PlayerView.swift
//  Esprit
//
//  Created by Harri SN on 10/29/23.
//

import SwiftUI

struct PlayerView: View {
    @State private var isToggled: Bool = false
    @State private var downloadAmount = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @Binding var isShowing: Bool
    var body: some View {
        ZStack {
            Image("image-stones")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
                .overlay {
                    Rectangle()
                        .ignoresSafeArea()
                        .opacity(0.55)
                        .foregroundColor(Color.black)
                }
            VStack {
                HStack {
                    Text("Inner Calm")
                        .padding()
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    Spacer()
                }
                Spacer()
                Image("breathe")
                    .resizable()
                    .scaledToFill()
                    .padding()
                    .cornerRadius(100)
                    .frame(width: 300, height: 300)
                    .shadow(radius: 5)
                ProgressView("Section One: Breathe In, Breathe Out", value: downloadAmount, total: 100)
                    .padding()
                    .foregroundColor(Color.white)
                    .onReceive(timer) { _ in
                        if downloadAmount < 100 {
                            downloadAmount += 0.02
                        }
                    }

                HStack {
                    Button (action: {
                        downloadAmount = 0.0
                    }) {
                        Image(systemName: "backward.end.circle.fill")
                            .font(.system(size: 25))

                    }
                    Spacer()

                    Button (action: {
                        downloadAmount -= 0.2

                    }) {
                        Image(systemName: "gobackward.15")
                            .font(.system(size: 25))

                    }
                    Spacer()

                    Button (action: {
                        isToggled.toggle()
                        
                    }){
                        if isToggled == false {
                            Image(systemName: "play.rectangle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(Color.white)
                        }
                        else if isToggled == true {
                            Image(systemName: "pause.rectangle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(Color.white)
                        }
                }
                    Spacer()

                    Button (action: {
                        downloadAmount += 0.2
                    }) {
                        Image(systemName: "goforward.15")
                            .font(.system(size: 25))

                    }
                    Spacer()

                    Button (action: {
                        downloadAmount = 100.0

                    }) {
                        Image(systemName: "forward.end.circle.fill")
                            .font(.system(size: 25))

                    }
                }
                .padding()
                .foregroundColor(Color.white)
                Spacer()
            }
        }
    }
}

