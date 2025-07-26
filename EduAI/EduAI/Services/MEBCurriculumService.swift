import Foundation

// MARK: - MEB Curriculum Service
class MEBCurriculumService {
    static let shared = MEBCurriculumService()
    private init() {}
    
    // MARK: - Lise 9. Sınıf Matematik Konuları (MEB Müfredatı)
    func getMathematics9thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: KÜMELER
            Topic(id: "MAT9-1-1", title: "Küme Kavramı", difficulty: .easy),
            Topic(id: "MAT9-1-2", title: "Küme Türleri", difficulty: .easy),
            Topic(id: "MAT9-1-3", title: "Kümeler Arasındaki İlişkiler", difficulty: .medium),
            Topic(id: "MAT9-1-4", title: "Kümelerde İşlemler", difficulty: .medium),
            Topic(id: "MAT9-1-5", title: "Venn Şemaları", difficulty: .medium),
            
            // 2. ÜNİTE: SAYILAR VE CEBİRSEL İFADELER
            Topic(id: "MAT9-2-1", title: "Doğal Sayılar ve Tam Sayılar", difficulty: .easy),
            Topic(id: "MAT9-2-2", title: "Rasyonel Sayılar", difficulty: .medium),
            Topic(id: "MAT9-2-3", title: "İrrasyonel Sayılar", difficulty: .medium),
            Topic(id: "MAT9-2-4", title: "Reel Sayılar", difficulty: .medium),
            Topic(id: "MAT9-2-5", title: "Aralıklar", difficulty: .medium),
            Topic(id: "MAT9-2-6", title: "Mutlak Değer", difficulty: .medium),
            Topic(id: "MAT9-2-7", title: "Üslü İfadeler", difficulty: .hard),
            Topic(id: "MAT9-2-8", title: "Köklü İfadeler", difficulty: .hard),
            
            // 3. ÜNİTE: DENKLEMLER VE EŞİTSİZLİKLER
            Topic(id: "MAT9-3-1", title: "Birinci Dereceden Bir Bilinmeyenli Denklemler", difficulty: .medium),
            Topic(id: "MAT9-3-2", title: "Birinci Dereceden İki Bilinmeyenli Denklem Sistemleri", difficulty: .medium),
            Topic(id: "MAT9-3-3", title: "İkinci Dereceden Bir Bilinmeyenli Denklemler", difficulty: .hard),
            Topic(id: "MAT9-3-4", title: "Birinci Dereceden Bir Bilinmeyenli Eşitsizlikler", difficulty: .medium),
            Topic(id: "MAT9-3-5", title: "Mutlak Değerli Denklemler ve Eşitsizlikler", difficulty: .hard),
            
            // 4. ÜNİTE: SAYMA VE OLASILIK
            Topic(id: "MAT9-4-1", title: "Sayma", difficulty: .medium),
            Topic(id: "MAT9-4-2", title: "Permütasyon", difficulty: .hard),
            Topic(id: "MAT9-4-3", title: "Kombinasyon", difficulty: .hard),
            Topic(id: "MAT9-4-4", title: "Olasılık", difficulty: .medium),
            
            // 5. ÜNİTE: VERİ TOPLAMA VE DEĞERLENDİRME
            Topic(id: "MAT9-5-1", title: "Merkezi Eğilim Ölçüleri", difficulty: .medium),
            Topic(id: "MAT9-5-2", title: "Merkezi Yayılım Ölçüleri", difficulty: .medium),
            Topic(id: "MAT9-5-3", title: "Veri Analizi", difficulty: .medium),
            
            // 6. ÜNİTE: İLİŞKİ VE FONKSİYON
            Topic(id: "MAT9-6-1", title: "İlişki Kavramı", difficulty: .medium),
            Topic(id: "MAT9-6-2", title: "Fonksiyon Kavramı", difficulty: .medium),
            Topic(id: "MAT9-6-3", title: "Fonksiyon Türleri", difficulty: .hard),
            Topic(id: "MAT9-6-4", title: "Fonksiyonlarda İşlemler", difficulty: .hard),
            
            // 7. ÜNİTE: ÇOKGENLER
            Topic(id: "MAT9-7-1", title: "Açı Kavramı", difficulty: .easy),
            Topic(id: "MAT9-7-2", title: "Çokgen ve Çeşitleri", difficulty: .medium),
            Topic(id: "MAT9-7-3", title: "Üçgenler", difficulty: .medium),
            Topic(id: "MAT9-7-4", title: "Dörtgenler", difficulty: .medium),
            Topic(id: "MAT9-7-5", title: "Çokgenlerde Alan Hesaplamaları", difficulty: .hard),
        ]
    }
    
    // MARK: - Lise 10. Sınıf Matematik Konuları (MEB Müfredatı)
    func getMathematics10thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: FONKSİYONLAR
            Topic(id: "MAT10-1-1", title: "Fonksiyon Kavramı ve Gösterimi", difficulty: .medium),
            Topic(id: "MAT10-1-2", title: "Fonksiyonlarda İşlemler", difficulty: .medium),
            Topic(id: "MAT10-1-3", title: "Bire Bir ve Örten Fonksiyonlar", difficulty: .hard),
            Topic(id: "MAT10-1-4", title: "Ters Fonksiyon", difficulty: .hard),
            Topic(id: "MAT10-1-5", title: "Fonksiyonlarda Dönüşümler", difficulty: .medium),
            
            // 2. ÜNİTE: POLİNOMLAR
            Topic(id: "MAT10-2-1", title: "Polinom Kavramı", difficulty: .medium),
            Topic(id: "MAT10-2-2", title: "Polinomlarda İşlemler", difficulty: .medium),
            Topic(id: "MAT10-2-3", title: "Polinom Bölme", difficulty: .hard),
            Topic(id: "MAT10-2-4", title: "Polinomların Çarpanlarına Ayrılması", difficulty: .hard),
            Topic(id: "MAT10-2-5", title: "Rasyonel İfadeler", difficulty: .hard),
            
            // 3. ÜNİTE: DENKLEM VE EŞİTSİZLİK SİSTEMLERİ
            Topic(id: "MAT10-3-1", title: "İkinci Dereceden Denklemler", difficulty: .medium),
            Topic(id: "MAT10-3-2", title: "İkinci Dereceden Eşitsizlikler", difficulty: .medium),
            Topic(id: "MAT10-3-3", title: "Mutlak Değerli Denklem ve Eşitsizlikler", difficulty: .hard),
            Topic(id: "MAT10-3-4", title: "Denklem Sistemleri", difficulty: .medium),
            Topic(id: "MAT10-3-5", title: "Eşitsizlik Sistemleri", difficulty: .hard),
            
            // 4. ÜNİTE: ÜÇGENLER
            Topic(id: "MAT10-4-1", title: "Üçgenlerde Açı-Kenar Bağıntıları", difficulty: .medium),
            Topic(id: "MAT10-4-2", title: "Sinüs ve Kosinüs Teoremleri", difficulty: .hard),
            Topic(id: "MAT10-4-3", title: "Üçgenin Alanı", difficulty: .medium),
            Topic(id: "MAT10-4-4", title: "Stewart Teoremi", difficulty: .hard),
            
            // 5. ÜNİTE: ANALİTİK GEOMETRİ
            Topic(id: "MAT10-5-1", title: "Koordinat Sistemi", difficulty: .easy),
            Topic(id: "MAT10-5-2", title: "Doğrunun Analitik İncelenmesi", difficulty: .medium),
            Topic(id: "MAT10-5-3", title: "Çemberin Analitik İncelenmesi", difficulty: .hard),
            Topic(id: "MAT10-5-4", title: "Koordinat Düzleminde Geometrik Şekiller", difficulty: .medium),
            
            // 6. ÜNİTE: SAYMA VE OLASILIK
            Topic(id: "MAT10-6-1", title: "Temel Sayma İlkesi", difficulty: .medium),
            Topic(id: "MAT10-6-2", title: "Permütasyon", difficulty: .hard),
            Topic(id: "MAT10-6-3", title: "Kombinasyon", difficulty: .hard),
            Topic(id: "MAT10-6-4", title: "Binom Teoremi", difficulty: .hard),
            Topic(id: "MAT10-6-5", title: "Olasılık Hesaplamaları", difficulty: .medium),
        ]
    }
    
    // MARK: - Lise 11. Sınıf Matematik Konuları (MEB Müfredatı)
    func getMathematics11thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: TRİGONOMETRİ
            Topic(id: "MAT11-1-1", title: "Trigonometrik Fonksiyonlar", difficulty: .medium),
            Topic(id: "MAT11-1-2", title: "Trigonometrik Özdeşlikler", difficulty: .hard),
            Topic(id: "MAT11-1-3", title: "Toplam ve Fark Formülleri", difficulty: .hard),
            Topic(id: "MAT11-1-4", title: "Trigonometrik Denklemler", difficulty: .hard),
            Topic(id: "MAT11-1-5", title: "Trigonometrik Eşitsizlikler", difficulty: .hard),
            
            // 2. ÜNİTE: DİZİLER
            Topic(id: "MAT11-2-1", title: "Diziler ve Genel Terimi", difficulty: .medium),
            Topic(id: "MAT11-2-2", title: "Aritmetik Diziler", difficulty: .medium),
            Topic(id: "MAT11-2-3", title: "Geometrik Diziler", difficulty: .medium),
            Topic(id: "MAT11-2-4", title: "Harmonik Diziler", difficulty: .hard),
            Topic(id: "MAT11-2-5", title: "Sonsuz Geometrik Seriler", difficulty: .hard),
            
            // 3. ÜNİTE: LİMİT VE SÜREKLİLİK
            Topic(id: "MAT11-3-1", title: "Limit Kavramı", difficulty: .medium),
            Topic(id: "MAT11-3-2", title: "Limit Hesaplama Yöntemleri", difficulty: .hard),
            Topic(id: "MAT11-3-3", title: "Özel Limitler", difficulty: .hard),
            Topic(id: "MAT11-3-4", title: "Süreklilik", difficulty: .medium),
            Topic(id: "MAT11-3-5", title: "Ara Değer Teoremi", difficulty: .hard),
            
            // 4. ÜNİTE: TÜREV
            Topic(id: "MAT11-4-1", title: "Türev Kavramı", difficulty: .medium),
            Topic(id: "MAT11-4-2", title: "Türev Alma Kuralları", difficulty: .medium),
            Topic(id: "MAT11-4-3", title: "Bileşke Fonksiyonların Türevi", difficulty: .hard),
            Topic(id: "MAT11-4-4", title: "Ters Fonksiyonların Türevi", difficulty: .hard),
            Topic(id: "MAT11-4-5", title: "Türevin Geometrik Yorumu", difficulty: .medium),
            Topic(id: "MAT11-4-6", title: "Türevin Uygulamaları", difficulty: .hard),
            
            // 5. ÜNİTE: OLASLIK
            Topic(id: "MAT11-5-1", title: "Şartlı Olasılık", difficulty: .hard),
            Topic(id: "MAT11-5-2", title: "Bayes Teoremi", difficulty: .hard),
            Topic(id: "MAT11-5-3", title: "Bağımsız Olaylar", difficulty: .medium),
            Topic(id: "MAT11-5-4", title: "Olasılık Dağılımları", difficulty: .hard),
        ]
    }
    
    // MARK: - Lise 12. Sınıf Matematik Konuları (MEB Müfredatı)
    func getMathematics12thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: İNTEGRAL
            Topic(id: "MAT12-1-1", title: "Belirsiz İntegral", difficulty: .hard),
            Topic(id: "MAT12-1-2", title: "İntegral Alma Yöntemleri", difficulty: .hard),
            Topic(id: "MAT12-1-3", title: "Parçalı İntegrasyon", difficulty: .hard),
            Topic(id: "MAT12-1-4", title: "Belirli İntegral", difficulty: .hard),
            Topic(id: "MAT12-1-5", title: "İntegral Uygulamaları", difficulty: .hard),
            Topic(id: "MAT12-1-6", title: "Alan ve Hacim Hesapları", difficulty: .hard),
            
            // 2. ÜNİTE: ÜSTEL VE LOGARİTMİK FONKSİYONLAR
            Topic(id: "MAT12-2-1", title: "Üstel Fonksiyonlar", difficulty: .medium),
            Topic(id: "MAT12-2-2", title: "Logaritma ve Özellikleri", difficulty: .medium),
            Topic(id: "MAT12-2-3", title: "Logaritmik Fonksiyonlar", difficulty: .medium),
            Topic(id: "MAT12-2-4", title: "Üstel ve Logaritmik Denklemler", difficulty: .hard),
            Topic(id: "MAT12-2-5", title: "Üstel ve Logaritmik Eşitsizlikler", difficulty: .hard),
            
            // 3. ÜNİTE: ANALİTİK GEOMETRİ
            Topic(id: "MAT12-3-1", title: "Konik Kesitler", difficulty: .hard),
            Topic(id: "MAT12-3-2", title: "Parabol", difficulty: .medium),
            Topic(id: "MAT12-3-3", title: "Elips", difficulty: .hard),
            Topic(id: "MAT12-3-4", title: "Hiperbol", difficulty: .hard),
            Topic(id: "MAT12-3-5", title: "Kutupsal Koordinatlar", difficulty: .hard),
            
            // 4. ÜNİTE: UZAY GEOMETRİSİ
            Topic(id: "MAT12-4-1", title: "Uzayda Doğru ve Düzlem", difficulty: .hard),
            Topic(id: "MAT12-4-2", title: "Uzayda Açı ve Uzaklık", difficulty: .hard),
            Topic(id: "MAT12-4-3", title: "Katı Cisimler", difficulty: .medium),
            Topic(id: "MAT12-4-4", title: "Hacim Hesapları", difficulty: .hard),
            
            // 5. ÜNİTE: İSTATİSTİK
            Topic(id: "MAT12-5-1", title: "Örneklem ve Popülasyon", difficulty: .medium),
            Topic(id: "MAT12-5-2", title: "Normal Dağılım", difficulty: .hard),
            Topic(id: "MAT12-5-3", title: "Güven Aralığı", difficulty: .hard),
            Topic(id: "MAT12-5-4", title: "Hipotez Testleri", difficulty: .hard),
            Topic(id: "MAT12-5-5", title: "Korelasyon ve Regresyon", difficulty: .hard),
        ]
    }
    
    // MARK: - Ana Getirme Metodu
    func getTopics(for subject: Subject, grade: Int) -> [Topic] {
        switch (subject, grade) {
        case (.mathematics, 9): return getMathematics9thGradeTopics()
        case (.mathematics, 10): return getMathematics10thGradeTopics()
        case (.mathematics, 11): return getMathematics11thGradeTopics()
        case (.mathematics, 12): return getMathematics12thGradeTopics()
        
        case (.physics, 9): return getPhysics9thGradeTopics()
        case (.physics, 10): return getPhysics10thGradeTopics()
        case (.physics, 11): return getPhysics11thGradeTopics()
        case (.physics, 12): return getPhysics12thGradeTopics()
        
        case (.chemistry, 9): return getChemistry9thGradeTopics()
        case (.chemistry, 10): return getChemistry10thGradeTopics()
        case (.chemistry, 11): return getChemistry11thGradeTopics()
        case (.chemistry, 12): return getChemistry12thGradeTopics()
        
        case (.biology, 9): return getBiology9thGradeTopics()
        case (.biology, 10): return getBiology10thGradeTopics()
        case (.biology, 11): return getBiology11thGradeTopics()
        case (.biology, 12): return getBiology12thGradeTopics()
        
        case (.history, 9): return getHistory9thGradeTopics()
        case (.history, 10): return getHistory10thGradeTopics()
        case (.history, 11): return getHistory11thGradeTopics()
        case (.history, 12): return getHistory12thGradeTopics()
        
        default:
            return [] // Henüz diğer dersler eklenmedi
        }
    }
    
    // MARK: - FİZİK KONULARI
    
    // MARK: - Lise 9. Sınıf Fizik Konuları (MEB Müfredatı)
    func getPhysics9thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: FİZİK BİLİMİ
            Topic(id: "FIZ9-1-1", title: "Fizik Biliminin Doğası", difficulty: .easy),
            Topic(id: "FIZ9-1-2", title: "Ölçme ve Birimler", difficulty: .easy),
            Topic(id: "FIZ9-1-3", title: "Vektörler", difficulty: .medium),
            Topic(id: "FIZ9-1-4", title: "Güvenlik", difficulty: .easy),
            
            // 2. ÜNİTE: HAREKET
            Topic(id: "FIZ9-2-1", title: "Kinematik", difficulty: .medium),
            Topic(id: "FIZ9-2-2", title: "Tek Boyutlu Hareket", difficulty: .medium),
            Topic(id: "FIZ9-2-3", title: "İki Boyutlu Hareket", difficulty: .hard),
            Topic(id: "FIZ9-2-4", title: "Göreceli Hareket", difficulty: .hard),
            
            // 3. ÜNİTE: KUVVET VE HAREKET
            Topic(id: "FIZ9-3-1", title: "Newton'un Hareket Yasaları", difficulty: .medium),
            Topic(id: "FIZ9-3-2", title: "Sürtünme Kuvveti", difficulty: .medium),
            Topic(id: "FIZ9-3-3", title: "Basit Makineler", difficulty: .medium),
            Topic(id: "FIZ9-3-4", title: "Elastik Kuvvet", difficulty: .medium),
        ]
    }
    
    // MARK: - Lise 10. Sınıf Fizik Konuları (MEB Müfredatı)
    func getPhysics10thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: ELEKTRİK VE MANYETİZMA
            Topic(id: "FIZ10-1-1", title: "Elektrik Yükü ve Elektrik Alanı", difficulty: .medium),
            Topic(id: "FIZ10-1-2", title: "Elektrik Potansiyeli", difficulty: .hard),
            Topic(id: "FIZ10-1-3", title: "Kapasitörler", difficulty: .hard),
            Topic(id: "FIZ10-1-4", title: "Elektrik Akımı", difficulty: .medium),
            Topic(id: "FIZ10-1-5", title: "Elektrik Devresi Elemanları", difficulty: .medium),
            Topic(id: "FIZ10-1-6", title: "Elektrik Enerjisi ve Gücü", difficulty: .medium),
            Topic(id: "FIZ10-1-7", title: "Manyetizma", difficulty: .medium),
            
            // 2. ÜNİTE: BASIT HARMONİK HAREKET
            Topic(id: "FIZ10-2-1", title: "Periyodik Hareket", difficulty: .medium),
            Topic(id: "FIZ10-2-2", title: "Yay Sarkaç", difficulty: .hard),
            Topic(id: "FIZ10-2-3", title: "Basit Sarkaç", difficulty: .hard),
            
            // 3. ÜNİTE: DALGALAR
            Topic(id: "FIZ10-3-1", title: "Dalga Hareketi", difficulty: .medium),
            Topic(id: "FIZ10-3-2", title: "Su Dalgaları", difficulty: .medium),
            Topic(id: "FIZ10-3-3", title: "Ses Dalgaları", difficulty: .medium),
            Topic(id: "FIZ10-3-4", title: "Ses Şiddeti", difficulty: .medium),
            
            // 4. ÜNİTE: OPTIK
            Topic(id: "FIZ10-4-1", title: "Aydınlanma", difficulty: .easy),
            Topic(id: "FIZ10-4-2", title: "Gölge", difficulty: .easy),
            Topic(id: "FIZ10-4-3", title: "Yansıma", difficulty: .medium),
            Topic(id: "FIZ10-4-4", title: "Aynalar", difficulty: .medium),
            Topic(id: "FIZ10-4-5", title: "Kırılma", difficulty: .medium),
            Topic(id: "FIZ10-4-6", title: "Mercekler", difficulty: .hard),
            Topic(id: "FIZ10-4-7", title: "Optik Araçlar", difficulty: .hard),
        ]
    }
    
    // MARK: - Lise 11. Sınıf Fizik Konuları (MEB Müfredatı)
    func getPhysics11thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: ÇEMBERSEL HAREKET
            Topic(id: "FIZ11-1-1", title: "Çembersel Hareket", difficulty: .hard),
            Topic(id: "FIZ11-1-2", title: "Merkezcil Kuvvet", difficulty: .hard),
            
            // 2. ÜNİTE: KÜTLE ÇEKİMİ
            Topic(id: "FIZ11-2-1", title: "Kepler Yasaları", difficulty: .hard),
            Topic(id: "FIZ11-2-2", title: "Newton'un Evrensel Kütle Çekim Yasası", difficulty: .hard),
            Topic(id: "FIZ11-2-3", title: "Uydu Hareketi", difficulty: .hard),
            
            // 3. ÜNİTE: ENERJİ VE MOMENTUM
            Topic(id: "FIZ11-3-1", title: "İş, Güç ve Enerji", difficulty: .medium),
            Topic(id: "FIZ11-3-2", title: "Kinetik ve Potansiyel Enerji", difficulty: .medium),
            Topic(id: "FIZ11-3-3", title: "Enerjinin Korunumu", difficulty: .medium),
            Topic(id: "FIZ11-3-4", title: "Momentum ve İtme", difficulty: .medium),
            Topic(id: "FIZ11-3-5", title: "Çarpışmalar", difficulty: .hard),
            
            // 4. ÜNİTE: ISI VE SICAKLIK
            Topic(id: "FIZ11-4-1", title: "Sıcaklık ve Isı", difficulty: .medium),
            Topic(id: "FIZ11-4-2", title: "Gazların Kinetik Teorisi", difficulty: .hard),
            Topic(id: "FIZ11-4-3", title: "Gazların Hal Değişimi", difficulty: .medium),
            Topic(id: "FIZ11-4-4", title: "Isı Alışverişi", difficulty: .medium),
            
            // 5. ÜNİTE: ELEKTROMANYETİK İNDÜKSİYON
            Topic(id: "FIZ11-5-1", title: "Elektromanyetik İndüksiyon", difficulty: .hard),
            Topic(id: "FIZ11-5-2", title: "Faraday Yasası", difficulty: .hard),
            Topic(id: "FIZ11-5-3", title: "Lenz Yasası", difficulty: .hard),
            Topic(id: "FIZ11-5-4", title: "Alternatif Akım", difficulty: .hard),
            Topic(id: "FIZ11-5-5", title: "Transformatörler", difficulty: .medium),
        ]
    }
    
    // MARK: - Lise 12. Sınıf Fizik Konuları (MEB Müfredatı)
    func getPhysics12thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: ÇEMBERSEL HAREKET VE DÖNGÜSEL HAREKET
            Topic(id: "FIZ12-1-1", title: "Açısal Kinematik", difficulty: .hard),
            Topic(id: "FIZ12-1-2", title: "Açısal Dinamik", difficulty: .hard),
            Topic(id: "FIZ12-1-3", title: "Açısal Momentum", difficulty: .hard),
            
            // 2. ÜNİTE: TİTREŞİM VE DALGALAR
            Topic(id: "FIZ12-2-1", title: "Basit Harmonik Hareket", difficulty: .hard),
            Topic(id: "FIZ12-2-2", title: "Sönümlü ve Zorlanmış Titreşimler", difficulty: .hard),
            Topic(id: "FIZ12-2-3", title: "Dalga Olayları", difficulty: .medium),
            Topic(id: "FIZ12-2-4", title: "İnterferans", difficulty: .hard),
            Topic(id: "FIZ12-2-5", title: "Doppler Olayı", difficulty: .hard),
            
            // 3. ÜNİTE: MODERN FİZİK
            Topic(id: "FIZ12-3-1", title: "Özel Görelilik", difficulty: .hard),
            Topic(id: "FIZ12-3-2", title: "Kuantum Fiziği", difficulty: .hard),
            Topic(id: "FIZ12-3-3", title: "Fotoelektrik Olay", difficulty: .hard),
            Topic(id: "FIZ12-3-4", title: "Atom Modelleri", difficulty: .medium),
            Topic(id: "FIZ12-3-5", title: "Radioaktivite", difficulty: .medium),
            Topic(id: "FIZ12-3-6", title: "Nükleer Fizik", difficulty: .hard),
            
            // 4. ÜNİTE: ASTRONOMI
            Topic(id: "FIZ12-4-1", title: "Güneş Sistemi", difficulty: .medium),
            Topic(id: "FIZ12-4-2", title: "Yıldızlar", difficulty: .medium),
            Topic(id: "FIZ12-4-3", title: "Evrenin Yapısı", difficulty: .medium),
        ]
    }
    
    // MARK: - KİMYA KONULARI
    
    // MARK: - Lise 9. Sınıf Kimya Konuları (MEB Müfredatı)
    func getChemistry9thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: KİMYANIN DİLİ
            Topic(id: "KIM9-1-1", title: "Kimyasal Türler Arası Etkileşimler", difficulty: .easy),
            Topic(id: "KIM9-1-2", title: "Atomun Yapısı", difficulty: .medium),
            Topic(id: "KIM9-1-3", title: "Periyodik Sistem", difficulty: .medium),
            Topic(id: "KIM9-1-4", title: "Kimyasal Türler Arası Etkileşimler", difficulty: .medium),
            
            // 2. ÜNİTE: KARIŞIMLAR
            Topic(id: "KIM9-2-1", title: "Karışımların Ayrılması", difficulty: .easy),
            Topic(id: "KIM9-2-2", title: "Karışımların Sınıflandırılması", difficulty: .easy),
            Topic(id: "KIM9-2-3", title: "Çözeltiler", difficulty: .medium),
            Topic(id: "KIM9-2-4", title: "Derişim Birimleri", difficulty: .medium),
            
            // 3. ÜNİTE: MADDE VE ATOM
            Topic(id: "KIM9-3-1", title: "Atom Modelleri", difficulty: .medium),
            Topic(id: "KIM9-3-2", title: "Elektronların Dağılımı", difficulty: .medium),
            Topic(id: "KIM9-3-3", title: "Periyodik Özellikler", difficulty: .medium),
        ]
    }
    
    // MARK: - Lise 10. Sınıf Kimya Konuları (MEB Müfredatı)
    func getChemistry10thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: KİMYASAL TÜRLER ARASI ETKİLEŞİMLER
            Topic(id: "KIM10-1-1", title: "İyonik Bağ", difficulty: .medium),
            Topic(id: "KIM10-1-2", title: "Kovalent Bağ", difficulty: .medium),
            Topic(id: "KIM10-1-3", title: "Metalik Bağ", difficulty: .medium),
            Topic(id: "KIM10-1-4", title: "Moleküller Arası Etkileşimler", difficulty: .hard),
            
            // 2. ÜNİTE: KİMYASAL HESAPLAMALAR
            Topic(id: "KIM10-2-1", title: "Mol Kavramı", difficulty: .medium),
            Topic(id: "KIM10-2-2", title: "Kimyasal Formüller", difficulty: .medium),
            Topic(id: "KIM10-2-3", title: "Kimyasal Denklemler", difficulty: .medium),
            Topic(id: "KIM10-2-4", title: "Hesaplamalar", difficulty: .hard),
            
            // 3. ÜNİTE: MADDENİN HALLERİ
            Topic(id: "KIM10-3-1", title: "Gazlar", difficulty: .medium),
            Topic(id: "KIM10-3-2", title: "Sıvılar", difficulty: .medium),
            Topic(id: "KIM10-3-3", title: "Katılar", difficulty: .medium),
            Topic(id: "KIM10-3-4", title: "Hal Değişimleri", difficulty: .medium),
            
            // 4. ÜNİTE: DOĞADA HAL DEĞİŞİMLERİ VE ÇEVRESEL ETKİLERİ
            Topic(id: "KIM10-4-1", title: "Su Döngüsü", difficulty: .easy),
            Topic(id: "KIM10-4-2", title: "Karbon Döngüsü", difficulty: .medium),
            Topic(id: "KIM10-4-3", title: "Azot Döngüsü", difficulty: .medium),
            Topic(id: "KIM10-4-4", title: "Çevre Kirliliği", difficulty: .medium),
        ]
    }
    
    // MARK: - Lise 11. Sınıf Kimya Konuları (MEB Müfredatı)
    func getChemistry11thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: MODERN ATOM TEORİSİ
            Topic(id: "KIM11-1-1", title: "Atom Modelleri ve Elektronik Yapı", difficulty: .hard),
            Topic(id: "KIM11-1-2", title: "Kuantum Sayıları", difficulty: .hard),
            Topic(id: "KIM11-1-3", title: "Elektronik Konfigürasyon", difficulty: .medium),
            Topic(id: "KIM11-1-4", title: "Periyodik Sistem ve Periyodik Özellikler", difficulty: .medium),
            
            // 2. ÜNİTE: KİMYASAL KİNETİK
            Topic(id: "KIM11-2-1", title: "Tepkime Hızı", difficulty: .medium),
            Topic(id: "KIM11-2-2", title: "Tepkime Hızını Etkileyen Faktörler", difficulty: .medium),
            Topic(id: "KIM11-2-3", title: "Katalizörler", difficulty: .medium),
            Topic(id: "KIM11-2-4", title: "Enzimler", difficulty: .medium),
            
            // 3. ÜNİTE: KİMYASAL DENGE
            Topic(id: "KIM11-3-1", title: "Geri Dönüşümlü Tepkimeler", difficulty: .medium),
            Topic(id: "KIM11-3-2", title: "Denge Sabiti", difficulty: .hard),
            Topic(id: "KIM11-3-3", title: "Le Chatelier İlkesi", difficulty: .hard),
            Topic(id: "KIM11-3-4", title: "Denge Hesaplamaları", difficulty: .hard),
            
            // 4. ÜNİTE: ASIT-BAZ DENGELERI VE TUZLARIN HİDROLİZİ
            Topic(id: "KIM11-4-1", title: "Asit-Baz Teorileri", difficulty: .medium),
            Topic(id: "KIM11-4-2", title: "pH ve pOH", difficulty: .medium),
            Topic(id: "KIM11-4-3", title: "Asit-Baz İndikatörleri", difficulty: .medium),
            Topic(id: "KIM11-4-4", title: "Tampon Çözeltiler", difficulty: .hard),
            Topic(id: "KIM11-4-5", title: "Tuzların Hidrolizi", difficulty: .hard),
            
            // 5. ÜNİTE: ÇÖZÜNÜRLÜK DENGELERİ
            Topic(id: "KIM11-5-1", title: "Çözünürlük", difficulty: .medium),
            Topic(id: "KIM11-5-2", title: "Çözünürlük Çarpımı", difficulty: .hard),
            Topic(id: "KIM11-5-3", title: "Ortak İyon Etkisi", difficulty: .hard),
        ]
    }
    
    // MARK: - Lise 12. Sınıf Kimya Konuları (MEB Müfredatı)
    func getChemistry12thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: ELEKTROKİMYA
            Topic(id: "KIM12-1-1", title: "Elektrokimyasal Hücreler", difficulty: .hard),
            Topic(id: "KIM12-1-2", title: "Galvanik Pil", difficulty: .hard),
            Topic(id: "KIM12-1-3", title: "Elektroliz", difficulty: .hard),
            Topic(id: "KIM12-1-4", title: "Korozyon", difficulty: .medium),
            
            // 2. ÜNİTE: KARBON KİMYASINA GİRİŞ
            Topic(id: "KIM12-2-1", title: "Organik Bileşiklerin Sınıflandırılması", difficulty: .medium),
            Topic(id: "KIM12-2-2", title: "Fonksiyonel Gruplar", difficulty: .medium),
            Topic(id: "KIM12-2-3", title: "İzomeri", difficulty: .hard),
            Topic(id: "KIM12-2-4", title: "Adlandırma", difficulty: .medium),
            
            // 3. ÜNİTE: ORGANİK BİLEŞİKLER
            Topic(id: "KIM12-3-1", title: "Alkanlar", difficulty: .medium),
            Topic(id: "KIM12-3-2", title: "Alkenler", difficulty: .medium),
            Topic(id: "KIM12-3-3", title: "Alkinler", difficulty: .medium),
            Topic(id: "KIM12-3-4", title: "Alkoller", difficulty: .medium),
            Topic(id: "KIM12-3-5", title: "Karboksilik Asitler", difficulty: .medium),
            Topic(id: "KIM12-3-6", title: "Esterler", difficulty: .medium),
            
            // 4. ÜNİTE: ENERJİ KAYNAKLARI VE BİLİMSEL GELİŞMELER
            Topic(id: "KIM12-4-1", title: "Fosil Yakıtlar", difficulty: .medium),
            Topic(id: "KIM12-4-2", title: "Biyoyakıtlar", difficulty: .medium),
            Topic(id: "KIM12-4-3", title: "Alternatif Enerji Kaynakları", difficulty: .medium),
            Topic(id: "KIM12-4-4", title: "Nanoteknoloji", difficulty: .hard),
        ]
    }
    
    // MARK: - BİYOLOJİ KONULARI
    
    // MARK: - Lise 9. Sınıf Biyoloji Konuları (MEB Müfredatı)
    func getBiology9thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: YAŞAM BİLİMİ BİYOLOJİ
            Topic(id: "BIO9-1-1", title: "Biyoloji Bilimi", difficulty: .easy),
            Topic(id: "BIO9-1-2", title: "Canlıların Özellikleri", difficulty: .easy),
            Topic(id: "BIO9-1-3", title: "Canlıların Sınıflandırılması", difficulty: .medium),
            Topic(id: "BIO9-1-4", title: "Mikroskop ve Mikroskobik İnceleme", difficulty: .medium),
            
            // 2. ÜNİTE: HÜCRE
            Topic(id: "BIO9-2-1", title: "Hücre Teorisi", difficulty: .medium),
            Topic(id: "BIO9-2-2", title: "Prokaryot ve Ökaryot Hücreler", difficulty: .medium),
            Topic(id: "BIO9-2-3", title: "Hücre Organelleri", difficulty: .medium),
            Topic(id: "BIO9-2-4", title: "Hücre Zarı ve Geçirgenlik", difficulty: .medium),
            Topic(id: "BIO9-2-5", title: "Hücreler Arası Madde Alışverişi", difficulty: .medium),
            
            // 3. ÜNİTE: CANLILAR DÜNYASINDAKİ ÇEŞİTLİLİK
            Topic(id: "BIO9-3-1", title: "Virüsler", difficulty: .medium),
            Topic(id: "BIO9-3-2", title: "Prokaryotlar", difficulty: .medium),
            Topic(id: "BIO9-3-3", title: "Protistler", difficulty: .medium),
            Topic(id: "BIO9-3-4", title: "Mantarlar", difficulty: .medium),
            Topic(id: "BIO9-3-5", title: "Bitkiler", difficulty: .medium),
            Topic(id: "BIO9-3-6", title: "Hayvanlar", difficulty: .medium),
        ]
    }
    
    // MARK: - Lise 10. Sınıf Biyoloji Konuları (MEB Müfredatı)
    func getBiology10thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: HÜCRE BÖLÜNMELERİ
            Topic(id: "BIO10-1-1", title: "Kalıtsal Maddenin Keşfi", difficulty: .medium),
            Topic(id: "BIO10-1-2", title: "Kromozom, DNA ve Gen", difficulty: .medium),
            Topic(id: "BIO10-1-3", title: "Hücre Döngüsü", difficulty: .medium),
            Topic(id: "BIO10-1-4", title: "Mitoz", difficulty: .medium),
            Topic(id: "BIO10-1-5", title: "Mayoz", difficulty: .hard),
            Topic(id: "BIO10-1-6", title: "Üreme Hücrelerinin Oluşumu", difficulty: .hard),
            
            // 2. ÜNİTE: KALITIM
            Topic(id: "BIO10-2-1", title: "Kalıtımın Temel İlkeleri", difficulty: .medium),
            Topic(id: "BIO10-2-2", title: "Mendel'in Kalıtım Yasaları", difficulty: .medium),
            Topic(id: "BIO10-2-3", title: "Kan Grupları", difficulty: .medium),
            Topic(id: "BIO10-2-4", title: "Cinsiyete Bağlı Kalıtım", difficulty: .hard),
            Topic(id: "BIO10-2-5", title: "Kalıtsal Hastalıklar", difficulty: .medium),
            
            // 3. ÜNİTE: CANLILAR ARASI İLİŞKİLER
            Topic(id: "BIO10-3-1", title: "Populasyon Ekolojisi", difficulty: .medium),
            Topic(id: "BIO10-3-2", title: "Canlılar Arası İlişkiler", difficulty: .medium),
            Topic(id: "BIO10-3-3", title: "Toplum Ekolojisi", difficulty: .medium),
            Topic(id: "BIO10-3-4", title: "Ekosistem Ekolojisi", difficulty: .medium),
            Topic(id: "BIO10-3-5", title: "Biyom ve Biyosfer", difficulty: .medium),
            Topic(id: "BIO10-3-6", title: "Biyojeokimyasal Döngüler", difficulty: .hard),
            Topic(id: "BIO10-3-7", title: "Küresel İklim Değişikliği", difficulty: .medium),
        ]
    }
    
    // MARK: - Lise 11. Sınıf Biyoloji Konuları (MEB Müfredatı)
    func getBiology11thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: İNSAN FİZYOLOJİSİ
            Topic(id: "BIO11-1-1", title: "Sinir Sistemi", difficulty: .hard),
            Topic(id: "BIO11-1-2", title: "Endokrin Sistemi", difficulty: .hard),
            Topic(id: "BIO11-1-3", title: "Duyu Organları", difficulty: .medium),
            Topic(id: "BIO11-1-4", title: "Destek ve Hareket Sistemi", difficulty: .medium),
            Topic(id: "BIO11-1-5", title: "Sindirim Sistemi", difficulty: .medium),
            Topic(id: "BIO11-1-6", title: "Dolaşım Sistemi", difficulty: .medium),
            Topic(id: "BIO11-1-7", title: "Solunum Sistemi", difficulty: .medium),
            Topic(id: "BIO11-1-8", title: "Boşaltım Sistemi", difficulty: .medium),
            Topic(id: "BIO11-1-9", title: "Üreme Sistemi", difficulty: .medium),
            
            // 2. ÜNİTE: BİYOLOJİK ÇEŞİTLİLİĞİN KORUNMASI
            Topic(id: "BIO11-2-1", title: "Biyolojik Çeşitlilik", difficulty: .medium),
            Topic(id: "BIO11-2-2", title: "Biyolojik Çeşitliliğin Önemi", difficulty: .medium),
            Topic(id: "BIO11-2-3", title: "Biyolojik Çeşitliliği Etkileyen Faktörler", difficulty: .medium),
            Topic(id: "BIO11-2-4", title: "Biyolojik Çeşitliliğin Korunması", difficulty: .medium),
            Topic(id: "BIO11-2-5", title: "Türkiye'nin Biyolojik Çeşitliliği", difficulty: .medium),
        ]
    }
    
    // MARK: - Lise 12. Sınıf Biyoloji Konuları (MEB Müfredatı)
    func getBiology12thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: GENDEN PROTEİNE
            Topic(id: "BIO12-1-1", title: "Nükleik Asitler", difficulty: .hard),
            Topic(id: "BIO12-1-2", title: "DNA'nın Yapısı", difficulty: .medium),
            Topic(id: "BIO12-1-3", title: "RNA'nın Yapısı ve Türleri", difficulty: .medium),
            Topic(id: "BIO12-1-4", title: "DNA Replikasyonu", difficulty: .hard),
            Topic(id: "BIO12-1-5", title: "Transkripsiyon", difficulty: .hard),
            Topic(id: "BIO12-1-6", title: "Translasyon", difficulty: .hard),
            Topic(id: "BIO12-1-7", title: "Gen İfadesi ve Düzenlenmesi", difficulty: .hard),
            
            // 2. ÜNİTE: CANLI TEKNOLOJİLERİ
            Topic(id: "BIO12-2-1", title: "Biyoteknoloji", difficulty: .medium),
            Topic(id: "BIO12-2-2", title: "Genetik Mühendisliği", difficulty: .hard),
            Topic(id: "BIO12-2-3", title: "PCR Tekniği", difficulty: .hard),
            Topic(id: "BIO12-2-4", title: "DNA Parmak İzi", difficulty: .medium),
            Topic(id: "BIO12-2-5", title: "Gen Terapisi", difficulty: .hard),
            Topic(id: "BIO12-2-6", title: "Klonlama", difficulty: .hard),
            Topic(id: "BIO12-2-7", title: "Transgenik Organizmalar", difficulty: .hard),
            
            // 3. ÜNİTE: POPULASYONLARDAKİ GENLER
            Topic(id: "BIO12-3-1", title: "Populasyon Genetiği", difficulty: .hard),
            Topic(id: "BIO12-3-2", title: "Hardy-Weinberg İlkesi", difficulty: .hard),
            Topic(id: "BIO12-3-3", title: "Mikroevolüsyon", difficulty: .hard),
            Topic(id: "BIO12-3-4", title: "Doğal Seleksiyon", difficulty: .medium),
            Topic(id: "BIO12-3-5", title: "Adaptasyon", difficulty: .medium),
            
            // 4. ÜNİTE: EVRİM
            Topic(id: "BIO12-4-1", title: "Evrim Teorisi", difficulty: .medium),
            Topic(id: "BIO12-4-2", title: "Evrime Kanıtlar", difficulty: .medium),
            Topic(id: "BIO12-4-3", title: "Darwin'in Evrim Teorisi", difficulty: .medium),
            Topic(id: "BIO12-4-4", title: "Modern Evrim Sentezi", difficulty: .hard),
            Topic(id: "BIO12-4-5", title: "İnsan Evrimi", difficulty: .medium),
        ]
    }
    
    // MARK: - TARİH KONULARI
    
    // MARK: - Lise 9. Sınıf Tarih Konuları (MEB Müfredatı)
    func getHistory9thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: TARİHTE ZAMAN VE MEKÂN
            Topic(id: "TAR9-1-1", title: "Tarih Bilimi", difficulty: .easy),
            Topic(id: "TAR9-1-2", title: "Tarihte Zaman", difficulty: .easy),
            Topic(id: "TAR9-1-3", title: "Tarihte Mekân", difficulty: .easy),
            Topic(id: "TAR9-1-4", title: "Tarih Öncesi Dönem", difficulty: .medium),
            
            // 2. ÜNİTE: İLK ÇAĞLARDA ANADOLU VE MESOPOTAMYA
            Topic(id: "TAR9-2-1", title: "Anadolu'da İlk Yerleşmeler", difficulty: .medium),
            Topic(id: "TAR9-2-2", title: "Hitit Devleti", difficulty: .medium),
            Topic(id: "TAR9-2-3", title: "Frigler ve Lidyalılar", difficulty: .medium),
            Topic(id: "TAR9-2-4", title: "Mesopotamya Medeniyetleri", difficulty: .medium),
            
            // 3. ÜNİTE: İLK ÇAĞLARDA DOĞU MEDENİYETLERİ
            Topic(id: "TAR9-3-1", title: "Mısır Medeniyeti", difficulty: .medium),
            Topic(id: "TAR9-3-2", title: "Çin Medeniyeti", difficulty: .medium),
            Topic(id: "TAR9-3-3", title: "Hint Medeniyeti", difficulty: .medium),
            Topic(id: "TAR9-3-4", title: "İran Medeniyeti", difficulty: .medium),
            
            // 4. ÜNİTE: İLK ÇAĞLARDA BATI MEDENİYETLERİ
            Topic(id: "TAR9-4-1", title: "Yunan Medeniyeti", difficulty: .medium),
            Topic(id: "TAR9-4-2", title: "Hellenistik Dönem", difficulty: .medium),
            Topic(id: "TAR9-4-3", title: "Roma Medeniyeti", difficulty: .medium),
            Topic(id: "TAR9-4-4", title: "Bizans İmparatorluğu", difficulty: .medium),
            
            // 5. ÜNİTE: ORTA ÇAĞLARDA DÜNYA VE İSLAM MEDENİYETİ
            Topic(id: "TAR9-5-1", title: "İslamiyet'in Doğuşu", difficulty: .medium),
            Topic(id: "TAR9-5-2", title: "İslam Devleti'nin Kuruluşu", difficulty: .medium),
            Topic(id: "TAR9-5-3", title: "Emeviler", difficulty: .medium),
            Topic(id: "TAR9-5-4", title: "Abbasiler", difficulty: .medium),
            Topic(id: "TAR9-5-5", title: "İslam Medeniyeti", difficulty: .medium),
            
            // 6. ÜNİTE: TÜRKLERDE DEVLET GELENEĞİ
            Topic(id: "TAR9-6-1", title: "Türklerin Anayurdu ve İlk Devletleri", difficulty: .medium),
            Topic(id: "TAR9-6-2", title: "Türklerin İslamiyet'i Kabulü", difficulty: .medium),
            Topic(id: "TAR9-6-3", title: "Gazneliler", difficulty: .medium),
            Topic(id: "TAR9-6-4", title: "Büyük Selçuklu Devleti", difficulty: .medium),
            Topic(id: "TAR9-6-5", title: "Anadolu Selçuklu Devleti", difficulty: .medium),
        ]
    }
    
    // MARK: - Lise 10. Sınıf Tarih Konuları (MEB Müfredatı)
    func getHistory10thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: TÜRK TARİHİNDE ANADOLU
            Topic(id: "TAR10-1-1", title: "Türklerin Anadolu'ya Gelişi", difficulty: .medium),
            Topic(id: "TAR10-1-2", title: "Anadolu'da Kurulan Türk Beylikleri", difficulty: .medium),
            Topic(id: "TAR10-1-3", title: "Osmanlı Beyliği'nin Kuruluşu", difficulty: .medium),
            Topic(id: "TAR10-1-4", title: "Osmanlı Devleti'nin Gelişimi", difficulty: .medium),
            
            // 2. ÜNİTE: OTTOMAN DÜNYA DEVLETE GİDEN YOL
            Topic(id: "TAR10-2-1", title: "Balkanlar'da Osmanlı Hâkimiyeti", difficulty: .medium),
            Topic(id: "TAR10-2-2", title: "Ankara Savaşı ve Fetret Devri", difficulty: .hard),
            Topic(id: "TAR10-2-3", title: "Fatih Sultan Mehmet Dönemi", difficulty: .medium),
            Topic(id: "TAR10-2-4", title: "İstanbul'un Fethi", difficulty: .medium),
            
            // 3. ÜNİTE: OSMANLI DEVLET DÜZEN
            Topic(id: "TAR10-3-1", title: "Osmanlı Devlet Yönetimi", difficulty: .medium),
            Topic(id: "TAR10-3-2", title: "Osmanlı Toplum Yapısı", difficulty: .medium),
            Topic(id: "TAR10-3-3", title: "Osmanlı Hukuk Sistemi", difficulty: .medium),
            Topic(id: "TAR10-3-4", title: "Osmanlı Ekonomik Yapısı", difficulty: .medium),
            
            // 4. ÜNİTE: OSMANLI KLASIK ÇAĞINDA SANAT VE KÜLTÜR
            Topic(id: "TAR10-4-1", title: "Osmanlı Eğitim Sistemi", difficulty: .medium),
            Topic(id: "TAR10-4-2", title: "Osmanlı Mimari Sanatı", difficulty: .medium),
            Topic(id: "TAR10-4-3", title: "Osmanlı Edebiyatı", difficulty: .medium),
            Topic(id: "TAR10-4-4", title: "Osmanlı Müziği", difficulty: .medium),
            
            // 5. ÜNİTE: 15. VE 16. YÜZYILLARDA OSMANLI GÜCÜ
            Topic(id: "TAR10-5-1", title: "Yavuz Sultan Selim Dönemi", difficulty: .medium),
            Topic(id: "TAR10-5-2", title: "Kanuni Sultan Süleyman Dönemi", difficulty: .medium),
            Topic(id: "TAR10-5-3", title: "Osmanlı-Safevi Mücadeleleri", difficulty: .medium),
            Topic(id: "TAR10-5-4", title: "Akdeniz'de Osmanlı Hâkimiyeti", difficulty: .medium),
            
            // 6. ÜNİTE: YENİ ÇAĞDA AVRUPA VE OSMANLI
            Topic(id: "TAR10-6-1", title: "Rönesans", difficulty: .medium),
            Topic(id: "TAR10-6-2", title: "Reform Hareketleri", difficulty: .medium),
            Topic(id: "TAR10-6-3", title: "Coğrafi Keşifler", difficulty: .medium),
            Topic(id: "TAR10-6-4", title: "Bilim Devrimi", difficulty: .medium),
            Topic(id: "TAR10-6-5", title: "Aydınlanma Çağı", difficulty: .medium),
        ]
    }
    
    // MARK: - Lise 11. Sınıf Tarih Konuları (MEB Müfredatı)
    func getHistory11thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: OSMANLI DEVLETİ'NDE DEĞİŞİM
            Topic(id: "TAR11-1-1", title: "17. Yüzyılda Osmanlı Devleti", difficulty: .medium),
            Topic(id: "TAR11-1-2", title: "18. Yüzyılda Osmanlı Devleti", difficulty: .medium),
            Topic(id: "TAR11-1-3", title: "III. Selim Dönemi", difficulty: .medium),
            Topic(id: "TAR11-1-4", title: "II. Mahmut Dönemi", difficulty: .medium),
            
            // 2. ÜNİTE: OSMANLI DEVLETİ'NDE YENİLEŞME HAREKETLERİ
            Topic(id: "TAR11-2-1", title: "Tanzimat Fermanı", difficulty: .medium),
            Topic(id: "TAR11-2-2", title: "Tanzimat Dönemi Islahatları", difficulty: .medium),
            Topic(id: "TAR11-2-3", title: "Islahat Fermanı", difficulty: .medium),
            Topic(id: "TAR11-2-4", title: "I. Meşrutiyet", difficulty: .medium),
            Topic(id: "TAR11-2-5", title: "II. Abdülhamit Dönemi", difficulty: .medium),
            Topic(id: "TAR11-2-6", title: "II. Meşrutiyet", difficulty: .medium),
            
            // 3. ÜNİTE: YENİ ÇAĞDA DEĞİŞEN DEVLET-TOPLUM İLİŞKİLERİ
            Topic(id: "TAR11-3-1", title: "Fransız İhtilali", difficulty: .medium),
            Topic(id: "TAR11-3-2", title: "Napolyon Dönemi", difficulty: .medium),
            Topic(id: "TAR11-3-3", title: "Milliyetçilik", difficulty: .medium),
            Topic(id: "TAR11-3-4", title: "Sanayi Devrimi", difficulty: .medium),
            Topic(id: "TAR11-3-5", title: "Emperyalizm", difficulty: .medium),
            
            // 4. ÜNİTE: İMPARATORLUKTAN MİLLİ DEVLETE
            Topic(id: "TAR11-4-1", title: "I. Dünya Savaşı Öncesi Osmanlı Devleti", difficulty: .medium),
            Topic(id: "TAR11-4-2", title: "I. Dünya Savaşı'na Giriş", difficulty: .medium),
            Topic(id: "TAR11-4-3", title: "I. Dünya Savaşı'nda Cepheler", difficulty: .medium),
            Topic(id: "TAR11-4-4", title: "Mondros Mütarekesi", difficulty: .medium),
            Topic(id: "TAR11-4-5", title: "Sevr Antlaşması", difficulty: .medium),
            
            // 5. ÜNİTE: MİLLİ MÜCADELE
            Topic(id: "TAR11-5-1", title: "Milli Mücadele'nin Hazırlık Evresi", difficulty: .medium),
            Topic(id: "TAR11-5-2", title: "TBMM'nin Açılışı", difficulty: .medium),
            Topic(id: "TAR11-5-3", title: "Düzenli Orduya Geçiş", difficulty: .medium),
            Topic(id: "TAR11-5-4", title: "Cepheler ve Savaşlar", difficulty: .hard),
            Topic(id: "TAR11-5-5", title: "Lozan Antlaşması", difficulty: .medium),
        ]
    }
    
    // MARK: - Lise 12. Sınıf Tarih Konuları (MEB Müfredatı)
    func getHistory12thGradeTopics() -> [Topic] {
        return [
            // 1. ÜNİTE: 20. YÜZYILIN BAŞLARINDA OSMANLI DEVLETİ VE DÜNYA
            Topic(id: "TAR12-1-1", title: "20. Yüzyıl Başında Dünya", difficulty: .medium),
            Topic(id: "TAR12-1-2", title: "İttihat ve Terakki", difficulty: .medium),
            Topic(id: "TAR12-1-3", title: "Balkan Savaşları", difficulty: .medium),
            Topic(id: "TAR12-1-4", title: "I. Dünya Savaşı", difficulty: .medium),
            
            // 2. ÜNİTE: MİLLİ MÜCADELE'DEN GÜNÜMÜZE TÜRKİYE
            Topic(id: "TAR12-2-1", title: "Türkiye Cumhuriyeti'nin İlanı", difficulty: .medium),
            Topic(id: "TAR12-2-2", title: "Atatürk İlkeleri", difficulty: .medium),
            Topic(id: "TAR12-2-3", title: "Atatürk Dönemi İç Politika", difficulty: .medium),
            Topic(id: "TAR12-2-4", title: "Atatürk Dönemi Dış Politika", difficulty: .medium),
            Topic(id: "TAR12-2-5", title: "Atatürk Dönemi Kültür ve Sanat", difficulty: .medium),
            
            // 3. ÜNİTE: İKİ SAVAŞ ARASI DÖNEM
            Topic(id: "TAR12-3-1", title: "1929 Ekonomik Krizi", difficulty: .medium),
            Topic(id: "TAR12-3-2", title: "Totaliter Rejimler", difficulty: .medium),
            Topic(id: "TAR12-3-3", title: "İsmet İnönü Dönemi", difficulty: .medium),
            Topic(id: "TAR12-3-4", title: "II. Dünya Savaşı", difficulty: .medium),
            
            // 4. ÜNİTE: SOĞUK SAVAŞ DÖNEMİ
            Topic(id: "TAR12-4-1", title: "Soğuk Savaş", difficulty: .medium),
            Topic(id: "TAR12-4-2", title: "Türkiye'de Çok Partili Hayat", difficulty: .medium),
            Topic(id: "TAR12-4-3", title: "Demokrat Parti Dönemi", difficulty: .medium),
            Topic(id: "TAR12-4-4", title: "27 Mayıs 1960 İhtilali", difficulty: .medium),
            Topic(id: "TAR12-4-5", title: "Kıbrıs Sorunu", difficulty: .medium),
            
            // 5. ÜNİTE: KÜRESELLEŞEN DÜNYA
            Topic(id: "TAR12-5-1", title: "12 Mart 1971 Muhtırası", difficulty: .medium),
            Topic(id: "TAR12-5-2", title: "12 Eylül 1980 İhtilali", difficulty: .medium),
            Topic(id: "TAR12-5-3", title: "1980 Sonrası Türkiye", difficulty: .medium),
            Topic(id: "TAR12-5-4", title: "Küreselleşme", difficulty: .medium),
            Topic(id: "TAR12-5-5", title: "Günümüz Dünyası", difficulty: .medium),
        ]
    }
    
    // MARK: - Konu Detayları
    func getTopicDetail(for topicId: String) -> TopicDetail? {
        switch topicId {
        case "MAT9-1-1":
            return TopicDetail(
                id: topicId,
                title: "Küme Kavramı",
                description: "Küme kavramı, elemanlar ve kümeler arasındaki ilişkiler",
                objectives: [
                    "Küme kavramını açıklar",
                    "Küme gösterimlerini kullanır",
                    "Küme elemanlarını belirler"
                ],
                estimatedHours: 2
            )
        case "MAT9-2-7":
            return TopicDetail(
                id: topicId,
                title: "Üslü İfadeler",
                description: "Üslü sayılar ve üs kuralları",
                objectives: [
                    "Üslü sayıları tanır",
                    "Üs kurallarını uygular", 
                    "Üslü ifadeleri sadeleştirir"
                ],
                estimatedHours: 3
            )
        default:
            return nil
        }
    }
}

// MARK: - Supporting Models
struct TopicDetail {
    let id: String
    let title: String
    let description: String
    let objectives: [String]
    let estimatedHours: Int
} 