//
//  SearchView.swift
//  AllergyInfo
//
//  Created by Nathan Smith on 2022-05-05.
//

import SwiftUI

struct SearchView: View {
    // MARK: Stored Properties
    
    // What is being searched
    @State var searchInput: String = ""
    
    // List of Foods from ***
    @State var foodsParsed: [Food] = [] // starts the array empty
    
    // favourites list
    @Binding var favourites: [Food]
    
    // sheet for parameters
    @State var isParameterMenuShowing: Bool = false
    
    // MARK: Computed Properties
    
    private static let fontNames: [String] = {
        var names = [String]()
        for familyName in UIFont.familyNames {
            names.append(contentsOf: UIFont.fontNames(forFamilyName: familyName))
        }
        return names.sorted()
    }()
    
    var body: some View {
        NavigationView {
            
            ZStack {
                // background of page
                Color("ListColour")
                    .ignoresSafeArea()
                
                // start of page
                VStack {
                    HStack (spacing: 15){
                        Text("Allergen Finder")
                            .font(Font.custom("Didot", size: 34))
                        
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .onTapGesture(perform: {
                                isParameterMenuShowing = true
                            })
                        
                    }
                    
                    // search field
                    ZStack {
                        TextField("horse",
                                  text: $searchInput,
                                  prompt: Text("Enter the name of a food"))
                        .cornerRadius(10)
                        .background(Color("ListColour"))
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 4))
                        .foregroundColor(.primary)
                        .accentColor(.secondary)
                        .padding(.horizontal)
                        
                        HStack {
                            Spacer(minLength: 340)
                            Image(systemName: "magnifyingglass.circle")
                                .foregroundColor(Color(UIColor.systemGray2))
                            Spacer()
                        }
                    }
                    
                    // iterates list of foods being retreived
                    List(foodsParsed, id: \.id) { currentFood in
                        
                        HStack {
                            NavigationLink(destination: DetailView(food: currentFood, favourites: $favourites)) {
                                
//                                Text(currentFood.title)
//
//                                RemoteImageView(fromURL: URL(string: currentFood.image)!)
//
                                ListItemView(food: currentFood)
                            }
                        }
                    }
                    .onChange(of: searchInput) { whatWasTyped in
                        
                        // When what is typed in the search field changes,
                        // get new results from the endpoint
                        Task {
                            await retrieveFromEndpoint()
                        }

                    }
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $isParameterMenuShowing) {
                NavigationView {
                    ParameterSelectionMenuView(isParameterMenuShowing: $isParameterMenuShowing)
                }
            }
            
        }
    }
    
    // MARK: Functions
    func retrieveFromEndpoint() async {
        
        // Sanitize the search input
        // example: converts "HoRSe fOoT" to "horse+foot"
        let searchInput = searchInput.lowercased().replacingOccurrences(of: " ", with: "+")
        
//        let parameterInput = .lowercased().replacingOccurrences(of: " ", with: "+")
        
        // sets address of the endpoint
        let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=b0c4e627bdd74845afffb403be93c040&query=\(searchInput)&intolerances=peanuts+soy&number=2")!
        /// example url : b86f47806eed4ce48e7df6ab964280b1&query=pasta&intolerances=peanuts+soy&number=1
        ///apiKey #1 = b86f47806eed4ce48e7df6ab964280b1
        ///apiKey #2 = b0c4e627bdd74845afffb403be93c040
        
        // Configure a URLRequest instance
        // Defines what type of request will be sent to the address noted above
        var request = URLRequest(url: url)
        request.setValue("application/json",
                         forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        // Start a URL session to interact with the endpoint
        let urlSession = URLSession.shared

        // Fetch the results of this search
        do {
            // Get the raw data from the endpoint
            let (data, _) = try await urlSession.data(for: request)
            
            // DEBUG: See what raw JSON data was returned from the server
            print(String(data: data, encoding: .utf8)!)
            
            // Attempt to decode and return the object containing
            // the search result
            // NOTE: We decode to SearchResult.self since the endpoint
            //       returns a single JSON object
            let decodedSearchResult = try JSONDecoder().decode(SearchResult.self, from: data)
            
            // Now, we access the list of songs that are part of the decoded result
            // This is assigned to the array that will display the songs in the user interface
            foodsParsed = decodedSearchResult.results
            
        } catch {
            
            // Report about what happened
            print("Could not retrieve / decode JSON from endpoint.")
            print(error)
            
        }
    }
}




struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(favourites: .constant([testFood]))
    }
}
