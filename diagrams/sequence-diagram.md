# Süreç ve Sequence Diyagramları

## 1. Fatura Kesim Zamanı Kontrol Akışı (Flowchart)

```mermaid
graph TD
    A[Aylık Fatura Zamanlayıcı Tetiklendi] --> B{Müşterinin Sabit Fiyat Kuralı Var mı?}
    B -- Evet --> C{Günün Tarihi Bitiş Tarihinden Küçük veya Eşit mi?}
    C -- Evet --> D[Sabit Fiyatı Uygula: 5.000 TL]
    C -- Hayır --> E[Kural Durumunu EXPIRED Yap]
    E --> F[Standart Liste Fiyatını Uygula]
    B -- Hayır --> F
    D --> G[Faturayı Oluştur ve Müşteriye İlet]
    F --> G
