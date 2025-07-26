import Foundation

class CacheService {
    private let userDefaults = UserDefaults.standard
    private let favoritesKey = "favoriteContents"
    private let contentsKey = "cachedContents"
    
    // MARK: - Favorite Contents
    
    func saveFavoriteContents(_ contents: [Content]) {
        do {
            let data = try JSONEncoder().encode(contents)
            userDefaults.set(data, forKey: favoritesKey)
        } catch {
            print("Error saving favorite contents: \(error)")
        }
    }
    
    func loadFavoriteContents() -> [Content] {
        guard let data = userDefaults.data(forKey: favoritesKey) else {
            return []
        }
        
        do {
            return try JSONDecoder().decode([Content].self, from: data)
        } catch {
            print("Error loading favorite contents: \(error)")
            return []
        }
    }
    
    // MARK: - Content Caching
    
    func saveContent(_ content: Content) {
        var cachedContents = loadCachedContents()
        
        // Remove existing content with same ID
        cachedContents.removeAll { $0.id == content.id }
        
        // Add new content
        cachedContents.append(content)
        
        // Keep only last 50 contents to manage storage
        if cachedContents.count > 50 {
            cachedContents = Array(cachedContents.suffix(50))
        }
        
        do {
            let data = try JSONEncoder().encode(cachedContents)
            userDefaults.set(data, forKey: contentsKey)
        } catch {
            print("Error saving cached content: \(error)")
        }
    }
    
    func loadCachedContents() -> [Content] {
        guard let data = userDefaults.data(forKey: contentsKey) else {
            return []
        }
        
        do {
            return try JSONDecoder().decode([Content].self, from: data)
        } catch {
            print("Error loading cached contents: \(error)")
            return []
        }
    }
    
    func getCachedContent(
        educationLevel: EducationLevel,
        grade: Int,
        subject: Subject,
        topic: Topic,
        contentType: Content.ContentType
    ) -> Content? {
        let cachedContents = loadCachedContents()
        
        return cachedContents.first { content in
            content.educationLevel == educationLevel.rawValue &&
            content.grade == grade &&
            content.subject == subject.rawValue &&
            content.topic == topic.title &&
            content.type == contentType
        }
    }
    
    func clearCache() {
        userDefaults.removeObject(forKey: contentsKey)
        userDefaults.removeObject(forKey: favoritesKey)
    }
    
    // MARK: - Settings
    
    func saveAppSettings(_ settings: AppSettings) {
        do {
            let data = try JSONEncoder().encode(settings)
            userDefaults.set(data, forKey: "appSettings")
        } catch {
            print("Error saving app settings: \(error)")
        }
    }
    
    func loadAppSettings() -> AppSettings {
        guard let data = userDefaults.data(forKey: "appSettings") else {
            return AppSettings() // Default settings
        }
        
        do {
            return try JSONDecoder().decode(AppSettings.self, from: data)
        } catch {
            print("Error loading app settings: \(error)")
            return AppSettings() // Default settings
        }
    }
}

// MARK: - App Settings Model

struct AppSettings: Codable {
    var isDarkModeEnabled: Bool = false
    var fontSize: FontSize = .medium
    var isNotificationsEnabled: Bool = true
    var preferredLanguage: String = "tr"
    var autoSaveEnabled: Bool = true
    
    enum FontSize: String, CaseIterable, Codable {
        case small = "Küçük"
        case medium = "Orta"
        case large = "Büyük"
        
        var scale: CGFloat {
            switch self {
            case .small: return 0.9
            case .medium: return 1.0
            case .large: return 1.1
            }
        }
    }
} 