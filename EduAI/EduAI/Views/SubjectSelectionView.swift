import SwiftUI

struct SubjectSelectionView: View {
    let grade: Int
    @EnvironmentObject var viewModel: ContentViewModel
    @State private var animateCards = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                headerSection
                
                // Subject Selection
                subjectSelectionSection
                
                Spacer(minLength: 50)
            }
            .padding()
        }
        .navigationTitle("\(grade). Sınıf")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.selectGrade(grade)
            withAnimation(.easeInOut(duration: 0.8).delay(0.2)) {
                animateCards = true
            }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            if let educationLevel = viewModel.selectedEducationLevel {
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color(educationLevel.color), .blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            }
            
            Text("Ders Seçimi")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Hangi derste yardıma ihtiyacınız var?")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            // MEB Uygunluk Badge'i - Sadece lise için göster
            if viewModel.selectedEducationLevel == .highSchool {
                mebComplianceBadge
            }
        }
        .padding(.vertical, 20)
    }
    
    private var mebComplianceBadge: some View {
        HStack(spacing: 8) {
            Image(systemName: "graduationcap.fill")
                .font(.system(size: 16))
                .foregroundColor(.blue)
            
            Text("🏛️ MEB Müfredatına Uygun İçerik")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.primary)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            Capsule()
                .fill(Color.blue.opacity(0.1))
                .overlay(
                    Capsule()
                        .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                )
        )
        .animation(.easeInOut(duration: 0.3), value: viewModel.selectedEducationLevel == .highSchool)
    }
    
    private var subjectSelectionSection: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), spacing: 16) {
            ForEach(Array(Subject.allCases.enumerated()), id: \.element) { index, subject in
                NavigationLink(destination: TopicSelectionView(subject: subject)
                    .environmentObject(viewModel)) {
                    SubjectCard(
                        subject: subject,
                        isSelected: viewModel.selectedSubject == subject
                    )
                }
                .buttonStyle(PlainButtonStyle())
                .opacity(animateCards ? 1 : 0)
                .offset(y: animateCards ? 0 : 50)
                .animation(
                    .easeInOut(duration: 0.6)
                    .delay(Double(index) * 0.1),
                    value: animateCards
                )
            }
        }
    }
}

struct SubjectCard: View {
    let subject: Subject
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: subject.icon)
                .font(.system(size: 32))
                .foregroundColor(isSelected ? .white : Color(subject.color))
            
            Text(subject.rawValue)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(isSelected ? .white : .primary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(isSelected ? Color(subject.color) : Color(UIColor.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    isSelected ? Color.clear : Color(subject.color).opacity(0.3),
                    lineWidth: 1
                )
        )
        .scaleEffect(isSelected ? 1.05 : 1.0)
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}

#Preview {
    NavigationView {
        SubjectSelectionView(grade: 10)
            .environmentObject(ContentViewModel())
    }
} 