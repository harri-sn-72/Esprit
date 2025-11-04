//
//  ChatView.swift
//  Esprit
//
//  Created by Harri SN on 9/16/23.
//

import SwiftUI

struct ChatView: View {
    @Binding var ifShown: Bool
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            Text("Talk to Healthly, your mental health bot.")
                .font(.title3)
                .fontWeight(.thin)
            ScrollView {
                ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) { message in
                    messageView(message: message)
                }
            }
            HStack {
                TextField("Ex. Give me tips to feel more calm.", text: $viewModel.currentInput)
                    .padding(.leading, 10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.25), lineWidth: 1))
                Button {
                    viewModel.sendMessage()
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .font(.title)
                        .padding(.trailing)
                }
                
            }
            .padding(.horizontal)
        }
    }
    func messageView(message: Message) -> some View {
        HStack {
            if message.role == .user { Spacer() }
            Text(message.content)
                .padding()
                .background(message.role == .user ? Color(hex: "1982FC") : Color(hex: "d8d8d8"))
                .cornerRadius(15)
            if message.role == .assistant { Spacer() }
        }
        .padding(.horizontal)
    }
}

