//
//  WrappedTextBox.swift
//  Unfiltr
//
//  Created by Md Tauseef on 12/29/20.
//

import SwiftUI

struct MessageComposeView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var content: String = ""
    @State private var isEditing = false
    let onTextChange: () -> Void
    let onSubmit: (_ textContent: String) -> Void
    
    @State private var textBoxHeight: CGFloat?
    let minHeight: CGFloat = 40
    let maxHeight: CGFloat = 150
    
    func handleSubmit() {
        onSubmit(content)
        content = ""
    }
    
    func handleTextDidChange(_ textView: UITextView) {
        self.textBoxHeight = max(textView.contentSize.height, minHeight)
        self.onTextChange()
    }
    
    var body: some View {
        let secondaryColor = colorScheme == .dark ? Color.white : Color.init(UIColorFromHex(rgbValue: 0x222C37))
        
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
        .padding(10)
    }
}

struct MessageComposeView_Previews: PreviewProvider {
    static var previews: some View {
        MessageComposeView(onTextChange: log("typing.."), onSubmit: printString)
    }
}
