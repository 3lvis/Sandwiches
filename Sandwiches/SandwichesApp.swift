import SwiftUI

@main
struct SandwichesApp: App {
    @State private var store = SandwichStore(sandwiches: testData)

    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
