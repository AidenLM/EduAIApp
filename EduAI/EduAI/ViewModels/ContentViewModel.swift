import Foundation
import SwiftUI

@MainActor
class ContentViewModel: ObservableObject {
    @Published var selectedEducationLevel: EducationLevel?
    @Published var selectedGrade: Int?
    @Published var selectedSubject: Subject?
    @Published var selectedTopic: Topic?
    @Published var selectedContentType: Content.ContentType?
    
    @Published var generatedContent: Content?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var favoriteContents: [Content] = []
    
    private let geminiService: GeminiAPIService
    private let cacheService = CacheService()
    
    init(apiKey: String = "AIzaSyCEZIEDhKyU7uAsmdXpPH33eg8af8l7YOg") {
        self.geminiService = GeminiAPIService(apiKey: apiKey)
        loadFavorites()
    }
    
    // MARK: - Navigation Methods
    
    func selectEducationLevel(_ level: EducationLevel) {
        selectedEducationLevel = level
        selectedGrade = nil
        selectedSubject = nil
        selectedTopic = nil
        selectedContentType = nil
        generatedContent = nil
    }
    
    func selectGrade(_ grade: Int) {
        selectedGrade = grade
        selectedSubject = nil
        selectedTopic = nil
        selectedContentType = nil
        generatedContent = nil
    }
    
    func selectSubject(_ subject: Subject) {
        selectedSubject = subject
        selectedTopic = nil
        selectedContentType = nil
        generatedContent = nil
    }
    
    func selectTopic(_ topic: Topic) {
        selectedTopic = topic
        selectedContentType = nil
        generatedContent = nil
    }
    
    func selectContentType(_ type: Content.ContentType) {
        selectedContentType = type
    }
    
    // MARK: - Content Generation
    
    func generateContent() async {
        print("🚀 ContentViewModel.generateContent() başladı")
        
        guard let educationLevel = selectedEducationLevel,
              let grade = selectedGrade,
              let subject = selectedSubject,
              let topic = selectedTopic,
              let contentType = selectedContentType else {
            print("❌ Seçimler eksik!")
            print("📊 Level: \(selectedEducationLevel?.rawValue ?? "nil")")
            print("📊 Grade: \(selectedGrade ?? 0)")
            print("📊 Subject: \(selectedSubject?.rawValue ?? "nil")")
            print("📊 Topic: \(selectedTopic?.title ?? "nil")")
            print("📊 ContentType: \(selectedContentType?.rawValue ?? "nil")")
            errorMessage = "Lütfen tüm seçimleri yapın"
            return
        }
        
        print("✅ Tüm seçimler tamam, API çağrısı yapılıyor...")
        isLoading = true
        errorMessage = nil
        
        do {
            let content = try await geminiService.generateContent(
                educationLevel: educationLevel,
                grade: grade,
                subject: subject,
                topic: topic,
                contentType: contentType
            )
            
            generatedContent = content
            cacheService.saveContent(content)
            
        } catch {
            print("❌ ContentViewModel hata: \(error)")
            print("❌ Error type: \(type(of: error))")
            errorMessage = "İçerik oluşturulurken hata oluştu: \(error.localizedDescription)"
        }
        
        print("🏁 ContentViewModel.generateContent() tamamlandı")
        isLoading = false
    }
    
    // MARK: - Favorites
    
    func toggleFavorite(for content: Content) {
        var updatedContent = content
        updatedContent.isFavorite.toggle()
        
        if updatedContent.isFavorite {
            favoriteContents.append(updatedContent)
        } else {
            favoriteContents.removeAll { $0.id == content.id }
        }
        
        // Update generated content if it matches
        if generatedContent?.id == content.id {
            generatedContent = updatedContent
        }
        
        saveFavorites()
    }
    
    private func loadFavorites() {
        favoriteContents = cacheService.loadFavoriteContents()
    }
    
    private func saveFavorites() {
        cacheService.saveFavoriteContents(favoriteContents)
    }
    
    // MARK: - Reset
    
    func reset() {
        selectedEducationLevel = nil
        selectedGrade = nil
        selectedSubject = nil
        selectedTopic = nil
        selectedContentType = nil
        generatedContent = nil
        errorMessage = nil
    }
    
    // MARK: - Computed Properties
    
    var availableTopics: [Topic] {
        guard let educationLevel = selectedEducationLevel,
              let grade = selectedGrade,
              let subject = selectedSubject else {
            return []
        }
        
        return subject.getTopics(for: educationLevel, grade: grade)
    }
    
    var canGenerateContent: Bool {
        selectedEducationLevel != nil &&
        selectedGrade != nil &&
        selectedSubject != nil &&
        selectedTopic != nil &&
        selectedContentType != nil
    }
} 