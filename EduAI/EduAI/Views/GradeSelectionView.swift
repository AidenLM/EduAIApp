import SwiftUI

struct GradeSelectionView: View {
    let educationLevel: EducationLevel
    @EnvironmentObject var viewModel: ContentViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                headerSection
                
                // Grade Selection
                gradeSelectionSection
                
                Spacer(minLength: 50)
            }
            .padding()
        }
        .navigationTitle(educationLevel.rawValue)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.selectEducationLevel(educationLevel)
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: educationLevel.icon)
                .font(.system(size: 50))
                .foregroundColor(Color(educationLevel.color))
            
            Text("Sınıf Seçimi")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("\(educationLevel.rawValue) seviyesinde hangi sınıftasınız?")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            // MEB Uygunluk Badge'i - Sadece lise için göster
            if educationLevel == .highSchool {
                mebComplianceBadge
            }
        }
        .padding(.vertical, 20)
    }
    
    private var mebComplianceBadge: some View {
        HStack(spacing: 8) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 16))
                .foregroundColor(.green)
            
            Text("MEB Müfredatına Uygundur")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.primary)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            Capsule()
                .fill(Color.green.opacity(0.1))
                .overlay(
                    Capsule()
                        .stroke(Color.green.opacity(0.3), lineWidth: 1)
                )
        )
        .animation(.easeInOut(duration: 0.3), value: educationLevel == .highSchool)
    }
    
    private var gradeSelectionSection: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), spacing: 16) {
            ForEach(educationLevel.grades, id: \.self) { grade in
                NavigationLink(destination: SubjectSelectionView(grade: grade)
                    .environmentObject(viewModel)) {
                    GradeCard(
                        grade: grade,
                        educationLevel: educationLevel,
                        isSelected: viewModel.selectedGrade == grade
                    )
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct GradeCard: View {
    let grade: Int
    let educationLevel: EducationLevel
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(grade)")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(isSelected ? .white : Color(educationLevel.color))
            
            Text("Sınıf")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(isSelected ? .white : .primary)
            
            if educationLevel == .university {
                Text("(\(grade). Yıl)")
                    .font(.caption)
                    .foregroundColor(isSelected ? .white.opacity(0.8) : .secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(isSelected ? Color(educationLevel.color) : Color(UIColor.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    isSelected ? Color.clear : Color(educationLevel.color).opacity(0.3),
                    lineWidth: 1
                )
        )
        .scaleEffect(isSelected ? 1.05 : 1.0)
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}

#Preview {
    NavigationView {
        GradeSelectionView(educationLevel: .highSchool)
            .environmentObject(ContentViewModel())
    }
} 