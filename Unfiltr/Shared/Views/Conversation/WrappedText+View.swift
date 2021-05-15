//
//  WrappedTextView.swift
//  Unfiltr
//
//  Created by Md Tauseef on 12/29/20.
//

import UIKit
import SwiftUI

struct WrappedTextView: UIViewRepresentable {
  
  class Coordinator: NSObject, UITextViewDelegate {
    
    @Binding var text: String
    let textDidChange: (UITextView) -> Void
    var didBecomeFirstResponder = false
    
    init(text: Binding<String>, textDidChange: @escaping (UITextView) -> Void) {
      _text = text
      self.textDidChange = textDidChange
    }
    
    func textViewDidChange(_ textView: UITextView) {
      DispatchQueue.main.async {
        self.text = textView.text
        self.textDidChange(textView)
      }
    }
  }
  
  @Binding var text: String
  let textDidChange: (UITextView) -> Void
  var isFirstResponder: Bool = false
  
  func makeUIView(context: UIViewRepresentableContext<WrappedTextView>) -> UITextView {
    let textView = UITextView()
    textView.delegate = context.coordinator
    
    // interactions
    textView.isUserInteractionEnabled = true
    textView.isEditable = true
    
    // styling
    textView.font = .systemFont(ofSize: 16)
    
    return textView
  }
  
  func makeCoordinator() -> WrappedTextView.Coordinator {
    return Coordinator(text: $text, textDidChange: textDidChange)
  }
  
  func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<WrappedTextView>) {
    uiView.text = text
    if isFirstResponder && !context.coordinator.didBecomeFirstResponder {
      uiView.becomeFirstResponder()
      context.coordinator.didBecomeFirstResponder = true
    }
    
    DispatchQueue.main.async {
      self.textDidChange(uiView)
    }
  }
}
