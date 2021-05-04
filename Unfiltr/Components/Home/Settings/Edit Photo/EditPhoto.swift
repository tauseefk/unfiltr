import Foundation
import Compose
import SwiftUI

struct EditPhotoComponent : Component {
    @ObservedObject var store = PlainStore<State>()

    let finishImageUpload = ValueEmitter<Outcome>()
    let uploadImage = ValueEmitter<UIImage>()
}
