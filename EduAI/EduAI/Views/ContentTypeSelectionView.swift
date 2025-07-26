import SwiftUI

struct ContentTypeSelectionView: View {
    let topic: Topic
    @EnvironmentObject var viewModel: ContentViewModel
    @State private var animateOptions = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Header
                headerSection
                
                // Content Type Selection
                contentTypeSelectionSection
                
                Spacer(minLength: 50)
            }
            .padding()
        }
        .navigationTitle(topic.title)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.selectTopic(topic)
            withAnimation(.easeInOut(duration: 0.8).delay(0.2)) {
                animateOptions = true
            }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "lightbulb.fill")
                .font(.system(size: 50))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.orange, .yellow],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("İçerik Türü Seçimi")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Ne tür içerik oluşturmak istiyorsunuz?")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical, 20)
    }
    
    private var contentTypeSelectionSection: some View {
        VStack(spacing: 20) {
            ForEach(Array(Content.ContentType.allCases.enumerated()), id: \.element) { index, contentType in
                NavigationLink(destination: destinationView(for: contentType)) {
                    ContentTypeCard(
                        contentType: contentType,
                        topic: topic,
                        isSelected: viewModel.selectedContentType == contentType
                    )
                }
                .buttonStyle(PlainButtonStyle())
                .opacity(animateOptions ? 1 : 0)
                .offset(y: animateOptions ? 0 : 30)
                .animation(
                    .easeInOut(duration: 0.6)
                    .delay(Double(index) * 0.2),
                    value: animateOptions
                )
            }
        }
    }
    
    @ViewBuilder
    private func destinationView(for contentType: Content.ContentType) -> some View {
        switch contentType {
        case .explanation:
            ContentGenerationView()
                .environmentObject(viewModel)
        case .test:
            TestGenerationView()
                .environmentObject(viewModel)
        }
    }
}

struct ContentTypeCard: View {
    let contentType: Content.ContentType
    let topic: Topic
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: contentType.icon)
                .font(.system(size: 40))
                .foregroundColor(isSelected ? .white : Color(contentType.color))
            
            VStack(spacing: 8) {
                Text(contentType.rawValue)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(isSelected ? .white : .primary)
                
                Text(contentType == .explanation ? 
                     "Konuyu detaylı şekilde açıklayalım" : 
                     "Çoktan seçmeli sorularla pratik yapalım")
                    .font(.subheadline)
                    .foregroundColor(isSelected ? .white.opacity(0.9) : .secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 140)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(isSelected ? Color(contentType.color) : Color(UIColor.systemBackground))
                .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 3)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    isSelected ? Color.clear : Color(contentType.color).opacity(0.3),
                    lineWidth: 2
                )
        )
        .scaleEffect(isSelected ? 1.03 : 1.0)
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}

#Preview {
    NavigationView {
        ContentTypeSelectionView(topic: Topic(id: "test", title: "Test Konusu", difficulty: .medium))
            .environmentObject(ContentViewModel())
    }
} 