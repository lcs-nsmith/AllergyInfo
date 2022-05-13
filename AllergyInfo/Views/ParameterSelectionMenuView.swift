//
//  ParameterSelectionMenuView.swift
//  AllergyInfo
//
//  Created by Nathan Smith on 2022-05-11.
//

import SwiftUI

struct ParameterSelectionMenuView: View {
    // MARK: Stored Properties
    @Binding var isParameterMenuShowing: Bool
    
    // MARK: Computed Properties
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                    .padding(.top)
                
                Text("Alert for which allergies?")
                    .padding(.top)
                    .font(Font.custom("AmericanTypewriter", size: 24))
                
                Spacer()
                // list of allergens
                VStack (spacing: 18){
                    
                    // Diary
                    HStack {
                    ZStack {
                        Image(systemName: "square")
                        Image(systemName: "checkmark.square")
                            .opacity(0)
                    }
                    Text("Dairy")
                            .font(Font.custom("AmericanTypewriter", size: 18))
                    }
                    
                    // Eggs
                    HStack {
                        ZStack {
                            Image(systemName: "square")
                            Image(systemName: "checkmark.square")
                                .opacity(0)
                        }

                    Text("Eggs")
                            .font(Font.custom("AmericanTypewriter", size: 18))
                    }
                    
                    // Peanuts
                    HStack {
                        ZStack {
                            Image(systemName: "square")
                            Image(systemName: "checkmark.square")
                                .opacity(0)
                        }

                    Text("Peanuts")
                            .font(Font.custom("AmericanTypewriter", size: 18))
                    }
                    
                    // Seafood
                    HStack {
                        ZStack {
                            Image(systemName: "square")
                            Image(systemName: "checkmark.square")
                                .opacity(0)
                        }

                    Text("Seafood")
                            .font(Font.custom("AmericanTypewriter", size: 18))
                    }
                    
                    // Sesame
                    HStack {
                        ZStack {
                            Image(systemName: "square")
                            Image(systemName: "checkmark.square")
                                .opacity(0)
                        }

                    Text("Sesame")
                            .font(Font.custom("AmericanTypewriter", size: 18))
                    }
                    
                    
                    // Shellfish
                    HStack {
                        ZStack {
                            Image(systemName: "square")
                            Image(systemName: "checkmark.square")
                                .opacity(0)
                        }

                    Text("Shellfish")
                            .font(Font.custom("AmericanTypewriter", size: 18))
                    }
                    
                    // Soy
                    HStack {
                        ZStack {
                            Image(systemName: "square")
                            Image(systemName: "checkmark.square")
                                .opacity(0)
                        }

                    Text("Soy")
                            .font(Font.custom("AmericanTypewriter", size: 18))
                    }
                    
                    // Tree nuts
                    HStack {
                        ZStack {
                            Image(systemName: "square")
                            Image(systemName: "checkmark.square")
                                .opacity(0)
                        }

                    Text("Tree Nuts")
                            .font(Font.custom("AmericanTypewriter", size: 18))
                    }
                }
                Spacer(minLength: 360)
            }
        }
        .navigationBarTitle("Parameters")
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
