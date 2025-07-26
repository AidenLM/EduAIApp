import Foundation

enum Subject: String, CaseIterable, Identifiable {
    case mathematics = "Matematik"
    case physics = "Fizik"
    case chemistry = "Kimya"
    case biology = "Biyoloji"
    case turkish = "Türkçe"
    case history = "Tarih"
    
    var id: String { self.rawValue }
    
    var icon: String {
        switch self {
        case .mathematics:
            return "function"
        case .physics:
            return "atom"
        case .chemistry:
            return "flask.fill"
        case .biology:
            return "leaf.fill"
        case .turkish:
            return "textformat"
        case .history:
            return "clock.fill"
        }
    }
    
    var color: String {
        switch self {
        case .mathematics:
            return "blue"
        case .physics:
            return "red"
        case .chemistry:
            return "green"
        case .biology:
            return "mint"
        case .turkish:
            return "orange"
        case .history:
            return "brown"
        }
    }
    
    func getTopics(for educationLevel: EducationLevel, grade: Int) -> [Topic] {
        // Konular eğitim seviyesi ve sınıfa göre değişir
        switch self {
        case .mathematics:
            return getMathTopics(for: educationLevel, grade: grade)
        case .physics:
            return getPhysicsTopics(for: educationLevel, grade: grade)
        case .chemistry:
            return getChemistryTopics(for: educationLevel, grade: grade)
        case .biology:
            return getBiologyTopics(for: educationLevel, grade: grade)
        case .turkish:
            return getTurkishTopics(for: educationLevel, grade: grade)
        case .history:
            return getHistoryTopics(for: educationLevel, grade: grade)
        }
    }
    
    private func getMathTopics(for level: EducationLevel, grade: Int) -> [Topic] {
        switch level {
        case .elementary:
            return [
                Topic(id: "math_elem_numbers", title: "Sayılar", difficulty: .easy),
                Topic(id: "math_elem_operations", title: "Dört İşlem", difficulty: .easy),
                Topic(id: "math_elem_fractions", title: "Kesirler", difficulty: .medium),
                Topic(id: "math_elem_geometry", title: "Geometri", difficulty: .medium)
            ]
        case .middleSchool:
            return [
                Topic(id: "math_middle_algebra", title: "Cebir", difficulty: .medium),
                Topic(id: "math_middle_equations", title: "Denklemler", difficulty: .medium),
                Topic(id: "math_middle_geometry", title: "Geometri", difficulty: .medium),
                Topic(id: "math_middle_statistics", title: "İstatistik", difficulty: .hard)
            ]
        case .highSchool:
            return [
                Topic(id: "math_high_functions", title: "Fonksiyonlar", difficulty: .hard),
                Topic(id: "math_high_derivatives", title: "Türev", difficulty: .hard),
                Topic(id: "math_high_integrals", title: "İntegral", difficulty: .hard),
                Topic(id: "math_high_probability", title: "Olasılık", difficulty: .hard)
            ]
        case .university:
            return [
                Topic(id: "math_uni_calculus", title: "Analiz", difficulty: .hard),
                Topic(id: "math_uni_linear", title: "Lineer Cebir", difficulty: .hard),
                Topic(id: "math_uni_differential", title: "Diferansiyel Denklemler", difficulty: .hard)
            ]
        }
    }
    
    private func getPhysicsTopics(for level: EducationLevel, grade: Int) -> [Topic] {
        switch level {
        case .elementary:
            return [
                Topic(id: "physics_elem_matter", title: "Madde ve Özellikleri", difficulty: .easy),
                Topic(id: "physics_elem_light", title: "Işık", difficulty: .easy)
            ]
        case .middleSchool:
            return [
                Topic(id: "physics_middle_motion", title: "Hareket", difficulty: .medium),
                Topic(id: "physics_middle_force", title: "Kuvvet", difficulty: .medium),
                Topic(id: "physics_middle_energy", title: "Enerji", difficulty: .medium)
            ]
        case .highSchool:
            return [
                Topic(id: "physics_high_mechanics", title: "Mekanik", difficulty: .hard),
                Topic(id: "physics_high_waves", title: "Dalgalar", difficulty: .hard),
                Topic(id: "physics_high_electric", title: "Elektrik", difficulty: .hard)
            ]
        case .university:
            return [
                Topic(id: "physics_uni_quantum", title: "Kuantum Fiziği", difficulty: .hard),
                Topic(id: "physics_uni_relativity", title: "Görelilik", difficulty: .hard)
            ]
        }
    }
    
    // Diğer dersler için benzer metodlar...
    private func getChemistryTopics(for level: EducationLevel, grade: Int) -> [Topic] {
        return [
            Topic(id: "chem_atoms", title: "Atomlar", difficulty: .medium),
            Topic(id: "chem_molecules", title: "Moleküller", difficulty: .medium),
            Topic(id: "chem_reactions", title: "Kimyasal Tepkimeler", difficulty: .hard)
        ]
    }
    
    private func getBiologyTopics(for level: EducationLevel, grade: Int) -> [Topic] {
        return [
            Topic(id: "bio_cells", title: "Hücreler", difficulty: .medium),
            Topic(id: "bio_genetics", title: "Genetik", difficulty: .hard),
            Topic(id: "bio_evolution", title: "Evrim", difficulty: .hard)
        ]
    }
    
    private func getTurkishTopics(for level: EducationLevel, grade: Int) -> [Topic] {
        return [
            Topic(id: "turk_grammar", title: "Dilbilgisi", difficulty: .medium),
            Topic(id: "turk_literature", title: "Edebiyat", difficulty: .medium),
            Topic(id: "turk_writing", title: "Yazma", difficulty: .hard)
        ]
    }
    
    private func getHistoryTopics(for level: EducationLevel, grade: Int) -> [Topic] {
        return [
            Topic(id: "hist_ancient", title: "Antik Çağ", difficulty: .medium),
            Topic(id: "hist_ottoman", title: "Osmanlı Tarihi", difficulty: .medium),
            Topic(id: "hist_modern", title: "Modern Tarih", difficulty: .hard)
        ]
    }
} 