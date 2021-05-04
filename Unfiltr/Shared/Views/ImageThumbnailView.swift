import SwiftUI

struct ImageThumbnailView: View {
    var url: URL? = nil
    var contentMode: ContentMode = .fill
    @State var image: UIImage? = nil

    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: contentMode)
        } else {
            Color.gray
                .overlay(
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                )
                .onAppear {
                    guard let imageUrl = url else { return }
                    getImageFromUrl(url: imageUrl) { (image) in
                        if image != nil {
                            self.image = image
                        }
                    }
                }
        }
    }

    func getImageFromUrl(url: URL, completion: @escaping ((_ image: UIImage?)->Void)) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            }
            DispatchQueue.main.async {
                completion(nil)
            }
        }
    }
}


struct ImageThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        ImageThumbnailView()
    }
}
