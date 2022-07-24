//
//  RemoteImageView.swift
//  AllergyInfo
//
//  Created by Nathan Smith on 2022-05-12.
//

import SwiftUI

struct RemoteImageView: View {
    
    // MARK: Stored properties
    let fromURL: URL
    
    // MARK: Computed properties
    var body: some View {
        
        // Retrieves and displays a remote image, showing a placeholder until the image has loaded
        AsyncImage(url: fromURL,
                   content: { downloadedImage in
            downloadedImage
                .resizable()
                .scaledToFill()
                .frame(width: 55, height: 45, alignment: .center)
        },
                   placeholder: {
//            Image(systemName: "square.fill")
//                .resizable()
//                .frame(width: 50, height: 45, alignment: .center)
            ProgressView()
        })
        .padding(.vertical)
        
    }
    
}

struct RemoteImageView_Previews: PreviewProvider {
    
    // Uses a website that provides a different 640x360 image each time the address is loaded
    static let example = URL(string: "https://picsum.photos/640/360")!
    
    static var previews: some View {
        RemoteImageView(fromURL: example)
    }
}
