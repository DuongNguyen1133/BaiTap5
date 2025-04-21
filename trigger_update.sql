CREATE TRIGGER trg_tinh_gia_ve
ON VE
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Tính giá vé
    UPDATE VE
    SET gia_ve = 
        80000 + 
        CASE WHEN LEFT(GHE.so_ghe, 1) IN ('D', 'E') THEN 80000 * 0.2 ELSE 0 END +
        CASE WHEN CAST(LICH_CHIEU.gio_chieu AS TIME) >= '18:00:00' THEN 80000 * 0.1 ELSE 0 END +
        CASE WHEN DATEPART(WEEKDAY, LICH_CHIEU.ngay_chieu) IN (1, 7) THEN 80000 * 0.1 ELSE 0 END
    FROM VE
    JOIN inserted i ON VE.id_ve = i.id_ve
    JOIN LICH_CHIEU ON VE.id_lich = LICH_CHIEU.id_lich
    JOIN GHE ON VE.id_ghe = GHE.id_ghe;

    -- Ghi log
    INSERT INTO LOG_TRIGGER(id_ve, gia_ve_moi, ly_do, thoi_gian)
    SELECT 
        i.id_ve,
        v.gia_ve,
        CONCAT(
            CASE WHEN LEFT(g.so_ghe, 1) IN ('D', 'E') THEN N'Ghế cao cấp; ' ELSE '' END,
            CASE WHEN CAST(lc.gio_chieu AS TIME) >= '18:00:00' THEN N'Giờ tối; ' ELSE '' END,
            CASE WHEN DATEPART(WEEKDAY, lc.ngay_chieu) IN (1, 7) THEN N'Cuối tuần' ELSE '' END
        ),
        GETDATE()
    FROM inserted i
    JOIN VE v ON v.id_ve = i.id_ve
    JOIN LICH_CHIEU lc ON v.id_lich = lc.id_lich
    JOIN GHE g ON v.id_ghe = g.id_ghe;
END;
