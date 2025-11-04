//
//  ChatViewModel.swift
//  Esprit
//
//  Created by Harri SN on 9/16/23.
//

import Foundation

extension ChatView {
    class ViewModel: ObservableObject {
        @Published var messages: [Message] = [Message(id: UUID(), role: .system, content: "You are a mental health assistant. You will help me to only be stress-free and calm. You do not have any other information about any other topic except this, avoid doing so at all costs.", createAt: Date())]
        
        @Published var currentInput: String = ""
        private let openAIService = OpenAIService()
        func sendMessage() {
            let newMessage = Message(id: UUID(), role: .user, content: currentInput, createAt: Date())
            messages.append(newMessage)
            currentInput = ""
            
            Task {
                let response = await openAIService.sendMessage(messages: messages)
                guard let recievedOpenAIMessage = response?.choices.first?.message else{
                    print("Had recieved no message")
                    return
                }
                let recievedMessage = Message(id: UUID(), role: recievedOpenAIMessage.role, content: recievedOpenAIMessage.content, createAt: Date())
                await MainActor.run {
                    messages.append(recievedMessage)
                }
            }
        }
    }
}

struct Message: Decodable {
    let id: UUID
    let role: SenderRole
    let content: String
    let createAt: Date
}

