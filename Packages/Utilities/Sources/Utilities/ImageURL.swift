//
//  ImageURL.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/2/23.
//

import SwiftUI

// TODO: - Improve or think of a second round
public struct ImageURL: View {
    @ObservedObject
    private var imageLoader = ImageLoader()
    private var placeHolder: UIImage

    public init(url: URL?, placeHolder: UIImage?) {
        self.placeHolder = placeHolder ?? .init()
        imageLoader.load(url: url, placeHolder: self.placeHolder)
    }

    public var body: some View {
        Image(uiImage: imageLoader.image ?? placeHolder)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
