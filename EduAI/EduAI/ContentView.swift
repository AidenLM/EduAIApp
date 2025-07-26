import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        HomeView()
            .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
} 