CREATE TABLE LOG_TRIGGER (
    id_log INT IDENTITY(1,1) PRIMARY KEY,
    id_ve INT,
    gia_ve_moi INT,
    ly_do NVARCHAR(255),
    thoi_gian DATETIME DEFAULT GETDATE()
);
