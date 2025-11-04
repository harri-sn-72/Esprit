//
//  ContentView.swift
//  Esprit
//
//  Created by Harri SN on 7/31/23.
//

import SwiftUI

struct Feel: Identifiable, Hashable {
    let id = UUID()
    var color: String
    var emoji: String
}

let feelData: [Feel] = [
    Feel(color: "FBC4CE", emoji: "😃"),
    Feel(color: "C4F4FB", emoji: "😴"),
    Feel(color: "DEDEDE", emoji: "😢"),
    Feel(color: "ACFFAA", emoji: "😐")
]
let itemData: [String] = ["meditate", "yoga", "workout", "journaling"]

var feels: [Feel] = feelData
var items: [String] = itemData
struct ContentView: View {
    @State var isShown: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("menu")
                        .resizable()
                        .scaledToFit()
                        .padding(.leading)
                    Spacer()
                    Button(action: {
                        isShown.toggle()
                    }) {
                        Image("chat")
                            .resizable()
                            .scaledToFit()
                            .padding(.trailing)
                    }
                    .sheet(isPresented: $isShown) {
                        ChatView(ifShown: $isShown)
                    }
                }
                .frame(height: 25)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Bienvenue.")
                            .font(.system(size: 35))
                            .fontWeight(.light)
                            .padding([.leading])
                            .padding(.bottom, 2.5)
                        
                        Text("How are you feeling right now?")
                            .padding(.leading)
                            .font(.headline)
                            .fontWeight(.thin)
                    }
                    Spacer()
                }
                .padding(.bottom, 5)
                HStack {
                    ForEach(feels, id: \.self) { feel in
                        Button(action: {
                            
                        }) {
                            FeelTile(feel: feel)
                        }
                    }
                }
                .padding(.leading)
                Divider()
                    .frame(width: 365)
                
                HStack {
                    VStack(alignment: .leading) {
                        
                        Text("Top 3 mental health tips of the day:")
                            .padding(.leading)
                            .font(.headline)
                            .padding(.bottom)
                        Text("1. Start your day with a cup of co­ffee. Coff­ee consumption is linked to lower rates of depression. If you can’t drink coff­ee because of the caff­eine, try another good-for-you drink like green tea.")
                            .padding([.leading, .bottom])
                            .font(.headline)
                            .fontWeight(.thin)
                        Text("2. Experiment with a new recipe, write a poem, paint or try a Pinterest project. Creative expression and overall well-being are linked.")
                            .padding([.leading, .bottom])
                            .font(.headline)
                            .fontWeight(.thin)
                        
                        Text("3. Take 30 minutes to go for a walk in nature - it could be a stroll through a park, or a hike in the woods. Research shows that being in nature can increase energy levels, reduce depression and boost well-being.")
                            .padding([.leading, .bottom])
                            .font(.headline)
                            .fontWeight(.thin)
                        
                    }
                    Spacer()
                }
                Divider()
                    .frame(width: 365)
                
                Spacer()
                   
                
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FeelTile: View {
    var feel: Feel
    var body: some View {
        ZStack {
           Rectangle()
                .frame(width: 73, height: 73)
                .cornerRadius(20)
                .padding(.trailing)
                .foregroundColor(Color(hex: feel.color))
            
            Text(feel.emoji)
                .font(.system(size: 35))
                .padding(.trailing)

        
        }
    }
}

