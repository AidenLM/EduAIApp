import Foundation
import SwiftUI

// MARK: - Color Extensions
extension Color {
    init(_ colorName: String) {
        switch colorName.lowercased() {
        case "blue":
            self = .blue
        case "red":
            self = .red
        case "green":
            self = .green
        case "orange":
            self = .orange
        case "purple":
            self = .purple
        case "mint":
            self = .mint
        case "brown":
            self = .brown
        case "yellow":
            self = .yellow
        case "pink":
            self = .pink
        case "cyan":
            self = .cyan
        case "indigo":
            self = .indigo
        case "teal":
            self = .teal
        default:
            self = .primary
        }
    }
    
    static var random: Color {
        let colors: [Color] = [.blue, .red, .green, .orange, .purple, .mint, .brown, .yellow, .pink, .cyan, .indigo, .teal]
        return colors.randomElement() ?? .blue
    }
}

// MARK: - String Extensions
extension String {
    func truncated(toLength length: Int, withSuffix suffix: String = "...") -> String {
        if self.count <= length {
            return self
        }
        return String(self.prefix(length)) + suffix
    }
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

// MARK: - View Extensions
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func cardStyle() -> some View {
        self
            .background(Color(UIColor.systemBackground))
            .cornerRadius(Constants.cornerRadius)
            .shadow(color: .black.opacity(0.1), radius: Constants.shadowRadius, x: 0, y: 2)
    }
    
    func buttonStyle(color: Color = .blue) -> some View {
        self
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(color)
            .cornerRadius(Constants.cornerRadius)
    }
    
    func pulseAnimation() -> some View {
        self.scaleEffect(1.0)
            .animation(
                Animation.easeInOut(duration: 1.0)
                    .repeatForever(autoreverses: true),
                value: UUID()
            )
    }
}

// MARK: - Date Extensions
extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
    
    func formatted(style: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter.string(from: self)
    }
}

// MARK: - Array Extensions
extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

// MARK: - Custom Shapes
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

// MARK: - Custom Button Styles
struct PrimaryButtonStyle: ButtonStyle {
    let color: Color
    
    init(color: Color = .blue) {
        self.color = color
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(color)
            .cornerRadius(Constants.cornerRadius)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    let color: Color
    
    init(color: Color = .blue) {
        self.color = color
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(color)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(color.opacity(0.1))
            .cornerRadius(Constants.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .stroke(color, lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Keyboard Handling
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// MARK: - Haptic Feedback
struct HapticManager {
    static let shared = HapticManager()
    
    private init() {}
    
    func impact(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
    func notification(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func selection() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
} 