import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var appSettings = AppSettings()
    private let cacheService = CacheService()
    @State private var showingClearCacheAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                // App Preferences
                Section("Uygulama Tercihleri") {
                    HStack {
                        Image(systemName: "textformat.size")
                            .foregroundColor(.blue)
                            .frame(width: 24)
                        
                        Text("Yazı Boyutu")
                        
                        Spacer()
                        
                        Picker("Yazı Boyutu", selection: $appSettings.fontSize) {
                            ForEach(AppSettings.FontSize.allCases, id: \.self) { size in
                                Text(size.rawValue).tag(size)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 150)
                    }
                    
                    HStack {
                        Image(systemName: "bell.fill")
                            .foregroundColor(.orange)
                            .frame(width: 24)
                        
                        Text("Bildirimler")
                        
                        Spacer()
                        
                        Toggle("", isOn: $appSettings.isNotificationsEnabled)
                    }
                    
                    HStack {
                        Image(systemName: "internaldrive.fill")
                            .foregroundColor(.green)
                            .frame(width: 24)
                        
                        Text("Otomatik Kaydetme")
                        
                        Spacer()
                        
                        Toggle("", isOn: $appSettings.autoSaveEnabled)
                    }
                }
                
                // Cache Management
                Section("Veri Yönetimi") {
                    Button(action: {
                        showingClearCacheAlert = true
                    }) {
                        HStack {
                            Image(systemName: "trash.fill")
                                .foregroundColor(.red)
                                .frame(width: 24)
                            
                            Text("Önbelleği Temizle")
                                .foregroundColor(.red)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "externaldrive.fill")
                            .foregroundColor(.blue)
                            .frame(width: 24)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Depolama Kullanımı")
                            Text("Önbellek boyutu hesaplanıyor...")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                // About
                Section("Uygulama Hakkında") {
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.blue)
                            .frame(width: 24)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("EduAI")
                                .fontWeight(.medium)
                            Text("Sürüm 1.0.0")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "brain.head.profile")
                            .foregroundColor(.purple)
                            .frame(width: 24)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("AI Teknolojisi")
                                .fontWeight(.medium)
                            Text("Google Gemini AI")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Link(destination: URL(string: "https://github.com")!) {
                        HStack {
                            Image(systemName: "link.circle.fill")
                                .foregroundColor(.blue)
                                .frame(width: 24)
                            
                            Text("GitHub Sayfası")
                            
                            Spacer()
                            
                            Image(systemName: "arrow.up.right")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                // API Settings
                Section("API Ayarları") {
                    HStack {
                        Image(systemName: "key.fill")
                            .foregroundColor(.orange)
                            .frame(width: 24)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Gemini API Durumu")
                                .fontWeight(.medium)
                            Text("API anahtarını kod içerisinde ayarlayın")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                // Developer Info
                Section("Geliştirici") {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.green)
                            .frame(width: 24)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("AI Assistant")
                                .fontWeight(.medium)
                            Text("Claude Sonnet 4 ile geliştirildi")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Ayarlar")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Bitti") {
                        saveSettings()
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
        .onAppear {
            loadSettings()
        }
        .alert("Önbellek Temizle", isPresented: $showingClearCacheAlert) {
            Button("İptal", role: .cancel) { }
            Button("Temizle", role: .destructive) {
                clearCache()
            }
        } message: {
            Text("Tüm önbellek ve favori içerikler silinecek. Bu işlem geri alınamaz.")
        }
    }
    
    private func loadSettings() {
        appSettings = cacheService.loadAppSettings()
    }
    
    private func saveSettings() {
        cacheService.saveAppSettings(appSettings)
    }
    
    private func clearCache() {
        cacheService.clearCache()
    }
}

#Preview {
    SettingsView()
} 