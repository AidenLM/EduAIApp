import Foundation

struct Content: Identifiable, Codable {
    let id: String
    let type: ContentType
    let subject: String
    let topic: String
    let educationLevel: String
    let grade: Int
    let title: String
    let content: String
    let createdAt: Date
    var isFavorite: Bool = false
    
    enum ContentType: String, CaseIterable, Codable {
        case explanation = "Konu Anlatımı"
        case test = "Test Soruları"
        
        var icon: String {
            switch self {
            case .explanation:
                return "book.fill"
            case .test:
                return "questionmark.circle.fill"
            }
        }
        
        var color: String {
            switch self {
            case .explanation:
                return "blue"
            case .test:
                return "purple"
            }
        }
    }
}

struct TestQuestion: Identifiable, Codable {
    let id: String
    let question: String
    let options: [String]
    let correctAnswer: Int
    let explanation: String
    var userAnswer: Int?
    var isAnswered: Bool = false
    
    var isCorrect: Bool {
        guard let userAnswer = userAnswer else { return false }
        return userAnswer == correctAnswer
    }
} 