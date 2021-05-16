//
//  WrappedTextBox.swift
//  Unfiltr
//
//  Created by Md Tauseef on 12/29/20.
//

import SwiftUI

struct MessageComposeView: View {
  @State private var content: String = ""
  @State private var isEditing = false
  let onTextChange: () -> Void
  let onSubmit: (_ textContent: String) -> Void
  
  @State private var textBoxHeight: CGFloat?
  let minHeight: CGFloat = 40
  let maxHeight: CGFloat = 350
  
  func handleSubmit() {
    let contentTrimmed = content.trimmingCharacters(in: .whitespacesAndNewlines)
    onSubmit(contentTrimmed)
    content = ""
  }
  
  func handleTextDidChange(_ textView: UITextView) {
    self.textBoxHeight = min(maxHeight, max(textView.contentSize.height, minHeight))
    self.onTextChange()
  }
  
  var body: some View {
    let secondaryColor = Color.init("TextColor")
    
    HStack(alignment: .bottom) {
      VStack {
        WrappedTextView(text: $content, textDidChange: handleTextDidChange)
          .autocapitalization(UITextAutocapitalizationType.sentences)
          .border(secondaryColor)
          .frame(height: textBoxHeight ?? minHeight)
      }
      Button(action: handleSubmit, label: {
        Text("Send")
          .foregroundColor(secondaryColor)
          .padding([.bottom], 10)
      }).disabled(content.count < 1)
    }
    .padding(.vertical, 10)
  }
}

struct MessageComposeView_Previews: PreviewProvider {
  static var previews: some View {
    MessageComposeView(onTextChange: log("typing.."), onSubmit: printString)
  }
}
