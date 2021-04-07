//
//  SocketConnectionManager.swift
//  Unfiltr
//
//  Created by Md Tauseef on 1/2/21.
//

import Foundation
import SocketIO
import Combine

struct User: Identifiable {
    var id: UUID?
}

struct SocketInfo: Codable {
    var id: UUID
    var connectedUsers: [UUID]
}

struct SocketUserConnect: Codable {
    var users: Int
}

struct SocketUserDisconnect: Codable {
    var userId: UUID
}

struct SocketMessage: Codable, Identifiable {
    var from: UUID
    var id: UUID
    var message: String
}

struct SocketTyping: Codable {
    var userId: UUID
}

struct SocketStoppedTyping: Codable {
    var userId: UUID
}

enum Events: String {
    case Connection = "connection"
    case Disconnect = "disconnect"
    case Info = "info"
    case NewMessage = "newMessage"
    case Typing = "userTyping"
    case StoppedTyping = "userStoppedTyping"
    case UserConnected = "userConnected"
    case UserDisconneted = "userDisconnected"
    case MessageId = "messageId"
    case EmphasizeMessage = "emphasizeMessage"
}

class SocketConnectionManager {
    var user = User(id: UUID())
    //    var connectedUsers: [User] = []
    let manager = SocketManager(socketURL: URL(string: ProcessInfo.processInfo.environment["server_addr"] ?? "http://localhost:5000")!, config: [.log(false), .compress])
    var socket: SocketIOClient? = nil
    
    init() {
        setupSocket()
        setupSocketEvents()
        socket?.connect()
    }
    
    func stop() {
        socket?.removeAllHandlers()
    }
    
    func setupSocket() {
        self.socket = manager.defaultSocket
    }
    
    func setupSocketEvents() {
        socket?.on(clientEvent: .connect) { data, ack in
            print("connected")
            // fire connection event to register user on the server
            self.register()
        }
        
        socket?.on(Events.Info.rawValue) { (data, ack) in
            guard let dataInfo = data.first else { return }
            if let response: SocketInfo = try? JSONParser.convert(data: dataInfo) {
                self.user.id = response.id
                print("Logged in as \(response.id)")
            }
        }
        
        socket?.on(Events.UserConnected.rawValue) { (data, ack) in
            guard let dataInfo = data.first else { return }
            if let response: SocketUserConnect = try? JSONParser.convert(data: dataInfo) {
                print("Now there are \(response.users) users.")
            }
        }
        
        socket?.on(Events.UserDisconneted.rawValue) { (data, ack) in
            guard let dataInfo = data.first else { return }
            if let response: SocketUserDisconnect = try? JSONParser.convert(data: dataInfo) {
                print("User \(response.userId) disconnected")
            }
        }
        
        socket?.on(Events.NewMessage.rawValue) { (data, ack) in
            guard let dataInfo = data.first else { return }
            if let response: SocketMessage = try? JSONParser.convert(data: dataInfo) {
                print("User \(response.from) says: \(response.message) ")
                
                messagesSubject.send(response.message)
            }
        }
        
        socket?.on(Events.Typing.rawValue) { (data, ack) in
            guard let dataInfo = data.first else { return }
            if let response: SocketTyping = try? JSONParser.convert(data: dataInfo) {
                print("user \(response.userId) is typing...")
            }
        }
        
        socket?.on(Events.StoppedTyping.rawValue) { (data, ack) in
            guard let dataInfo = data.first else { return }
            if let response: SocketStoppedTyping = try? JSONParser.convert(data: dataInfo) {
                print("user \(response.userId) stopped typing...")
            }
        }
    }
    
    func register() {
        socket?.emit(Events.Connection.rawValue)
    }
    
    func sendMessage(content: String) {
        let message: SocketMessage = SocketMessage(from: user.id!, id: UUID(), message: content)
        
        guard let encodedMessage = try? JSONEncoder().encode(message) else {
            print("Failed to encode message")
            return
        }
        socket?.emit(Events.NewMessage.rawValue, encodedMessage)
    }
    
    func typing() {
        let typing: SocketTyping = SocketTyping(userId: user.id!)
        
        guard let encodedData = try? JSONEncoder().encode(typing) else {
            print("Failed to encode message")
            return
        }
        socket?.emit(Events.Typing.rawValue, encodedData)
    }
}
