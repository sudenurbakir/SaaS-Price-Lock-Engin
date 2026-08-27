# Business Requirements Document (BRD) - Fiyat Sabitleme Motoru

## 1. Amaç ve Özet
Satış ve Müşteri İlişkileri ekibinin belirli müşteriler için yaptığı özel ticari anlaşmalar doğrultusunda, faturalandırma sisteminin manuel müdahale olmadan belirlenen tarihe kadar sabit fiyat uygulamasını sağlamak.

## 2. İş Kuralları (Business Rules)
- **BR-01:** Sabit fiyat kuralı sadece `Başlangıç Tarihi <= Bugün < Bitiş Tarihi` koşulunda geçerlidir.
- **BR-02:** Süresi dolan sabit fiyat kuralları arka planda otomatik olarak `EXPIRED` durumuna getirilir.
- **BR-03:** Bir müşterinin aynı hizmet grubu için aynı tarihlerde sadece 1 adet aktif sabit fiyat kuralı olabilir.
- **BR-04:** Sabit fiyat tanımlaması yapıldığı an eski faturalandırma planı askıya alınır, kural bitiminde otomatik tekrar devreye girer.

## 3. İstisnai Durumlar (Edge Cases)
- Müşteri sabit fiyat dönemi bitmeden sözleşmeyi feshederse kural `CANCELLED` olarak güncellenir.
- Bitiş tarihi günün sonunda (23:59:59) sona erer; ertesi günün ilk faturalandırması standart tarifeden kesilir.
