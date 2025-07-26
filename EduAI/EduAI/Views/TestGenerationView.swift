import SwiftUI

struct TestGenerationView: View {
    @EnvironmentObject var contentViewModel: ContentViewModel
    @StateObject private var testViewModel = TestViewModel()
    @StateObject private var networkService = NetworkService()
    @State private var showingResults = false
    @State private var showNetworkAlert = false
    
    var body: some View {
        ZStack {
            if testViewModel.isLoading {
                loadingView
            } else if !testViewModel.testQuestions.isEmpty {
                if testViewModel.showResults {
                    TestResultsView(testViewModel: testViewModel)
                } else {
                    TestTakingView(testViewModel: testViewModel)
                }
            } else {
                generateTestView
            }
        }
        .onAppear {
            print("📱 TestGenerationView onAppear")
            contentViewModel.selectContentType(.test)
            print("✅ ContentType seçildi: \(contentViewModel.selectedContentType?.rawValue ?? "nil")")
        }
        .navigationTitle("Test Soruları")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Hata", isPresented: .constant(testViewModel.errorMessage != nil)) {
            Button("Tamam") {
                testViewModel.errorMessage = nil
            }
        } message: {
            if let errorMessage = testViewModel.errorMessage {
                Text(errorMessage)
            }
        }
        .alert("İnternet Bağlantısı", isPresented: $showNetworkAlert) {
            Button("Tamam") {
                showNetworkAlert = false
            }
        } message: {
            Text("Test soruları oluşturmak için internet bağlantısı gereklidir. Lütfen bağlantınızı kontrol edin.")
        }
    }
    
    private var generateTestView: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Header
                VStack(spacing: 16) {
                    Image(systemName: "questionmark.circle.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.purple, .blue],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    Text("AI Test Oluştur")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Seçtiğiniz konu için AI destekli çoktan seçmeli test hazırlayalım")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                
                // MEB Uygunluk Badge'i - Sadece lise için göster
                if contentViewModel.selectedEducationLevel == .highSchool {
                    HStack(spacing: 8) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 16))
                            .foregroundColor(.green)
                        
                        Text("🧪 MEB Standartlarında Test")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.primary)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .fill(Color.green.opacity(0.1))
                            .overlay(
                                Capsule()
                                    .stroke(Color.green.opacity(0.3), lineWidth: 1)
                            )
                    )
                }
                }
                
                // Selection Summary
                selectionSummary
                
                // Network Status
                if !networkService.isConnected {
                    networkWarningView
                }
                
                // Generate Button
                Button(action: {
                    print("🎯 Test Oluştur butonuna basıldı!")
                    print("🌐 Network durumu: \(networkService.isConnected)")
                    print("🎯 CanGenerate: \(contentViewModel.canGenerateContent)")
                    
                    if networkService.isConnected {
                        Task {
                            print("📱 generateTest() çağrılıyor...")
                            await generateTest()
                        }
                    } else {
                        print("❌ Network bağlantısı yok!")
                        showNetworkAlert = true
                    }
                }) {
                    HStack {
                        if networkService.isConnected {
                            Text("🎯 Test Oluştur")
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
                            colors: networkService.isConnected ? [.purple, .blue] : [.gray, .gray],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .disabled(!contentViewModel.canGenerateContent || !networkService.isConnected)
                .opacity((contentViewModel.canGenerateContent && networkService.isConnected) ? 1.0 : 0.6)
                
                Spacer()
            }
            .padding()
        }
    }
    
    private var selectionSummary: some View {
        VStack(spacing: 16) {
            Text("Test Bilgileri")
                .font(.headline)
                .fontWeight(.semibold)
            
            VStack(spacing: 12) {
                if let educationLevel = contentViewModel.selectedEducationLevel {
                    SummaryRow(title: "Eğitim Seviyesi", value: educationLevel.rawValue, icon: "graduationcap.fill")
                }
                
                if let grade = contentViewModel.selectedGrade {
                    SummaryRow(title: "Sınıf", value: "\(grade). Sınıf", icon: "number.circle.fill")
                }
                
                if let subject = contentViewModel.selectedSubject {
                    SummaryRow(title: "Ders", value: subject.rawValue, icon: subject.icon)
                }
                
                if let topic = contentViewModel.selectedTopic {
                    SummaryRow(title: "Konu", value: topic.title, icon: "lightbulb.fill")
                    SummaryRow(title: "Zorluk", value: topic.difficulty.rawValue, icon: topic.difficulty.icon)
                }
                
                SummaryRow(title: "Soru Sayısı", value: "10 Soru", icon: "list.number")
                SummaryRow(title: "Süre", value: "Sınırsız", icon: "clock")
            }
            .padding()
            .background(Color(UIColor.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
    
    private var loadingView: some View {
        VStack(spacing: 20) {
            Text("🧠")
                .font(.largeTitle)
                .scaleEffect(1.5)
            
            Text("AI test soruları oluşturuyor...")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("Bu işlem birkaç saniye sürebilir")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func generateTest() async {
        print("🎮 TestGenerationView.generateTest() başladı")
        
        guard let educationLevel = contentViewModel.selectedEducationLevel,
              let grade = contentViewModel.selectedGrade,
              let subject = contentViewModel.selectedSubject,
              let topic = contentViewModel.selectedTopic else {
            print("❌ TestGenerationView: Seçimler eksik!")
            print("📊 Level: \(contentViewModel.selectedEducationLevel?.rawValue ?? "nil")")
            print("📊 Grade: \(contentViewModel.selectedGrade ?? 0)")
            print("📊 Subject: \(contentViewModel.selectedSubject?.rawValue ?? "nil")")
            print("📊 Topic: \(contentViewModel.selectedTopic?.title ?? "nil")")
            return
        }
        
        print("✅ TestGenerationView: Tüm seçimler tamam, TestViewModel'e aktarılıyor...")
        await testViewModel.generateTest(
            educationLevel: educationLevel,
            grade: grade,
            subject: subject,
            topic: topic,
            questionCount: 10
        )
    }
}

struct TestTakingView: View {
    @ObservedObject var testViewModel: TestViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // Progress Header
            VStack(spacing: 12) {
                HStack {
                    Text("Soru \(testViewModel.currentQuestionIndex + 1) / \(testViewModel.totalQuestionsCount)")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: {
                        testViewModel.showTestResults()
                    }) {
                        Text("Bitir")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    .disabled(!testViewModel.canShowResults)
                }
                
                ProgressView(value: testViewModel.progress)
                    .progressViewStyle(LinearProgressViewStyle(tint: .blue))
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            
            Divider()
            
            // Question Content
            if let currentQuestion = testViewModel.currentQuestion {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Question
                        Text(currentQuestion.question)
                            .font(.title3)
                            .fontWeight(.medium)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        // Options
                        VStack(spacing: 12) {
                            ForEach(Array(currentQuestion.options.enumerated()), id: \.offset) { index, option in
                                OptionButton(
                                    option: option,
                                    index: index,
                                    isSelected: currentQuestion.userAnswer == index,
                                    isCorrect: currentQuestion.isAnswered && index == currentQuestion.correctAnswer,
                                    isWrong: currentQuestion.isAnswered && currentQuestion.userAnswer == index && index != currentQuestion.correctAnswer,
                                    showResult: currentQuestion.isAnswered
                                ) {
                                    if !currentQuestion.isAnswered {
                                        testViewModel.answerQuestion(at: testViewModel.currentQuestionIndex, with: index)
                                    }
                                }
                            }
                        }
                        
                        // Explanation (shown after answering)
                        if currentQuestion.isAnswered {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Açıklama:")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Text(currentQuestion.explanation)
                                    .font(.body)
                                    .padding()
                                    .background(Color.blue.opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            .padding(.top)
                        }
                        
                        Spacer(minLength: 100)
                    }
                    .padding()
                }
            }
            
            // Navigation Buttons
            HStack(spacing: 16) {
                Button(action: {
                    testViewModel.previousQuestion()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Önceki")
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color(UIColor.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .disabled(testViewModel.currentQuestionIndex == 0)
                
                Button(action: {
                    if testViewModel.currentQuestionIndex < testViewModel.totalQuestionsCount - 1 {
                        testViewModel.nextQuestion()
                    } else {
                        testViewModel.showTestResults()
                    }
                }) {
                    HStack {
                        Text(testViewModel.currentQuestionIndex < testViewModel.totalQuestionsCount - 1 ? "Sonraki" : "Bitir")
                        if testViewModel.currentQuestionIndex < testViewModel.totalQuestionsCount - 1 {
                            Image(systemName: "chevron.right")
                        } else {
                            Image(systemName: "checkmark")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding()
            .background(Color(UIColor.systemBackground))
        }
    }
}

struct OptionButton: View {
    let option: String
    let index: Int
    let isSelected: Bool
    let isCorrect: Bool
    let isWrong: Bool
    let showResult: Bool
    let action: () -> Void
    
    private var backgroundColor: Color {
        if showResult {
            if isCorrect {
                return .green
            } else if isWrong {
                return .red
            } else {
                return Color(UIColor.systemGray5)
            }
        } else if isSelected {
            return .blue.opacity(0.2)
        } else {
            return Color(UIColor.systemBackground)
        }
    }
    
    private var borderColor: Color {
        if showResult {
            if isCorrect {
                return .green
            } else if isWrong {
                return .red
            } else {
                return Color(UIColor.systemGray4)
            }
        } else if isSelected {
            return .blue
        } else {
            return Color(UIColor.systemGray4)
        }
    }
    
    private var textColor: Color {
        if showResult && (isCorrect || isWrong) {
            return .white
        } else {
            return .primary
        }
    }
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text("\(["A", "B", "C", "D"][index]))")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
                    .frame(width: 30)
                
                Text(option)
                    .font(.body)
                    .foregroundColor(textColor)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                if showResult && isCorrect {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.white)
                } else if showResult && isWrong {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor, lineWidth: 2)
            )
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct TestResultsView: View {
    @ObservedObject var testViewModel: TestViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Score Header
                VStack(spacing: 16) {
                    Text("🎉")
                        .font(.system(size: 60))
                    
                    Text("Test Tamamlandı!")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("\(testViewModel.correctAnswersCount) / \(testViewModel.totalQuestionsCount)")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.blue)
                    
                    Text("%\(testViewModel.scorePercentage)")
                        .font(.title2)
                        .foregroundColor(.secondary)
                    
                    Text(testViewModel.scoreGrade)
                        .font(.headline)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.blue.opacity(0.2))
                        .clipShape(Capsule())
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
                // Question Summary
                VStack(alignment: .leading, spacing: 12) {
                    Text("Soru Detayları")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    ForEach(Array(testViewModel.testQuestions.enumerated()), id: \.element.id) { index, question in
                        QuestionResultRow(question: question, index: index)
                    }
                }
                
                // Action Buttons
                VStack(spacing: 12) {
                    Button(action: {
                        testViewModel.resetTest()
                    }) {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                            Text("Yeni Test")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Ana Sayfaya Dön")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.blue.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                
                Spacer(minLength: 50)
            }
            .padding()
        }
    }
}

struct QuestionResultRow: View {
    let question: TestQuestion
    let index: Int
    
    var body: some View {
        HStack {
            Text("\(index + 1)")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .background(question.isCorrect ? Color.green : Color.red)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(question.question)
                    .font(.subheadline)
                    .lineLimit(2)
                
                if let userAnswer = question.userAnswer {
                    Text("Cevabınız: \(["A", "B", "C", "D"][userAnswer])")
                        .font(.caption)
                        .foregroundColor(question.isCorrect ? .green : .red)
                }
                
                Text("Doğru Cevap: \(["A", "B", "C", "D"][question.correctAnswer])")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: question.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundColor(question.isCorrect ? .green : .red)
                .font(.title2)
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(UIColor.systemGray4), lineWidth: 1)
        )
    }
}

// MARK: - TestGenerationView Extension
extension TestGenerationView {
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
                    
                    Text("AI test soruları oluşturmak için internet bağlantısı gereklidir")
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

#Preview {
    NavigationView {
        TestGenerationView()
            .environmentObject(ContentViewModel())
    }
} 