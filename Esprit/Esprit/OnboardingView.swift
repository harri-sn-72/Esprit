//
//  OnboardingView.swift
//  Esprit
//
//  Created by Harri SN on 7/31/23.
//

import SwiftUI

struct OnboardingViewOne: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("ribbon")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
                .padding(.bottom)
            Text("ESPIRT")
                .kerning(20)
                .font(.title)
                .padding(.leading)
            Text("Bienvenue. Enchanté.")
                .padding(.top, 2)
                .font(.headline)
            Text("Take care of your mind now.")
                .padding(.bottom)
                .padding(.top,2)

            Button(action: {
                
            }){
                Text("N E X T             ")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(40)
                    .foregroundColor(.black)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewOne()
    }
}

struct OnboardingViewTwo: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("journal")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
                .padding(.bottom)
            Text("JOURNAL")
                .kerning(20)
                .font(.title)
                .padding(.leading)
            Text("For all the day can hold.")
                .padding(.top, 2)
                .font(.headline)
            Text("Add images and type endlessly about the wonders of your day.")
                .padding(.bottom)
                .multilineTextAlignment(.center)
                .padding(.leading)
                .padding(.trailing)
                .padding(.top,2)

            Button(action: {
                
            }){
                Text("N E X T             ")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(40)
                    .foregroundColor(.black)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
        }
    }
}

struct OnboardingViewThree: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("chat")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
                .padding(.bottom)
            Text("CHAT")
                .kerning(20)
                .font(.title)
                .padding(.leading)
            Text("Your own little friend.")
                .padding(.top, 2)
                .font(.headline)
            Text("Talk to it like a normal person. It’ll talk back like a normal person.")
                .padding(.bottom)
                .multilineTextAlignment(.center)
                .padding(.leading,10)
                .padding(.trailing,10)
                .padding(.top,2)

            Button(action: {
                
            }){
                Text("N E X T             ")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(40)
                    .foregroundColor(.black)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
        }
    }
}

struct OnboardingViewFour: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("meditation")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
                .padding(.bottom)
            Text("MEDITATE")
                .kerning(20)
                .font(.title)
                .padding(.leading)
            Text("Time for some peace.")
                .padding(.top, 2)
                .font(.headline)
            Text("Simple and peaceful. Have the simpleness of mind, and be stress-free.")
                .padding(.bottom)
                .multilineTextAlignment(.center)
                .padding(.leading,10)
                .padding(.trailing,10)
                .padding(.top,2)

            Button(action: {
                
            }){
                Text("L E T ' S  G O!             ")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(40)
                    .foregroundColor(.black)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
        }
    }
}
