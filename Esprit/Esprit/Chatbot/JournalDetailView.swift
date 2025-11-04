//
//  JournalDetailView.swift
//  Esprit
//
//  Created by Harri SN on 10/31/23.
//

import SwiftUI

struct JournalDetailView: View {
    var title: String
    var date: Date
    var bodyText: String
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 35))
                    .fontWeight(.light)
                    .padding(.bottom, 2.5)
                
                Text("\(date)")
                    .font(.headline)
                    .fontWeight(.thin)
                Divider()
                    .frame(width: 365)
                
                Text(bodyText)
                    .font(.headline)
                    .fontWeight(.light)
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

