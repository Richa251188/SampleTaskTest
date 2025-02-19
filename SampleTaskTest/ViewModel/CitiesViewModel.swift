import Foundation

class CitiesViewModel: ObservableObject {
    @Published var citiesList: [CitiesModel] = []
    
    func getCity() {
        if let path = Bundle.main.path(forResource: "au_cities", ofType: "json"){
            let url = URL(fileURLWithPath: path)
            
            do {
                let jsondata = try Data(contentsOf: url)
                let cities = try JSONDecoder().decode([CitiesModel].self, from: jsondata)
                citiesList = cities
                
            } catch {
                print("error")
            }
            
        } else {
            print("file not found")
        }
    }
}

