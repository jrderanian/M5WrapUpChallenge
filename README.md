#  SearchBar

struct ContentView: View {
    // 1.
    let countries = ["Afghanistan", "Albania", "Algeria", "Angola", "Argentia", "Armenia", "Australia", "Austria"]
    // 2.
    @State private var searchString = ""
    
    var body: some View {
        NavigationView {
            List {
              // 3.   
              ForEach(searchString == "" ? countries: countries.filter { $0.contains(searchString)}, id: \.self) { country in
                    Text(country)
                }
                .navigationTitle("Countries")
            }
          // 4.          
          .searchable(text: $searchString)
        }
    }
}

