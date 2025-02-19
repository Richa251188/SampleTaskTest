import SwiftUI

@main
struct SampleTaskTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: CitiesViewModel())
        }
    }
}
