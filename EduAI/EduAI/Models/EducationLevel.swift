import Foundation

enum EducationLevel: String, CaseIterable, Identifiable {
    case elementary = "İlkokul"
    case middleSchool = "Ortaokul"
    case highSchool = "Lise"
    case university = "Üniversite"
    
    var id: String { self.rawValue }
    
    var grades: [Int] {
        switch self {
        case .elementary:
            return [1, 2, 3, 4]
        case .middleSchool:
            return [5, 6, 7, 8]
        case .highSchool:
            return [9, 10, 11, 12]
        case .university:
            return [1, 2, 3, 4]
        }
    }
    
    var icon: String {
        switch self {
        case .elementary:
            return "graduationcap.fill"
        case .middleSchool:
            return "book.fill"
        case .highSchool:
            return "studentdesk"
        case .university:
            return "building.columns.fill"
        }
    }
    
    var color: String {
        switch self {
        case .elementary:
            return "blue"
        case .middleSchool:
            return "green"
        case .highSchool:
            return "orange"
        case .university:
            return "purple"
        }
    }
} 