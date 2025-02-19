import Testing
import XCTest
@testable import SampleTaskTest

struct SampleTaskTestTests {
    var viewModel = CitiesViewModel()
    
    @Test func testGetCitiesFunction() {
        viewModel.getCity()
        XCTAssertEqual(viewModel.citiesList.count, 323)
        viewModel.citiesList.removeLast()
        XCTAssertEqual(viewModel.citiesList.count, 322)
        viewModel.citiesList.removeAll()
        XCTAssertEqual(viewModel.citiesList.count, 0)

    }

}
