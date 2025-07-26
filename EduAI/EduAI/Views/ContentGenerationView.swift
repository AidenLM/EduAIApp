import SwiftUI

struct ContentGenerationView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    @StateObject private var networkService = NetworkService()
    @State private var showShareSheet = false
    @State private var showAPIKeyAlert = false
    @State private var showNetworkAlert = false
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                loadingView
            } else if let content = viewModel.generatedContent {
                contentView(content)
            } else {
                generateContentView
            }
        }
        .onAppear {
            print("📱 ContentGenerationView onAppear")
            viewModel.selectContentType(.explanation)
            print("✅ ContentType seçildi: \(viewModel.selectedContentType?.rawValue ?? "nil")")
        }
        .navigationTitle("Konu Anlatımı")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if viewModel.generatedContent != nil {
                    Button(action: { showShareSheet = true }) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
        .sheet(isPresented: $showShareSheet) {
            if let content = viewModel.generatedContent {
                ShareSheet(content: content)
            }
        }
        .alert("Hata", isPresented: .constant(viewModel.errorMessage != nil)) {
            Button("Tamam") {
                viewModel.errorMessage = nil
            }
        } message: {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            }
        }
        .alert("API Key Gerekli", isPresented: $showAPIKeyAlert) {
            Button("Tamam") {
                showAPIKeyAlert = false
            }
        } message: {
            Text("Gemini API key'i ayarlanmamış. Lütfen API key'inizi ayarlayın.")
        }
        .alert("İnternet Bağlantısı", isPresented: $showNetworkAlert) {
            Button("Tamam") {
                showNetworkAlert = false
            }
        } message: {
            Text("İçerik oluşturmak için internet bağlantısı gereklidir. Lütfen bağlantınızı kontrol edin.")
        }
    }
    
    private var generateContentView: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Header
                VStack(spacing: 16) {
                    Image(systemName: "doc.text.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    Text("AI İçerik Oluştur")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Seçtiğiniz konu için AI destekli detaylı anlatım hazırlayalım")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                // Selection Summary
                selectionSummary
                
                // Network Status
                if !networkService.isConnected {
                    networkWarningView
                }
                
                // Generate Button
                Button(action: {
                    print("🔥 İçerik Oluştur butonuna basıldı!")
                    print("🌐 Network durumu: \(networkService.isConnected)")
                    print("🎯 CanGenerate: \(viewModel.canGenerateContent)")
                    
                    if networkService.isConnected {
                        Task {
                            print("📱 generateContent() çağrılıyor...")
                            await viewModel.generateContent()
                        }
                    } else {
                        print("❌ Network bağlantısı yok!")
                        showNetworkAlert = true
                    }
                }) {
                    HStack {
                        if networkService.isConnected {
                            Text("✨ İçerik Oluştur")
                        } else {
                            Text("📶 İnternet Bağlantısı Gerekli")
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(
                        LinearGradient(
                            colors: networkService.isConnected ? [.blue, .purple] : [.gray, .gray],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .disabled(!viewModel.canGenerateContent || !networkService.isConnected)
                .opacity((viewModel.canGenerateContent && networkService.isConnected) ? 1.0 : 0.6)
                
                Spacer()
            }
            .padding()
        }
    }
    
    private var selectionSummary: some View {
        VStack(spacing: 16) {
            Text("Seçimleriniz")
                .font(.headline)
                .fontWeight(.semibold)
            
            VStack(spacing: 12) {
                if let educationLevel = viewModel.selectedEducationLevel {
                    SummaryRow(title: "Eğitim Seviyesi", value: educationLevel.rawValue, icon: "graduationcap.fill")
                }
                
                if let grade = viewModel.selectedGrade {
                    SummaryRow(title: "Sınıf", value: "\(grade). Sınıf", icon: "number.circle.fill")
                }
                
                if let subject = viewModel.selectedSubject {
                    SummaryRow(title: "Ders", value: subject.rawValue, icon: subject.icon)
                }
                
                if let topic = viewModel.selectedTopic {
                    SummaryRow(title: "Konu", value: topic.title, icon: "lightbulb.fill")
                }
            }
            .padding()
            .background(Color(UIColor.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
    
    private var loadingView: some View {
        VStack(spacing: 20) {
            Text("🤖")
                .font(.largeTitle)
                .scaleEffect(1.5)
            
            Text("AI içerik oluşturuyor...")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("Bu işlem birkaç saniye sürebilir")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func contentView(_ content: Content) -> some View {
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
                        Text(content.subject)
                            .font(.subheadline)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.blue.opacity(0.2))
                            .clipShape(Capsule())
                        
                        Text(content.topic)
                            .font(.subheadline)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.green.opacity(0.2))
                            .clipShape(Capsule())
                        
                        Spacer()
                    }
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
    }
    
    private var networkWarningView: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                Image(systemName: "wifi.slash")
                    .font(.title2)
                    .foregroundColor(.orange)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("İnternet Bağlantısı Yok")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text("AI içerik oluşturmak için internet bağlantısı gereklidir")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            
            HStack {
                Text("Bağlantı Durumu: \(networkService.connectionType.description)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button(action: {
                    // Refresh network status
                    Task {
                        await networkService.testInternetConnection()
                    }
                }) {
                    Image(systemName: "arrow.clockwise")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
            }
        }
        .padding()
        .background(Color.orange.opacity(0.1))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.orange.opacity(0.3), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct SummaryRow: View {
    let title: String
    let value: String
    let icon: String
    
    var body: some View {
        HStack {
            Text(emojiForIcon(icon))
                .font(.system(size: 16))
                .frame(width: 20)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(value)
                .font(.subheadline)
                .fontWeight(.medium)
        }
    }
    
    private func emojiForIcon(_ icon: String) -> String {
        switch icon {
        case "graduationcap.fill": return "🎓"
        case "number.circle.fill": return "🔢"
        case "lightbulb.fill": return "💡"
        case "list.number": return "📝"
        case "clock": return "⏰"
        case "📚": return "📚"
        case "🧮": return "🧮"
        case "⚗️": return "⚗️"
        case "🧬": return "🧬"
        case "📖": return "📖"
        case "🏛️": return "🏛️"
        default: return "📌"
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let content: Content
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let text = "\(content.title)\n\n\(content.content)"
        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        return activityViewController
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

#Preview {
    NavigationView {
        ContentGenerationView()
            .environmentObject(ContentViewModel())
    }
} 