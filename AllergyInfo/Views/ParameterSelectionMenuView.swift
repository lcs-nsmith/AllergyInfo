//
//  ParameterSelectionMenuView.swift
//  AllergyInfo
//
//  Created by Nathan Smith on 2022-05-11.
//

import SwiftUI

struct ParameterSelectionMenuView: View {
    
    @Binding var isParameterMenuShowing: Bool
    
    var body: some View {
        NavigationView {
        Text("nil")
        }
        .toolbar {
                        ToolbarItem(placement: .confirmationAction) {

                            Button(action: {

                                // Hide the view by setting the boolean back to false
                                isParameterMenuShowing = false

                            }, label: {

                                Text("Done")

                            })
                            
                        }
                    }
    }
}

struct ParameterSelectionMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ParameterSelectionMenuView(isParameterMenuShowing: .constant(true))
    }
}
