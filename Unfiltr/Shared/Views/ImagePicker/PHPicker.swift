import PhotosUI
import SwiftUI

struct PHPicker: UIViewControllerRepresentable {
    @SwiftUI.Environment(\.presentationMode) var presentationMode
  let configuration: PHPickerConfiguration
  let completion: (_ selectedImage: UIImage) -> Void

  func makeUIViewController(context: Context) -> PHPickerViewController {
    let controller = PHPickerViewController(configuration: configuration)
    controller.delegate = context.coordinator
    return controller
  }

  func updateUIViewController(_: PHPickerViewController, context _: Context) {}

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  class Coordinator: PHPickerViewControllerDelegate {
    let parent: PHPicker

    init(_ parent: PHPicker) {
      self.parent = parent
    }

    func picker(_: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
      for image in results {
        image.itemProvider.loadObject(ofClass: UIImage.self) { selectedImage, error in
          if let error = error {
            print(error.localizedDescription)
            return
          }

          guard let uiImage = selectedImage as? UIImage else {
            print("unable to unwrap image as UIImage")
            return
          }

          print(uiImage)
          self.parent.completion(uiImage)
        }
      }

      parent.presentationMode.wrappedValue.dismiss()
    }
  }
}
