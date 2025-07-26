import SwiftUI

struct TopicSelectionView: View {
    let subject: Subject
    @EnvironmentObject var viewModel: ContentViewModel
    @State private var animateTopics = false
    
    private var availableTopics: [Topic] {
        guard let educationLevel = viewModel.selectedEducationLevel,
              let grade = viewModel.selectedGrade else {
            return []
        }
        return subject.getTopics(for: educationLevel, grade: grade)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                headerSection
                
                // Topic Selection
                topicSelectionSection
                
                Spacer(minLength: 50)
            }
            .padding()
        }
        .navigationTitle(subject.rawValue)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.selectSubject(subject)
            withAnimation(.easeInOut(duration: 0.8).delay(0.3)) {
                animateTopics = true
            }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: subject.icon)
                .font(.system(size: 50))
                .foregroundColor(Color(subject.color))
            
            Text("Konu Seçimi")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("\(subject.rawValue) dersinde hangi konuyu çalışmak istiyorsunuz?")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical, 20)
    }
    
    @ViewBuilder
    private var topicSelectionSection: some View {
        if availableTopics.isEmpty {
            VStack(spacing: 16) {
                Image(systemName: "exclamationmark.triangle")
                    .font(.system(size: 50))
                    .foregroundColor(.orange)
                
                Text("Konu Bulunamadı")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Bu seviye ve sınıf için henüz konu eklenmemiş.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                
                Text("Debug: Level=\(viewModel.selectedEducationLevel?.rawValue ?? "nil"), Grade=\(viewModel.selectedGrade ?? -1), Subject=\(subject.rawValue)")
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
            .padding()
        } else {
            LazyVStack(spacing: 12) {
                ForEach(Array(availableTopics.enumerated()), id: \.element) { index, topic in
                    NavigationLink(destination: ContentTypeSelectionView(topic: topic)
                        .environmentObject(viewModel)) {
                        TopicCard(
                            topic: topic,
                            subject: subject,
                            isSelected: viewModel.selectedTopic?.id == topic.id
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    .opacity(animateTopics ? 1 : 0)
                    .offset(x: animateTopics ? 0 : -50)
                    .animation(
                        .easeInOut(duration: 0.6)
                        .delay(Double(index) * 0.1),
                        value: animateTopics
                    )
                }
            }
        }
    }
}

struct TopicCard: View {
    let topic: Topic
    let subject: Subject
    let isSelected: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            // Difficulty Indicator
            VStack {
                Image(systemName: topic.difficulty.icon)
                    .font(.title2)
                    .foregroundColor(isSelected ? .white : Color(topic.difficulty.color))
                
                Text(topic.difficulty.rawValue)
                    .font(.caption2)
                    .foregroundColor(isSelected ? .white.opacity(0.8) : .secondary)
            }
            
            // Topic Content
            VStack(alignment: .leading, spacing: 4) {
                Text(topic.title)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(isSelected ? .white : .primary)
                
                Text("Zorluk: \(topic.difficulty.rawValue)")
                    .font(.caption)
                    .foregroundColor(isSelected ? .white.opacity(0.8) : .secondary)
            }
            
            Spacer()
            
            // Arrow
            Image(systemName: "chevron.right")
                .font(.title3)
                .foregroundColor(isSelected ? .white : Color(subject.color))
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isSelected ? Color(subject.color) : Color(UIColor.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 1)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    isSelected ? Color.clear : Color(subject.color).opacity(0.3),
                    lineWidth: 1
                )
        )
        .scaleEffect(isSelected ? 1.02 : 1.0)
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}

#Preview {
    NavigationView {
        TopicSelectionView(subject: .mathematics)
            .environmentObject(ContentViewModel())
    }
} 