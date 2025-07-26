import Foundation

struct Topic: Identifiable, Codable, Hashable {
    let id: String
    let title: String
    let difficulty: Difficulty
    
    enum Difficulty: String, CaseIterable, Codable {
        case easy = "Kolay"
        case medium = "Orta"
        case hard = "Zor"
        
        var color: String {
            switch self {
            case .easy:
                return "green"
            case .medium:
                return "orange"
            case .hard:
                return "red"
            }
        }
        
        var icon: String {
            switch self {
            case .easy:
                return "1.circle.fill"
            case .medium:
                return "2.circle.fill"
            case .hard:
                return "3.circle.fill"
            }
        }
    }
} 