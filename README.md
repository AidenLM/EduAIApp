# EduAI - AI Destekli Eğitim Uygulaması

![iOS](https://img.shields.io/badge/iOS-15.0+-blue.svg)
![Swift](https://img.shields.io/badge/Swift-5.7+-orange.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-3.0+-green.svg)


EduAI, öğrenciler ve öğretmenler için yapay zeka destekli eğitim içeriği üreten modern bir iOS uygulamasıdır. Google Gemini AI teknolojisi kullanarak kişiselleştirilmiş konu anlatımları ve test soruları oluşturur.

## 🎯 Özellikler

### 🎓 Eğitim Seviyeleri
- **İlkokul** (1-4. Sınıf)
- **Ortaokul** (5-8. Sınıf) 
- **Lise** (9-12. Sınıf)
- **Üniversite** (1-4. Yıl)

### 📚 Desteklenen Dersler
- **Matematik** - Temel işlemlerden ileri matematiğe
- **Fizik** - Mekaniğe, dalgalar, elektrik
- **Kimya** - Atomlar, moleküller, tepkimeler
- **Biyoloji** - Hücreler, genetik, evrim
- **Türkçe** - Dilbilgisi, edebiyat, yazma
- **Tarih** - Antik çağdan modern tarihe

### 🤖 AI Destekli İçerik
- **Konu Anlatımları** - Detaylı, seviyeye uygun açıklamalar
- **Test Soruları** - Çoktan seçmeli sorular ve açıklamaları
- **Zorluk Seviyeleri** - Kolay, Orta, Zor
- **Kişiselleştirme** - Sınıf seviyesine özel içerik

### 📱 Modern UI/UX
- **SwiftUI** ile modern arayüz
- **Dark/Light Mode** desteği
- **Animasyonlar** ve geçiş efektleri
- **Accessibility** desteği
- **iPad** uyumluluğu
- **Dynamic Type** desteği

### 💾 Veri Yönetimi
- **Offline Cache** - İnternet olmadan içerik görüntüleme
- **Favori Sistem** - Beğenilen içerikleri kaydetme
- **Paylaşım** - İçerikleri paylaşma
- **Arama** - Favori içeriklerde arama

## 🏗️ Teknik Mimari

### MVVM Pattern
```
📁 EduAI/
├── 📱 EduAIApp.swift          # Ana uygulama
├── 📄 ContentView.swift       # Kök görünüm
├── 📁 Models/                 # Veri modelleri
│   ├── EducationLevel.swift
│   ├── Subject.swift
│   ├── Topic.swift
│   └── Content.swift
├── 📁 ViewModels/            # İş mantığı
│   ├── ContentViewModel.swift
│   └── TestViewModel.swift
├── 📁 Views/                 # UI bileşenleri
│   ├── HomeView.swift
│   ├── GradeSelectionView.swift
│   ├── SubjectSelectionView.swift
│   ├── TopicSelectionView.swift
│   ├── ContentGenerationView.swift
│   ├── TestGenerationView.swift
│   ├── SettingsView.swift
│   └── FavoritesView.swift
├── 📁 Services/              # API ve veri servisleri
│   ├── GeminiAPIService.swift
│   └── CacheService.swift
└── 📁 Utils/                 # Yardımcı dosyalar
    ├── Constants.swift
    └── Extensions.swift
```

### API Entegrasyonu
- **Google Gemini AI** - İçerik üretimi
- **HTTP Requests** - RESTful API çağrıları
- **JSON Parsing** - Veri işleme
- **Error Handling** - Hata yönetimi
- **Loading States** - Yükleme durumları

## 🚀 Kurulum

### Gereksinimler
- **Xcode 14.0+**
- **iOS 15.0+**
- **Swift 5.7+**
- **Google Gemini API Key**

### Adımlar

1. **Projeyi Klonlayın**
```bash
git clone https://github.com/yourusername/EduAI.git
cd EduAI
```

2. **API Anahtarı Ayarlayın**
```swift
// Services/GeminiAPIService.swift dosyasında
private let apiKey = "YOUR_GEMINI_API_KEY"
```

3. **Xcode'da Açın**
```bash
open EduAI.xcodeproj
```

4. **Çalıştırın**
- Simulator veya gerçek cihaz seçin
- **⌘ + R** ile çalıştırın

## 🔑 API Anahtarı Alma

1. [Google AI Studio](https://makersuite.google.com/app/apikey) ziyaret edin
2. Google hesabınızla giriş yapın
3. "Create API Key" butonuna tıklayın
4. Anahtarı kopyalayın ve `GeminiAPIService.swift` dosyasına yapıştırın

## 📖 Kullanım

### İçerik Oluşturma
1. Ana sayfada eğitim seviyenizi seçin
2. Sınıfınızı belirleyin
3. Çalışmak istediğiniz dersi seçin
4. Konuyu seçin
5. İçerik türünü (Anlatım/Test) belirleyin
6. "İçerik Oluştur" butonuna basın

### Favori Yönetimi
- ❤️ simgesine basarak favorilere ekleyin
- "Favoriler" sekmesinden tüm favorilerinizi görün
- Arama yaparak istediğiniz içeriği bulun

### Test Çözme
1. Test türünü seçin
2. Soruları tek tek cevaplayın
3. Açıklamaları okuyun
4. Sonuçlarınızı görün
5. Yeni test için tekrarlayın

## 🎨 UI Bileşenleri

### Ana Sayfalar
- **HomeView** - Eğitim seviyesi seçimi
- **GradeSelectionView** - Sınıf seçimi
- **SubjectSelectionView** - Ders seçimi
- **TopicSelectionView** - Konu seçimi

### İçerik Sayfaları
- **ContentGenerationView** - Konu anlatımı oluşturma
- **TestGenerationView** - Test soruları oluşturma
- **FavoritesView** - Favori içerikler
- **SettingsView** - Uygulama ayarları

### Özel Bileşenler
- **EducationLevelCard** - Seviye kartları
- **SubjectCard** - Ders kartları
- **TopicCard** - Konu kartları
- **OptionButton** - Test seçenekleri

## 🔧 Konfigürasyon

### App Settings
```swift
struct AppSettings: Codable {
    var isDarkModeEnabled: Bool = false
    var fontSize: FontSize = .medium
    var isNotificationsEnabled: Bool = true
    var preferredLanguage: String = "tr"
    var autoSaveEnabled: Bool = true
}
```

### API Configuration
```swift
// Constants.swift
static let geminiAPIBaseURL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent"
static let maxRetryAttempts = 3
static let requestTimeout: TimeInterval = 30
```

## 🛠️ Geliştirme

### Yeni Ders Ekleme
1. `Subject.swift` dosyasına yeni case ekleyin
2. Icon ve renk tanımlayın
3. Konuları `getTopics` metodunda ekleyin

### Yeni Eğitim Seviyesi Ekleme
1. `EducationLevel.swift` dosyasına case ekleyin
2. Sınıf aralığını `grades` property'sinde belirleyin
3. Icon ve renk tanımlayın

### Yeni İçerik Türü Ekleme
1. `Content.ContentType` enum'ına ekleyin
2. API prompt'larını güncelleyin
3. UI'da yeni türü destekleyin

## 📊 Veri Modelleri

### EducationLevel
```swift
enum EducationLevel: String, CaseIterable {
    case elementary = "İlkokul"
    case middleSchool = "Ortaokul"
    case highSchool = "Lise"
    case university = "Üniversite"
}
```

### Content
```swift
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
}
```

## 🔒 Güvenlik

- **API Anahtarı** - Güvenli şekilde saklayın
- **HTTPS** - Tüm API çağrıları şifrelidir
- **Veri Doğrulama** - Girdi validasyonu
- **Error Handling** - Güvenli hata yönetimi

## 🌐 Yerelleştirme

- **Türkçe** - Ana dil
- **İngilizce** - İkincil dil desteği
- **Date Formatting** - Türkçe tarih formatları
- **Number Formatting** - Yerel sayı formatları

## 🧪 Test

### Unit Tests
```bash
# Test komutları
⌘ + U # Xcode'da test çalıştır
```

### UI Tests
- Navigation testleri
- API response testleri
- Cache testleri

## 📈 Performans

### Optimizasyonlar
- **LazyVGrid** - Listeler için
- **Image Caching** - Görsel önbellekleme
- **Memory Management** - Bellek yönetimi
- **Background Processing** - Arka plan işlemleri

### Cache Yönetimi
- **50 içerik** limiti
- **Automatic cleanup** - Otomatik temizlik
- **LRU Strategy** - En az kullanılan silinir

## 🤝 Katkıda Bulunma

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/AmazingFeature`)
3. Commit yapın (`git commit -m 'Add some AmazingFeature'`)
4. Push yapın (`git push origin feature/AmazingFeature`)
5. Pull Request açın



## 📞 İletişim

- **GitHub Issues** - Bug raporları ve özellik istekleri
- **Email** - developer@eduai.com

## 🙏 Teşekkürler

- **Google Gemini AI** - AI teknolojisi için
- **SwiftUI** - Modern UI framework'ü için
- **iOS Community** - Açık kaynak katkıları için
- **Kutay Şahin** - Fikir Desteği için

---

**EduAI** ile öğrenme deneyiminizi geliştirin! 🎓✨ 
