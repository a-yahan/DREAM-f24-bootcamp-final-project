//
//  UseAI.swift
//  DreamApp
//
//  Created by Yahan Yang on 11/22/24. and 11/24/24 because git lost the file...
//

import Foundation
import SwiftData
import OpenAIKit

let MyapiKey = "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"

let openAI = OpenAI(Configuration(organizationId: "Personal", apiKey: MyapiKey))


struct UseAI{
    public static func generateSummary(entry: String) async -> String {
        do{
            let chat: [ChatMessage] = [
                ChatMessage(role: .system, content: "You are a helpful writing assistant"),
                ChatMessage(role: .user, content: "Can you summarize the following texts for me? \(entry)"),
                
                /*ChatMessage(role: .assistant, content: "Here is a summary of the text: "),
                ChatMessage(role: .user, content: "Can you summarize the following texts for me? \(entry)")*/
            ]
            let chatParams = ChatParameters(
                model: .gpt4,
                messages: chat
            )
            let chatCompletion = try await openAI.generateChatCompletion(
                parameters: chatParams)
            
            if let message = chatCompletion.choices[0].message{
                return message.content ?? "Default Response"
            }else {
                return "No Responses"
            }
        }catch{
            print(error)
            return "Arror has occured: \(error)"
        }
    }
}
