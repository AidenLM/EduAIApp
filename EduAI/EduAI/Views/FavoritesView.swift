import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    @State private var searchText = ""
    @State private var selectedFilter: ContentFilter = .all
    
    enum ContentFilter: String, CaseIterable {
        case all = "Tümü"
        case explanation = "Konu Anlatımı"
        case test = "Test Soruları"
        
        var contentType: Content.ContentType? {
            switch self {
            case .all:
                return nil
            case .explanation:
                return .explanation
            case .test:
                return .test
            }
        }
    }
    
    private var filteredContents: [Content] {
        var contents = viewModel.favoriteContents
        
        // Filter by type
        if let contentType = selectedFilter.contentType {
            contents = contents.filter { $0.type == contentType }
        }
        
        // Filter by search text
        if !searchText.isEmpty {
            contents = contents.filter { content in
                content.title.localizedCaseInsensitiveContains(searchText) ||
                content.subject.localizedCaseInsensitiveContains(searchText) ||
                content.topic.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        return contents.sorted { $0.createdAt > $1.createdAt }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Search and Filter
            VStack(spacing: 12) {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    
                    TextField("İçerik ara...", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                    
                    if !searchText.isEmpty {
                        Button(action: {
                            searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color(UIColor.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                // Filter Picker
                Picker("Filtre", selection: $selectedFilter) {
                    ForEach(ContentFilter.allCases, id: \.self) { filter in
                        Text(filter.rawValue).tag(filter)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            
            Divider()
            
            // Content List
            if filteredContents.isEmpty {
                emptyStateView
            } else {
                contentListView
            }
        }
        .navigationTitle("Favoriler")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 20) {
            Image(systemName: searchText.isEmpty ? "heart" : "magnifyingglass")
                .font(.system(size: 60))
                .foregroundColor(.secondary)
            
            Text(searchText.isEmpty ? "Henüz favori içerik yok" : "Arama sonucu bulunamadı")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            
            Text(searchText.isEmpty ? 
                 "İçerikleri beğendiğinizde burada görünecek" :
                 "Farklı anahtar kelimeler deneyin")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var contentListView: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(filteredContents) { content in
                    NavigationLink(destination: ContentDetailView(content: content)
                        .environmentObject(viewModel)) {
                        FavoriteContentRow(content: content)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
    }
}

struct FavoriteContentRow: View {
    let content: Content
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack {
                Image(systemName: content.type.icon)
                    .foregroundColor(Color(content.type.color))
                    .frame(width: 24, height: 24)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(content.title)
                        .font(.headline)
                        .fontWeight(.medium)
                        .lineLimit(2)
                    
                    Text(content.type.rawValue)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Button(action: {
                    viewModel.toggleFavorite(for: content)
                }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .font(.title3)
                }
            }
            
            // Tags
            HStack {
                TagView(text: content.subject, color: .blue)
                TagView(text: content.topic, color: .green)
                TagView(text: "\(content.educationLevel) \(content.grade). Sınıf", color: .orange)
                
                Spacer()
            }
            
            // Date
            HStack {
                Spacer()
                
                Text(content.createdAt, style: .relative)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(UIColor.systemGray4), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

struct TagView: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .font(.caption2)
            .fontWeight(.medium)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(color.opacity(0.2))
            .foregroundColor(color)
            .clipShape(Capsule())
    }
}

struct ContentDetailView: View {
    let content: Content
    @EnvironmentObject var viewModel: ContentViewModel
    @State private var showShareSheet = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: content.type.icon)
                            .foregroundColor(Color(content.type.color))
                        
                        Text(content.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.toggleFavorite(for: content)
                        }) {
                            Image(systemName: content.isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(content.isFavorite ? .red : .gray)
                                .font(.title3)
                        }
                    }
                    
                    HStack {
                        TagView(text: content.subject, color: .blue)
                        TagView(text: content.topic, color: .green)
                        TagView(text: "\(content.educationLevel) \(content.grade). Sınıf", color: .orange)
                        
                        Spacer()
                    }
                    
                    Text("Oluşturulma: \(content.createdAt.formatted(.dateTime.day().month().year().hour().minute()))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                // Content
                Text(content.content)
                    .font(.body)
                    .lineSpacing(6)
                    .textSelection(.enabled)
                
                Spacer(minLength: 50)
            }
            .padding()
        }
        .navigationTitle("İçerik Detayı")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showShareSheet = true }) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(content: content)
        }
    }
}

#Preview {
    NavigationView {
        FavoritesView()
            .environmentObject(ContentViewModel())
    }
} 