//
//  FontsView.swift
//  AllergyInfo
//
//  Created by Nathan Smith on 2022-05-11.
//

import SwiftUI
import UIKit

/// Displays all available fonts in a vertically scrolling view.
struct FontsView: View {
    private static let fontNames: [String] = {
        var names = [String]()
        for familyName in UIFont.familyNames {
            names.append(contentsOf: UIFont.fontNames(forFamilyName: familyName))
        }
        return names.sorted()
    }()

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                Text("This is a list of all fonts available on iOS.")
                    .padding(.bottom, 5)
                Text("To use a font, add a modifier like so, with the name of the font as it is shown in this list:")
                    .padding(.bottom, 5)
                Text(".font(Font.custom(\"Baskerville-Italic\", size: 16)")
                    .font(Font.custom("Courier-Bold", size: 11))
                    .padding(.bottom, 15)
                ForEach(FontsView.fontNames, id: \.self) { fontName in
                    Text(fontName)
                        .font(Font.custom(fontName, size: 17))
                }
            }
            .padding()
        }
        .navigationTitle("Fonts")
    }
}

struct FontsView_Previews: PreviewProvider {
    static var previews: some View {
        FontsView()
    }
}
