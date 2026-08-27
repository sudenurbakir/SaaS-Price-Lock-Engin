-- Müşteri Sabit Fiyat Kuralları Tablosu
CREATE TABLE MerchantPriceOverrides (
    OverrideID INT PRIMARY KEY IDENTITY(1,1),
    MerchantID INT NOT NULL,
    ServiceID INT NOT NULL,
    FixedAmount DECIMAL(18, 2) NOT NULL,
    Currency VARCHAR(3) DEFAULT 'TRY',
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'ACTIVE', -- ACTIVE, EXPIRED, CANCELLED
    CreatedDate DATETIME DEFAULT GETDATE(),
    UpdatedDate DATETIME NULL
);

-- Örnek Sorgu: Aktif ve Geçerli Kuralı Getirme
SELECT TOP 1 FixedAmount 
FROM MerchantPriceOverrides 
WHERE MerchantID = 102 
  AND Status = 'ACTIVE'
  AND GETDATE() BETWEEN StartDate AND EndDate;
