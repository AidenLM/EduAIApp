import Foundation
import SwiftUI

struct Constants {
    
    // MARK: - App Info
    static let appName = "EduAI"
    static let appVersion = "1.0.0"
    static let developer = "AI Assistant"
    
    // MARK: - API Configuration
    static let geminiAPIBaseURL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent"
    static let maxRetryAttempts = 3
    static let requestTimeout: TimeInterval = 30
    
    // MARK: - UI Constants
    static let cornerRadius: CGFloat = 12
    static let shadowRadius: CGFloat = 5
    static let animationDuration: Double = 0.3
    static let cardSpacing: CGFloat = 16
    static let sectionSpacing: CGFloat = 20
    
    // MARK: - Content Limits
    static let maxContentLength = 2000
    static let maxQuestionCount = 20
    static let defaultQuestionCount = 10
    static let maxCachedContents = 50
    
    // MARK: - Colors
    struct AppColors {
        static let primary = Color.blue
        static let secondary = Color.purple
        static let accent = Color.orange
        static let success = Color.green
        static let error = Color.red
        static let warning = Color.orange
        
        // Subject Colors
        static let mathematics = Color.blue
        static let physics = Color.red
        static let chemistry = Color.green
        static let biology = Color.mint
        static let turkish = Color.orange
        static let history = Color.brown
        
        // Education Level Colors
        static let elementary = Color.blue
        static let middleSchool = Color.green
        static let highSchool = Color.orange
        static let university = Color.purple
        
        // Difficulty Colors
        static let easy = Color.green
        static let medium = Color.orange
        static let hard = Color.red
    }
    
    // MARK: - Fonts
    struct AppFonts {
        static let title = Font.largeTitle
        static let headline = Font.headline
        static let body = Font.body
        static let caption = Font.caption
    }
    
    // MARK: - Icons
    struct AppIcons {
        static let logo = "brain.head.profile"
        static let settings = "gearshape.fill"
        static let favorite = "heart.fill"
        static let share = "square.and.arrow.up"
        static let back = "chevron.left"
        static let forward = "chevron.right"
        static let close = "xmark"
        static let check = "checkmark"
        static let error = "exclamationmark.triangle"
        static let loading = "arrow.clockwise"
    }
    
    // MARK: - User Defaults Keys
    struct UserDefaultsKeys {
        static let favoriteContents = "favoriteContents"
        static let cachedContents = "cachedContents"
        static let appSettings = "appSettings"
        static let hasSeenOnboarding = "hasSeenOnboarding"
        static let lastUsedEducationLevel = "lastUsedEducationLevel"
        static let lastUsedGrade = "lastUsedGrade"
    }
    
    // MARK: - Notification Names
    struct NotificationNames {
        static let contentGenerated = "contentGenerated"
        static let favoriteToggled = "favoriteToggled"
        static let settingsChanged = "settingsChanged"
    }
} 