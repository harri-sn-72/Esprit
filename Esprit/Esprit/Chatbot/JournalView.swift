//
//  JournalView.swift
//  Esprit
//
//  Created by Harri SN on 10/31/23.
//

import SwiftUI

struct JournalView: View {
    @State private var date = Date()
    @State private var journalText = "Start writing..."
    @State private var journalTitle = "Title here!"

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Journal.")
                            .font(.system(size: 35))
                            .fontWeight(.light)
                            .padding([.leading])
                            .padding(.bottom, 2.5)
                        
                        Text("Write about how are you feeling.")
                            .padding(.leading)
                            .font(.headline)
                            .fontWeight(.thin)
                        
                        
                        HStack {
                            Spacer()
                          NavigationLink(destination: ListView()) {
                                ZStack(alignment: .center){
                                    
                                    Rectangle()
                                         .frame(width: 75, height: 100)
                                         .cornerRadius(20)
                                     .foregroundColor(Color(hex: "FBC4CE"))
                                    
                                    
                                }
                            }
                            Spacer()
                            ZStack {
                                Rectangle()
                                     .frame(width: 73, height: 100)
                                     .cornerRadius(20)
                                 .foregroundColor(Color(hex: "C4F4FB"))
                                
                                VStack {
                                    Image(systemName: "doc.append.fill")
                                    
                                    Text("Work")
                                        .font(.system(size: 10))
                                        .fontWeight(.semibold)
                                }
                            }
                            Spacer()
                            ZStack {
                                Rectangle()
                                     .frame(width: 73, height: 100)
                                     .cornerRadius(20)
                                 .foregroundColor(Color(hex: "DEDEDE"))
                                
                                VStack {
                                    Image(systemName: "studentdesk")
                                    
                                    Text("School")
                                        .font(.system(size: 10))
                                        .fontWeight(.semibold)
                                }
                            }
                                 
                            Spacer()
                        }
                        .padding([.top, .leading, .bottom])
                        
                        Divider()
                    
                        Text("Create a new entry.")
                            .font(.system(size: 25))
                            .fontWeight(.light)
                            .padding([.leading])
                            .padding(.bottom, 2.5)
                        
                        Text("Start typing below:")
                            .padding(.leading)
                            .font(.headline)
                            .fontWeight(.thin)
                        
                        DatePicker("Today's Date", selection: $date)
                            .padding(.horizontal)
                            .fontWeight(.light)
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 365, height: 35)
                                .foregroundColor(Color(hex: "DEDEDE"))
                                .cornerRadius(12)
                            TextField("Title", text: $journalTitle)
                                .padding(.horizontal)
                        }
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 365, height: 425)
                                .foregroundColor(Color(hex: "DEDEDE"))
                                .cornerRadius(12)
                            
                            TextEditor(text: $journalText)
                                            .foregroundStyle(.secondary)
                                            .padding(.horizontal)
                        }
                        Button(action: {
                            
                        }) {
                            HStack {
                                Spacer()
                                ZStack {
                                  
                                    Rectangle()
                                        .frame(width: 60, height: 30)
                                        .cornerRadius(10)
                                    
                                    Text("Save")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                    
                                }
                                Spacer()
                            }
                        }
                    }
                    .padding()
                    Spacer()
                }
                Spacer()

            }
        }
        
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}

struct ListView: View {
    @State private var isShowing = false
    var body: some View {
        VStack {
            HStack {
                Text("Your Entries:")
                    .font(.system(size: 35))
                    .fontWeight(.light)
                    .padding([.leading])
                .padding(.bottom, 2.5)
                Spacer()
            }
            List() {
                Button(action: {
                    isShowing.toggle()
                }) {
                    HStack {
                       
                           VStack(alignment: .leading) {
                               Text("November 1, 2023")
                                   .font(.system(size: 20))
                                   .fontWeight(.bold)
                               .padding(.bottom, 2.5)
                               
                               Text("My App Challenge Submission")
                           }
                           Spacer()
                           Image(systemName: "chevron.right")
                       }
                    .foregroundColor(.black)
                   }
                sheet(isPresented: $isShowing) {
                    JournalDetailView(title: "My App Challenge Submission", date: Date(), bodyText: "Today, I am excited to share my thoughts on my recent submission for the 'Congressional App Challenge.' Over the past few weeks, I have poured my creativity, time, and energy into developing an innovative and user-friendly application. The challenge prompted me to think outside the box, and I embraced the opportunity to create a solution that can potentially make a positive impact in people's lives. The journey was filled with moments of inspiration, late-night coding sessions, and countless iterations to perfect the user interface. As I clicked the 'Submit' button, a wave of accomplishment washed over me. Regardless of the outcome, I'm proud of the hard work and dedication I put into my app, and I can't wait to see how it fares in the competition. This challenge has been a valuable experience, and it's a reminder that with determination and creativity, we can turn our ideas into reality.")
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("October 31, 2023")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        .padding(.bottom, 2.5)
                        
                        Text("Last Day Before the App Challenge")
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text("October 30, 2023")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        .padding(.bottom, 2.5)
                        
                        Text("I had a math test.")
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                }
                
                .ignoresSafeArea()
            }
        }
    }

