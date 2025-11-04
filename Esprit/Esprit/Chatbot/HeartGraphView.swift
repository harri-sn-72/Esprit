//
//  HeartGraphView.swift
//  Esprit
//
//  Created by Harri SN on 11/1/23.
//

import SwiftUI

struct HeartGraphView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Text("Your Heart Rate")
                        .font(.system(size: 35))
                        .fontWeight(.light)
                    .padding(.bottom, 2.5)
                    .foregroundColor(.white)
                    Spacer()
                }
                .padding(.leading, 35)
                
                Image("heartgraph")
                    .resizable()
                    .scaledToFit()
                .frame(width: 365)
                
                Text("The graph above indicates strenuous activity or stress from the time periods of 5:00 PM on October 26 and again from 4:00 PM on October 27.\n\nHaving too much activities can increase your stress, therefore decreasing you overall mental health.\n\nBe sure to evenly space out your activities so you cn allow time for rest and for a mental health break.")
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
        }
        .background(Color.black)
    }
}

struct HeartGraphView_Previews: PreviewProvider {
    static var previews: some View {
        HeartGraphView()
    }
}
