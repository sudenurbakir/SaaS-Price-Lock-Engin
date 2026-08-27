**2. Sistem Bileşenleri Arası İletişim (Sequence Diagram)**
sequenceDiagram
    autonumber
    participant Job as Fatura Cron Job
    participant Engine as Fatura Motoru
    participant DB as Veritabanı
    participant Gateway as Ödeme Kuruluşu API

    Job->>Engine: Faturalandırma Periyodunu Başlat
    Engine->>DB: Müşteri için Aktif Fiyat Kuralı Var mı?
    
    alt Aktif Sabit Fiyat Var
        DB-->>Engine: Sabit Fiyat Kuralı Döner
        Engine->>Engine: Fatura Tutarını Sabit Fiyat Yap
    else Kural Yok veya Süresi Dolmuş
        DB-->>Engine: Kural Bulunamadı veya Expired
        Engine->>Engine: Fatura Tutarını Standart Fiyat Yap
    end

    Engine->>Gateway: Fatura Tutarını Tahsil Et
    Gateway-->>Engine: Tahsilat Başarılı
    Engine->>DB: Fatura Kaydını Güncelle
