import SwiftUI

struct CityRow: View {
    var cityName: String =  ""
    var body: some View {
        Text(cityName)
    }
}

struct ContentView: View {
    @StateObject var viewModel = CitiesViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Australia")) {                ForEach(viewModel.citiesList, id: \.city) { item in
                    CityRow(cityName: item.city)
                }
                }
                
            }.listStyle(.grouped)
                .onTapGesture(perform: {
                    if viewModel.citiesList.isEmpty {
                        viewModel.getCity()
                    } else {
                        viewModel.citiesList.removeAll()
                    }
                })
                .navigationTitle("Cities")
                .toolbar {
                    Button {
                        // action
                        viewModel.citiesList.reverse()
                    } label: {
                        Text("Reverse")
                    }
                    Button {
                        // action
                        if viewModel.citiesList.isEmpty {
                            viewModel.getCity()
                        } else {
                            viewModel.citiesList.removeAll()
                        }
                    } label: {
                        if viewModel.citiesList.isEmpty   {
                            Text("Expand")
                        } else {
                            Text("Collapse")
                        }
                    }
                }
            
        }.onAppear(perform:{viewModel.getCity()})
            .background(colorScheme == .dark ? Color.black : Color.white)
    }
}



#Preview {
    ContentView(viewModel: CitiesViewModel())
}
