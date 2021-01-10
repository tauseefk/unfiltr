//
//  Conversation.swift
//  Counter
//
//  Created by Md Tauseef on 12/23/20.
//

import Combine

struct Message: Hashable, Codable, Identifiable {
    public var id: Int
    let body: String
    let isOwn: Bool
}

struct Conversation: Hashable, Codable {
    var messages: [Message] = []
}

let dummyConversation: Conversation = {
    var conversation = Conversation()
    
    var longMessage = "This is the start of your conversation, you can't see any previous messages coz that's not how conversations IRL work do they?"
    var message = Message(id: 1, body: longMessage, isOwn: false)
    conversation.messages.append(message)

//    for index in 2..<4 {
//        var message = Message(id: index, body: "message: \(index)", isOwn: index % 2 == 0)
//        conversation.messages.append(message)
//    }
    
    return conversation
}()

enum MessagesError: Error {
    case Failed
}

final class MessagesSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = MessagesError
    
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("received message (subscriber): ", input)
        
        return .none
    }
    
    func receive(completion: Subscribers.Completion<MessagesError>) {
        print("received completion: ", completion)
    }
}

let messagesSubject = PassthroughSubject<String, MessagesError>()

var subscriptions = Set<AnyCancellable>()
