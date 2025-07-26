import Foundation
import SwiftUI

@MainActor
class TestViewModel: ObservableObject {
    @Published var testQuestions: [TestQuestion] = []
    @Published var currentQuestionIndex = 0
    @Published var isTestCompleted = false
    @Published var showResults = false
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let geminiService = GeminiAPIService()
    
    // MARK: - Test Management
    
    func generateTest(
        educationLevel: EducationLevel,
        grade: Int,
        subject: Subject,
        topic: Topic,
        questionCount: Int = 10
    ) async {
        print("🧠 TestViewModel.generateTest() başladı")
        print("📝 Konu: \(topic.title)")
        print("📊 Soru sayısı: \(questionCount)")
        
        isLoading = true
        errorMessage = nil
        
        do {
            let questions = try await geminiService.generateTestQuestions(
                educationLevel: educationLevel,
                grade: grade,
                subject: subject,
                topic: topic,
                questionCount: questionCount
            )
            
            testQuestions = questions
            currentQuestionIndex = 0
            isTestCompleted = false
            showResults = false
            
        } catch {
            print("❌ TestViewModel hata: \(error)")
            print("❌ Error type: \(type(of: error))")
            errorMessage = "Test soruları oluşturulurken hata oluştu: \(error.localizedDescription)"
        }
        
        print("🏁 TestViewModel.generateTest() tamamlandı")
        isLoading = false
    }
    
    func answerQuestion(at index: Int, with answer: Int) {
        guard index < testQuestions.count else { return }
        
        testQuestions[index].userAnswer = answer
        testQuestions[index].isAnswered = true
        
        // Auto advance to next question
        if index < testQuestions.count - 1 {
            currentQuestionIndex = index + 1
        } else {
            isTestCompleted = true
        }
    }
    
    func nextQuestion() {
        if currentQuestionIndex < testQuestions.count - 1 {
            currentQuestionIndex += 1
        }
    }
    
    func previousQuestion() {
        if currentQuestionIndex > 0 {
            currentQuestionIndex -= 1
        }
    }
    
    func goToQuestion(at index: Int) {
        if index >= 0 && index < testQuestions.count {
            currentQuestionIndex = index
        }
    }
    
    func showTestResults() {
        showResults = true
    }
    
    func resetTest() {
        testQuestions = []
        currentQuestionIndex = 0
        isTestCompleted = false
        showResults = false
        errorMessage = nil
    }
    
    // MARK: - Computed Properties
    
    var currentQuestion: TestQuestion? {
        guard currentQuestionIndex < testQuestions.count else { return nil }
        return testQuestions[currentQuestionIndex]
    }
    
    var progress: Double {
        guard !testQuestions.isEmpty else { return 0 }
        let answeredCount = testQuestions.filter { $0.isAnswered }.count
        return Double(answeredCount) / Double(testQuestions.count)
    }
    
    var correctAnswersCount: Int {
        testQuestions.filter { $0.isCorrect }.count
    }
    
    var totalQuestionsCount: Int {
        testQuestions.count
    }
    
    var scorePercentage: Int {
        guard totalQuestionsCount > 0 else { return 0 }
        return Int((Double(correctAnswersCount) / Double(totalQuestionsCount)) * 100)
    }
    
    var scoreGrade: String {
        switch scorePercentage {
        case 90...100:
            return "Mükemmel!"
        case 80..<90:
            return "Çok İyi!"
        case 70..<80:
            return "İyi"
        case 60..<70:
            return "Orta"
        case 50..<60:
            return "Geçer"
        default:
            return "Daha Çok Çalışmalısın"
        }
    }
    
    var allQuestionsAnswered: Bool {
        !testQuestions.isEmpty && testQuestions.allSatisfy { $0.isAnswered }
    }
    
    var canShowResults: Bool {
        isTestCompleted || allQuestionsAnswered
    }
} 