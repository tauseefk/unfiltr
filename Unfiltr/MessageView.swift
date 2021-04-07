//
//  MessageView.swift
//  Counter
//
//  Created by Md Tauseef on 12/23/20.
//

import SwiftUI

struct MessageBubbleView: View {
  let content: String
  let isOwn: Bool
  
  var body: some View {
    let bubbleBG = isOwn ? Color.init("MessageBubbleOwn") : Color.init("MessageBubbleOther")
    let bubbleText = Color.init("TextColor")
    
    Text(content)
      .font(.body)
      .fontWeight(.medium)
      .padding(8)
      .lineLimit(8)
      .lineSpacing(-2)
      .foregroundColor(bubbleText)
      .background(bubbleBG)
  }
}

struct RoundedCorner: Shape {
  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners
  
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    return Path(path.cgPath)
  }
}

extension MessageBubbleView {
  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape(RoundedCorner(radius: radius, corners: corners))
  }
}

struct MessageView: View {
  var content: String
  var isOwn: Bool = false
  var isFirst: Bool = false
  var isLast: Bool = false
  
  var body: some View {
    HStack {
      if (isOwn) { Spacer().frame(minWidth: 80, maxWidth: .infinity) }
      
      MessageBubbleView(content: content, isOwn: isOwn)
        .cornerRadius(6, corners: isLast ? isOwn ? [.topLeft, .topRight, .bottomLeft] : [.topLeft, .topRight, .bottomRight] : .allCorners)
        .padding(isOwn ? .trailing : .leading, 10)
        .padding(.top, isFirst ? 10 : 0)
      
      if (!isOwn) { Spacer().frame(minWidth: 50, maxWidth: .infinity) }
    }
  }
}

#if DEBUG
struct MessageView_Previews: PreviewProvider {
  static var previews: some View {
    MessageView(content: "Hellololoololololololoolololo lolololololololololol lolololololololololol lolololololololololol")
      .previewLayout(.sizeThatFits)
    MessageView(content: "Hellololoololololololoolololo lolololololololololol lolololololololololol lolololololololololol", isOwn: true, isLast: true)
      .previewLayout(.sizeThatFits)
    MessageView(content: "Hellololoolo", isOwn: true, isLast: true)
      .previewLayout(.sizeThatFits)
  }
}
#endif
