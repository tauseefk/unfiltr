import Foundation
import Compose
import ComposeUI
import SwiftUI
import PhotosUI

extension EditPhotoComponent: View {
    var pickerConfiguration: PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.filter = .images
        config.selectionLimit = 1
        return config
      }

    var body: some View {
        VStack {
            PHPicker(configuration: pickerConfiguration) { image in
                uploadImage.send(image)
            }
        }
    }
}
