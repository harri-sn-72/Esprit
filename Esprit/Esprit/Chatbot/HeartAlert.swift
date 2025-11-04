//
//  HeartAlert.swift
//  Esprit
//
//  Created by Harri SN on 11/1/23.
//

import SwiftUI

struct HeartAlert: View {
    @State private var isShowing = false
    var body: some View {
        VStack {
            Image(systemName: "heart.text.square.fill")
                .font(.system(size: 100))
                .foregroundColor(Color.accentColor)
                .padding(.top, 100)
            
            Text("Abnormal Heart Rate \nDetected")
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.vertical)
            
            Text("We’ve noticed that your heart rate has been consistently high for the past 10 minutes without doing any strenuous physical activity.\n\nWe just wanted to make sure everything is alright with you.\n\nYour current heart rate is at 156 bpm. A resting heart rate for your stats is around 70-80 bpm.")
                .fontWeight(.thin)
                .foregroundColor(.black)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            
            ZStack {
                Rectangle()
                    .frame(width: 372, height: 78)
                .cornerRadius(20)
                
                Text("I’m fine.")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
            }
            .padding(.top)
            
            ZStack {
                Button(action: {
                    isShowing.toggle()
                }) {
                    Rectangle()
                        .frame(width: 372, height: 78)
                    .cornerRadius(20)
                    .foregroundColor(Color.accentColor)
                }
                .sheet(isPresented: $isShowing) {
                    BreatheView(isShowing: $isShowing)
                }
                
                Text("I’m having a panic attack.")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            .padding(.top)
            

            Spacer()
        }
    }
}

struct HeartAlert_Previews: PreviewProvider {
    static var previews: some View {
        HeartAlert()
    }
}

struct BreatheView: View {
    @Binding var isShowing: Bool
    var body: some View {
        VStack {
            CalmBreatheAnimation()
                .padding(.horizontal)
                
            Text("Breathe In, Breathe Out")
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.vertical)
            
            Text("For each beat the you feel, breathe in and breathe out. \n\nThis will help regulate your heart rate a bit and help you relax. Do this for at least one minute.\n\n Always remeber to identify your panic trigger. If you feel better, swipe down to dismiss this pop-up.")
                .fontWeight(.thin)
                .foregroundColor(.black)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            
            
        }
    }
}



struct CalmBreatheAnimation: View {
    @State private var breathIn = false
    @State private var breathOut = false
    @State private var hold = true
    
    @State private var circuLarMotion = false
    @State private var displayHold = false
    @State private var displayBreathOut = false
    @State private var hideBreathOut = false
    @State private var hideBreathIn = false
    @State private var hideHold = false
    @State private var displaySecondHold = false
    @State private var hideSecondHold = false
    
    let grape = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    let aqua = Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
    let iron = Color(#colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1))
    let snow = Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
    let screenBackground = Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1))
    let fillGradient = LinearGradient(gradient: Gradient(colors: [Color.black, Color.accentColor]), startPoint: .bottomLeading, endPoint: .topTrailing)
    
    var body: some View {
        ZStack {
            ZStack {
                
                fillGradient
                    .clipShape(
                        Circle())
                    .frame(width: 340, height: 340)
                
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 370, height: 370)
                    .foregroundColor(iron)
                
                Circle()
                    .trim(from: 0, to: 1/4)
                    .stroke(lineWidth: 5)
                    .frame(width: 370, height: 370)
                    .foregroundColor(aqua)
                    .rotationEffect(.degrees(-90))
                
                Circle()
                    .trim(from: 0, to: 1/4)
                    .stroke(lineWidth: 5)
                    .frame(width: 370, height: 370)
                    .foregroundColor(grape)
                    .rotationEffect(.degrees(90))
                
                Capsule()
                    .trim(from: 1/2, to: 1)
                    .frame(width: 20, height: 25)
                    .foregroundColor(snow)
                    .offset(y: 187)
                
                Capsule()
                    .trim(from: 1/2, to: 1)
                    .frame(width: 20, height: 25)
                    .foregroundColor(snow)
                    .rotationEffect(.degrees(180))
                    .offset(y: -187)
                
                Capsule()
                    .trim(from: 1/2, to: 1)
                    .frame(width: 20, height: 25)
                    .foregroundColor(snow)
                    .rotationEffect(.degrees(-90))
                    .offset(x: 187)
                
                Capsule()
                    .trim(from: 1/2, to: 1)
                    .frame(width: 20, height: 25)
                    .foregroundColor(snow)
                    .rotationEffect(.degrees(90))
                    .offset(x: -187)
                
                
                ZStack {
                    Circle()  // Path
                        .stroke()
                        .frame(width: 360, height: 360)
                        .opacity(0)
                    
                    Capsule()  // Rotating capsule
                        .trim(from: 1/2, to: 1)
                        .frame(width: 25, height: 25)
                        .foregroundColor(aqua)
                        .offset(y: 187)
                        .rotationEffect(.degrees(circuLarMotion ? 360 : 0))
                        .onAppear() {
                            withAnimation(Animation.linear(duration: 16)) {
                                circuLarMotion = true
                            }
                        }
                }
                
            }.frame(width: 360, height: 360)
                .scaleEffect(breathIn ? 1 : 0.8)
                .scaleEffect(hold ? 1 : 1)
                .scaleEffect(breathOut ? 0.8 : 1)
            
                .onAppear() {
                    withAnimation(Animation.linear(duration: 4)){
                        breathIn.toggle()
                        
                        
                    }
                    
                    withAnimation(Animation.linear(duration: 4).delay(4)){
                        hold.toggle()
                    }
                    
                    withAnimation(Animation.linear(duration: 4).delay(8)){
                        breathOut.toggle()
                        
                    }
                    
                    withAnimation(Animation.linear(duration: 4).delay(12)){
                        hold.toggle()
                        
                    }
                    
                }
            ZStack {
                 Text("Breath Out")
                    .foregroundColor(snow)
                    .scaleEffect(1)
                    .opacity(displayBreathOut ? 1 : 0)
                    .opacity(hideBreathOut ? 0 : 1)
                    .onAppear(){
                        withAnimation(Animation.easeInOut(duration: 0.4).delay(8)) {
                            displayBreathOut.toggle()
                        }
                        
                        withAnimation(Animation.easeInOut(duration: 0.4).delay(12)) {
                            hideBreathOut.toggle()
                        }
                    }
                
                Text("Hold") // Second hold
                    .foregroundColor(snow)
                    .scaleEffect(1)
                    .opacity(displaySecondHold ? 1 : 0)
                    .opacity(hideSecondHold ? 0 : 1)
                    .onAppear(){
                        withAnimation(Animation.easeInOut(duration: 0.4).delay(12)) {
                            displaySecondHold.toggle()
                        }
                        
                        withAnimation(Animation.easeInOut(duration: 0.4).delay(16)) {
                            hideSecondHold.toggle()
                        }
                    }
                
                Text("Hold")
                    .foregroundColor(snow)
                    .scaleEffect(1)
                    .opacity(displayHold ? 1 : 0)
                    .opacity(hideHold ? 0 : 1)
                
                    .onAppear(){
                        withAnimation(Animation.easeInOut(duration: 0.4).delay(4)) {
                            displayHold.toggle()
                        }
                        
                        withAnimation(Animation.easeInOut(duration: 0.4).delay(8)) {
                            hideHold.toggle()
                        }
                    }
                
                Text("Breath In")
                    .foregroundColor(snow)
                    .opacity(hideBreathIn ? 0 : 1)
                    .animation(.easeInOut(duration: 0.4).delay(4), value: hideBreathIn)
                    .onAppear(){
                        hideBreathIn.toggle()
                    }
            }
        }
    }
}


