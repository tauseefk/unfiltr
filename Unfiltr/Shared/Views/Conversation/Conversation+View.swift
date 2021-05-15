//
//  ConversationView.swift
//  Counter
//
//  Created by Md Tauseef on 12/23/20.
//
import SwiftUI

struct ConversationView: View {
  @State var conversation: Conversation
  @State var isSubscribed = false
  let socket = SocketConnectionManager()
  let throttler = Throttler.init(minimumDelay: 0.5)
  
  let light = UIImpactFeedbackGenerator(style: .light)
  let heavy = UINotificationFeedbackGenerator()
  let messages = MessagesSubscriber()
  
  func handleTyping() {
    throttler.debounce {
      socket.typing()
    }
  }
  
  func appendToConversation(m: String, isOwn: Bool) {
    let count = self.conversation.messages.count
    let message = Message(id: count + 1, body: m, isOwn: isOwn)
    self.conversation.messages.append(message)
  }
  
  func handleReceiveMessage(content: String) {
    appendToConversation(m: content, isOwn: false)
  }
  
  func handleSendMessage(content: String) {
    appendToConversation(m: content, isOwn: true)
    socket.sendMessage(content: content)
  }
  
  func setupSubscriptions() -> Void {
    messagesSubject.subscribe(messages)
    messagesSubject
      .sink(receiveCompletion: { _ in print("Disconnected!") }, receiveValue: handleReceiveMessage)
      .store(in: &subscriptions)
    
    isSubscribed = true
  }
  
  var body: some View {
    let dragDown = DragGesture()
      .onChanged { _ in
        self.hideKeyboard()
      }

      VStack(alignment: .trailing) {
        ScrollView(.vertical) {
          ScrollViewReader { scrollView in
            VStack(alignment: .trailing, spacing: 2) {
              ForEach(self.conversation.messages) { message in
                return MessageView(content: message.body, isOwn: message.isOwn, isFirst: message.id == 1, isLast: message.id == self.conversation.messages.count)
              }
              .onAppear {
                
                // HACK: the whole subscriptions thing seems hacky
                if(!isSubscribed) {
                  let _: Void = setupSubscriptions()
                }
                withAnimation {
                  scrollView.scrollTo(self.conversation.messages.count, anchor: .bottom)
                }
              }
              .onChange(of: self.conversation.messages.count) { [] count in
                withAnimation {
                  scrollView.scrollTo(count, anchor: .bottom)
                }
              }
            }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
          }
        }
        .padding(.top, 1)
        .gesture(dragDown)
        MessageComposeView(onTextChange: handleTyping, onSubmit: handleSendMessage)
      }
      .viewStyle(AppViewStyle())
  }
}

#if canImport(UIKit)
extension ConversationView {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
#endif

#if DEBUG
struct ConversationView_Previews: PreviewProvider {
  static var previews: some View {
    ConversationView(conversation: dummyConversation)
  }
}
#endif
