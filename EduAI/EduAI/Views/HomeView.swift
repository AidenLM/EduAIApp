import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    @State private var showingSettings = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    headerSection
                    
                    // Education Level Selection
                    educationLevelSection
                    
                    // Recent Content
                    if !viewModel.favoriteContents.isEmpty {
                        favoriteContentSection
                    }
                    
                    Spacer(minLength: 100)
                }
                .padding()
            }
            .navigationTitle("EduAI")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingSettings = true }) {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.primary)
                    }
                }
            }
            .sheet(isPresented: $showingSettings) {
                SettingsView()
            }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "brain.head.profile")
                .font(.system(size: 60))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("AI Destekli Eğitim")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            
            Text("Kişiselleştirilmiş öğrenme deneyimi için eğitim seviyenizi seçin")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding(.vertical, 20)
    }
    
    private var educationLevelSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Eğitim Seviyesi Seçin")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), spacing: 16) {
                ForEach(EducationLevel.allCases) { level in
                    NavigationLink(destination: GradeSelectionView(educationLevel: level)
                        .environmentObject(viewModel)) {
                        EducationLevelCard(level: level)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal)
        }
    }
    
    private var favoriteContentSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Favori İçerikler")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Spacer()
                
                NavigationLink("Tümünü Gör", destination: FavoritesView()
                    .environmentObject(viewModel))
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(Array(viewModel.favoriteContents.prefix(5))) { content in
                        FavoriteContentCard(content: content)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct EducationLevelCard: View {
    let level: EducationLevel
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: level.icon)
                .font(.system(size: 32))
                .foregroundColor(Color(level.color))
            
            Text(level.rawValue)
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            Text("\(level.grades.first!).-\(level.grades.last!). Sınıf")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(UIColor.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(level.color).opacity(0.3), lineWidth: 1)
        )
        .overlay(
            // MEB Onay Tick'i - Sadece lise için
            Group {
                if level == .highSchool {
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .background(
                                    Circle()
                                        .fill(Color.green)
                                        .frame(width: 24, height: 24)
                                )
                                .offset(x: -8, y: 8)
                        }
                        Spacer()
                    }
                }
            }
        )
    }
}

struct FavoriteContentCard: View {
    let content: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: content.type.icon)
                    .foregroundColor(Color(content.type.color))
                
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Text(content.title)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2)
            
            Text(content.subject)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text(content.topic)
                .font(.caption2)
                .foregroundColor(.secondary)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
                .background(Color(UIColor.systemGray5))
                .clipShape(Capsule())
        }
        .padding(12)
        .frame(width: 160, height: 120)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(UIColor.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 1)
        )
    }
}

#Preview {
    HomeView()
        .environmentObject(ContentViewModel())
} 