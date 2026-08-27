**2. Sistem Bileşenleri Arası İletişim (Sequence Diagram)**

sequenceDiagram
    autonumber
    participant Job as Fatura Cron Job
    participant Engine as Fatura Motoru
    participant DB as Veritabanı (Overrides)
    participant Gateway as Ödeme Kuruluşu API

    Job->>Engine: Faturalandırma Periyodunu Başlat
    Engine->>DB: Müşteri için Aktif Fiyat Kuralı Var mı?
    
    alt Aktif Sabit Fiyat Var
        DB-->>Engine: Sabit Fiyat Kuralı Döner (Örn: 5.000 TL)
        Engine->>Engine: Fatura Tutarını 5.000 TL Olarak Ayarla
    else Kural Yok veya Süresi Dolmuş
        DB-->>Engine: Kural Bulunamadı / Expired
        Engine->>Engine: Fatura Tutarını Standart Katalog Fiyatı Yap
    end

    Engine->>Gateway: Fatura Tutarını Tahsil Et
    Gateway-->>Engine: Tahsilat Başarılı
    Engine->>DB: Fatura Kaydını Ve Durumunu Güncelle
