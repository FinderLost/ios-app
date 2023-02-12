//
//  ImageLoader.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/2/23.
//

import Combine
import SwiftUI

// TODO: - Improve or think of a second round
public class ImageLoader: ObservableObject {
    @Published public var image: UIImage?

    private var cancellable: AnyCancellable?
    
    public init() { }

    public func load(url: URL?, placeHolder: UIImage) {
        guard let imageURL = url else { return }
        cancellable = URLSession.shared.dataTaskPublisher(for: imageURL)
            .map(\.data)
            .compactMap(UIImage.init)
            .replaceError(with: placeHolder)
            .assign(to: \.image, on: self)
    }
}
