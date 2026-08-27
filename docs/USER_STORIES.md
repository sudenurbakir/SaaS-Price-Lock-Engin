# User Stories & Acceptance Criteria (Kullanıcı Hikayeleri ve Kabul Kriterleri)

## US-01: Müşteriye Özel Sabit Fiyat Tanımlama

**As a** Müşteri Temsilcisi / Admin  
**I want to** belirli bir müşteri için belirli tarih aralığında geçerli olacak sabit fiyat tutarı tanımlayabilmek  
**So that** yapılan özel ticari anlaşmalar faturalandırma sistemine otomatik yansır ve manuel takibe gerek kalmaz.

### Kabul Kriterleri (Acceptance Criteria)

#### Senaryo 1: Başarılı Sabit Fiyat Tanımlama
* **Given** Admin paneline yetkili bir kullanıcı olarak giriş yaptım.
* **When** "M-102" ID'li müşteri için 5.000 TL tutarında ve "01.09.2026 - 01.01.2027" tarihleri arasında geçerli kural oluşturduğumda,
* **Then** Kural `ACTIVE` statüsüyle kaydedilmeli ve müşteri detayına yansımalıdır.

#### Senaryo 2: Çakışan Tarih Kontrolü
* **Given** Müşterinin halihazırda 01.09.2026 - 01.01.2027 arasında aktif bir sabit fiyat kuralı var.
* **When** Aynı tarihler içine denk gelen yeni bir sabit fiyat kuralı girilmeye çalışıldığında,
* **Then** Sistem "Bu tarihler arasında aktif bir fiyat sabitleme kuralı bulunmaktadır." uyarısı vermeli ve kaydı engellemelidir.

---

## US-02: Fatura Çalıştığında Sabit Fiyat Kontrolü ve Uygulanması

**As a** Faturalandırma Servisi (Billing Engine)  
**I want to** her fatura periyodunda müşterinin aktif bir fiyat sabitleme kuralı olup olmadığını kontrol etmek  
**So that** doğru tutarda fatura kesebileyim.

### Kabul Kriterleri (Acceptance Criteria)

#### Senaryo 1: Sabit Fiyatın Faturaya Yansıması
* **Given** Müşterinin bugünün tarihini kapsayan 5.000 TL sabit fiyat kuralı var.
* **When** Aylık periyodik fatura tetiklendiğinde,
* **Then** Fatura kalemine standart katalog fiyatı yerine 5.000 TL yazılmalı ve fatura oluşturulmalıdır.

#### Senaryo 2: Süresi Dolan Kuralın Otomatik Pasife Alınması
* **Given** Bugünü kapsayan kuralın bitiş tarihi geçmiş (Örn: Bugün 02.01.2027).
* **When** Fatura servisi çalıştığında,
* **Then** Kuralın statüsü `EXPIRED` olarak güncellenmeli ve fatura standart katalog fiyatı üzerinden kesilmelidir.
