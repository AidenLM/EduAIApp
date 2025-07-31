import Foundation

class GeminiAPIService {
    private let apiKey: String
    private let baseURL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent"
    private let networkService = NetworkService.shared
    
    init(apiKey: String = "AIzaSyCEZIEDhKyU7uAsmdXpPH33eg8af8l7YOg") {
        self.apiKey = apiKey
    }
    
    func generateContent(
        educationLevel: EducationLevel,
        grade: Int,
        subject: Subject,
        topic: Topic,
        contentType: Content.ContentType
    ) async throws -> Content {
        
        // Check API key
        guard !apiKey.isEmpty && apiKey.hasPrefix("AIza") else {
            throw APIError.noAPIKey
        }
        
        // Check internet connection
        guard networkService.isConnected else {
            throw APIError.noInternetConnection
        }
        
        print("🤖 Gemini API: İçerik oluşturma başladı...")
        print("📚 Konu: \(topic.title)")
        
        let prompt = createPrompt(
            educationLevel: educationLevel,
            grade: grade,
            subject: subject,
            topic: topic,
            contentType: contentType
        )
        
        let response = try await callGeminiAPI(prompt: prompt)
        
        print("✅ Gemini API: İçerik oluşturuldu!")
        print("📄 İçerik uzunluğu: \(response.count) karakter")
        
        return Content(
            id: UUID().uuidString,
            type: contentType,
            subject: subject.rawValue,
            topic: topic.title,
            educationLevel: educationLevel.rawValue,
            grade: grade,
            title: "\(topic.title) - \(contentType.rawValue)",
            content: response,
            createdAt: Date()
        )
    }
    
    func generateTestQuestions(
        educationLevel: EducationLevel,
        grade: Int,
        subject: Subject,
        topic: Topic,
        questionCount: Int
    ) async throws -> [TestQuestion] {
        
        // Check API key
        guard !apiKey.isEmpty && apiKey.hasPrefix("AIza") else {
            throw APIError.noAPIKey
        }
        
        // Check internet connection
        guard networkService.isConnected else {
            throw APIError.noInternetConnection
        }
        
        print("🧠 Gemini API: Test oluşturma başladı...")
        print("📝 Soru sayısı: \(questionCount)")
        
        let prompt = createTestPrompt(
            educationLevel: educationLevel,
            grade: grade,
            subject: subject,
            topic: topic,
            questionCount: questionCount
        )
        
        let response = try await callGeminiAPI(prompt: prompt)
        
        print("✅ Gemini API: Test soruları oluşturuldu!")
        print("📄 Response uzunluğu: \(response.count) karakter")
        
        return parseTestQuestions(from: response)
    }
    
    private func createPrompt(
        educationLevel: EducationLevel,
        grade: Int,
        subject: Subject,
        topic: Topic,
        contentType: Content.ContentType
    ) -> String {
        
        let basePrompt = """
        Sen bir eğitim uzmanısın. \(educationLevel.rawValue) \(grade). sınıf seviyesinde \(subject.rawValue) dersi için \(topic.title) konusunda içerik hazırla.
        """
        
        switch contentType {
        case .explanation:
            return basePrompt + """
            
            Lütfen aşağıdaki formatta detaylı bir konu anlatımı hazırla:
            
            1. **Giriş**: Konunun ne olduğu ve neden önemli olduğu
            2. **Temel Kavramlar**: Ana kavramları açıkla
            3. **Örnekler**: Günlük hayattan örnekler ver
            4. **Adım Adım Açıklama**: Konuyu adım adım açıkla
            5. **Önemli Noktalar**: Dikkat edilmesi gereken noktalar
            6. **Özet**: Konunun kısa özeti
            
            Dil: Türkçe
            Seviye: \(educationLevel.rawValue) \(grade). sınıf
            Ton: Öğrenciye hitap eden, açık ve anlaşılır
            Uzunluk: Yaklaşık 500-800 kelime
            """
            
        case .test:
            return basePrompt + """
            
            Bu konu için 10 adet çoktan seçmeli test sorusu hazırla.
            Her soru için 4 seçenek (A, B, C, D) olsun.
            Soruların zorluk seviyesi \(topic.difficulty.rawValue) olsun.
            
            Format:
            SORU 1: [Soru metni]
            A) [Seçenek A]
            B) [Seçenek B]
            C) [Seçenek C]
            D) [Seçenek D]
            CEVAP: [Doğru seçenek harfi]
            AÇIKLAMA: [Çözüm açıklaması]
            
            [Diğer sorular aynı formatta...]
            """
        }
    }
    
    private func createTestPrompt(
        educationLevel: EducationLevel,
        grade: Int,
        subject: Subject,
        topic: Topic,
        questionCount: Int
    ) -> String {
        print("📝 Test prompt oluşturuluyor...")
        print("📚 Konu: \(topic.title)")
        print("📊 Seviye: \(educationLevel.rawValue) \(grade). sınıf")
        print("🎯 Soru sayısı: \(questionCount)")
        
        return """
        Sen bir eğitim uzmanısın. \(educationLevel.rawValue) \(grade). sınıf seviyesinde \(subject.rawValue) dersi için \(topic.title) konusunda \(questionCount) adet çoktan seçmeli test sorusu hazırla.
        
        Her soru için 4 seçenek (A, B, C, D) olsun.
        Soruların zorluk seviyesi \(topic.difficulty.rawValue) olsun.
        
        Lütfen şu formatı TAM OLARAK takip et:
        
        SORU 1: [Soru metni]
        A) [Seçenek A]
        B) [Seçenek B]
        C) [Seçenek C]
        D) [Seçenek D]
        CEVAP: [A/B/C/D]
        AÇIKLAMA: [Çözüm açıklaması]
        
        SORU 2: [Soru metni]
        A) [Seçenek A]
        B) [Seçenek B]
        C) [Seçenek C]
        D) [Seçenek D]
        CEVAP: [A/B/C/D]
        AÇIKLAMA: [Çözüm açıklaması]
        
        Bu formatı kesinlikle değiştirme. Her sorudan sonra boş satır bırak.
        """
    }
    
    private func callGeminiAPI(prompt: String) async throws -> String {
        guard let url = URL(string: "\(baseURL)?key=\(apiKey)") else {
            throw APIError.invalidURL
        }
        
        let requestBody: [String: Any] = [
            "contents": [
                [
                    "parts": [
                        ["text": prompt]
                    ]
                ]
            ]
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
        
        print("🌐 API Çağrısı başlıyor...")
        print("🔗 URL: \(url)")
        print("📝 Prompt uzunluğu: \(prompt.count) karakter")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        print("📡 API Response alındı!")
        print("📊 Data boyutu: \(data.count) bytes")
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            print("❌ HTTP Error: \((response as? HTTPURLResponse)?.statusCode ?? 0)")
            throw APIError.serverError
        }
        
        let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        guard let candidates = jsonResponse?["candidates"] as? [[String: Any]],
              let firstCandidate = candidates.first,
              let content = firstCandidate["content"] as? [String: Any],
              let parts = content["parts"] as? [[String: Any]],
              let firstPart = parts.first,
              let text = firstPart["text"] as? String else {
            print("❌ JSON Parse hatası - response format beklenen gibi değil")
            throw APIError.invalidResponse
        }
        
        print("✅ JSON Parse başarılı!")
        return text
    }
    
    private func parseTestQuestions(from response: String) -> [TestQuestion] {
        print("🔍 parseTestQuestions başladı")
        print("📄 Response uzunluğu: \(response.count) karakter")
        print("📄 Response ilk 300 karakter:")
        print(String(response.prefix(300)))
        
        // JSON formatını parse et
        guard let data = response.data(using: .utf8),
              let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let questionsArray = json["questions"] as? [[String: Any]] else {
            
            print("⚠️ JSON parse başarısız, manuel parse'a geçiliyor...")
            // JSON parse edilemezse, manuel parsing dene
            return parseTestQuestionsManually(from: response)
        }
        
        var questions: [TestQuestion] = []
        
        for (index, questionData) in questionsArray.enumerated() {
            guard let questionText = questionData["question"] as? String,
                  let options = questionData["options"] as? [String],
                  let correctAnswer = questionData["correctAnswer"] as? Int,
                  let explanation = questionData["explanation"] as? String else {
                continue
            }
            
            let question = TestQuestion(
                id: "question_\(index)",
                question: questionText,
                options: options,
                correctAnswer: correctAnswer,
                explanation: explanation
            )
            
            questions.append(question)
        }
        
        return questions
    }
    
    private func parseTestQuestionsManually(from response: String) -> [TestQuestion] {
        print("🔧 parseTestQuestionsManually başladı")
        // Fallback manual parsing
        var questions: [TestQuestion] = []
        let lines = response.components(separatedBy: .newlines)
        print("📝 Toplam satır sayısı: \(lines.count)")
        
        var currentQuestion: String?
        var currentOptions: [String] = []
        var currentCorrectAnswer: Int?
        var currentExplanation: String?
        var questionIndex = 0
        
        for line in lines {
            let trimmedLine = line.trimmingCharacters(in: .whitespaces)
            
            if trimmedLine.starts(with: "SORU") && trimmedLine.contains(":") {
                print("📝 Yeni soru bulundu: \(trimmedLine.prefix(50))...")
                
                // Önceki soruyu kaydet
                if let question = currentQuestion,
                   currentOptions.count == 4,
                   let correctAnswer = currentCorrectAnswer,
                   let explanation = currentExplanation {
                    print("✅ Soru \(questionIndex + 1) kaydedildi")
                    
                    let testQuestion = TestQuestion(
                        id: "question_\(questionIndex)",
                        question: question,
                        options: currentOptions,
                        correctAnswer: correctAnswer,
                        explanation: explanation
                    )
                    questions.append(testQuestion)
                    questionIndex += 1
                }
                
                // Yeni soru başlat
                currentQuestion = String(trimmedLine.split(separator: ":").dropFirst().joined(separator: ":")).trimmingCharacters(in: .whitespaces)
                currentOptions = []
                currentCorrectAnswer = nil
                currentExplanation = nil
                
            } else if trimmedLine.starts(with: "A)") || trimmedLine.starts(with: "B)") || trimmedLine.starts(with: "C)") || trimmedLine.starts(with: "D)") {
                let option = String(trimmedLine.dropFirst(2)).trimmingCharacters(in: .whitespaces)
                currentOptions.append(option)
                print("🔤 Seçenek eklendi: \(trimmedLine.prefix(1)) -> \(option.prefix(30))...")
                
            } else if trimmedLine.starts(with: "CEVAP:") {
                let answerLetter = trimmedLine.replacingOccurrences(of: "CEVAP:", with: "").trimmingCharacters(in: .whitespaces)
                print("🔤 Cevap harfi bulundu: '\(answerLetter)'")
                switch answerLetter.uppercased() {
                case "A": currentCorrectAnswer = 0
                case "B": currentCorrectAnswer = 1
                case "C": currentCorrectAnswer = 2
                case "D": currentCorrectAnswer = 3
                default: 
                    print("⚠️ Bilinmeyen cevap harfi: '\(answerLetter)'")
                    break
                }
                
            } else if trimmedLine.starts(with: "AÇIKLAMA:") {
                currentExplanation = String(trimmedLine.split(separator: ":").dropFirst().joined(separator: ":")).trimmingCharacters(in: .whitespaces)
                print("📖 Açıklama bulundu: \(currentExplanation?.prefix(50) ?? "nil")...")
            }
        }
        
        // Son soruyu kaydet
        if let question = currentQuestion,
           currentOptions.count == 4,
           let correctAnswer = currentCorrectAnswer,
           let explanation = currentExplanation {
            
            let testQuestion = TestQuestion(
                id: "question_\(questionIndex)",
                question: question,
                options: currentOptions,
                correctAnswer: correctAnswer,
                explanation: explanation
            )
            questions.append(testQuestion)
        }
        
        print("✅ Manual parse tamamlandı!")
        print("📊 Parse edilen soru sayısı: \(questions.count)")
        
        return questions
    }
}

enum APIError: Error, LocalizedError {
    case invalidURL
    //updated
    case serverError
    case invalidResponse
    case noAPIKey
    case noInternetConnection
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Geçersiz URL"
        case .serverError:
            return "Sunucu hatası"
        case .invalidResponse:
            return "Geçersiz yanıt"
        case .noAPIKey:
            return "API anahtarı bulunamadı"
        case .noInternetConnection:
            return "İnternet bağlantısı yok"
        }
    }
} 