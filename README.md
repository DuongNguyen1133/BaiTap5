# BaiTap5 - Hệ Quản Trị CSDL
Nguyễn Thế Dương _ K225480106007
- SUBJECT: Trigger on mssql
# A. Phân tích và thiết kế hệ thống đặt vé xem phim online
1. Yêu cầu : Thiết kế một hệ thống hỗ trợ người dùng đặt vé xem phim qua mạng, tiết kiệm thời gian, chủ động lựa chọn suất chiếu, ghế ngồi, thanh toán nhanh chóng và hiệu quả.   
 - Yêu cầu chức năng (Functional Requirements):  
 1.1 Đối với người dùng (khách hàng):
- Đăng ký/Đăng nhập tài khoản  
- Tìm kiếm phim theo tên, thể loại, thời gian  
- Xem thông tin chi tiết phim: mô tả, trailer, thời lượng…  
- Xem lịch chiếu phim theo ngày, rạp  
- Chọn rạp, suất chiếu, ghế ngồi   
- Đặt vé và thanh toán online  
- Nhận thông tin vé (QR code/email)  
- Xem lại lịch sử đặt vé
 1.2 Đối với quản trị viên (admin):
- Thêm/Sửa/Xóa phim   
- Quản lý suất chiếu (thời gian chiếu, rạp chiếu)   
- Quản lý người dùng   
- Xem báo cáo: lượt đặt vé, doanh thu theo ngày/tháng/rạp/phim   
- Quản lý thông tin rạp, phòng chiếu, ghế

2. Cơ sở dữ liệu của bài toán
![Untitled0](https://github.com/user-attachments/assets/bd668bf9-cdfc-4d8e-bc79-9f46593f541d)
- Bang Ghe
![Untitled1](https://github.com/user-attachments/assets/1bc1bc7c-a0f1-470c-830d-66d862039013)
- Bang LichChieu
![Untitled2](https://github.com/user-attachments/assets/f45018e1-ec4c-45af-bca0-2b85f6fc13e7)
- Bang NguoiDung
  ![Untitled3](https://github.com/user-attachments/assets/13a0dceb-42fe-4b23-b090-acaab4715af2)
- Bang Phim
  ![Untitled4](https://github.com/user-attachments/assets/4fe3ad24-7b9f-4628-b017-50ae76d8a7aa)
- Bang PhongChieu
  ![Untitled5](https://github.com/user-attachments/assets/31d8b25e-293c-49a0-a9e1-c2d4984ef4b3)
- Bang Rap
  ![Untitled6](https://github.com/user-attachments/assets/b683b766-ae40-49a1-89cf-5f1c05646df6)
- Bang ThanhToan
  ![Untitled7](https://github.com/user-attachments/assets/46e33172-ae66-4332-9017-783518125c08)
- Bang Ve
  ![Untitled8](https://github.com/user-attachments/assets/3cda87a2-7d59-43bf-8043-c63d774e3fd6)

# B. Nội dung Bài tập 05:
1. Dựa trên cơ sở là csdl của Đồ án  
2. Tìm cách bổ xung thêm 1 (hoặc vài) trường phi chuẩn  
   (là trường tính toán đc, nhưng thêm vào thì ok hơn,  
    ok hơn theo 1 logic nào đó, vd ok hơn về speed)  
   => Nêu rõ logic này!
3. Viết trigger cho 1 bảng nào đó, 
   mà có sử dụng trường phi chuẩn này,
   nhằm đạt được 1 vài mục tiêu nào đó.
   => Nêu rõ các mục tiêu 
4. Nhập dữ liệu có kiểm soát, 
   nhằm để test sự hiệu quả của việc trigger auto run.
5. Kết luận về Trigger. 

# GIẢI 
- Dựa trên CSDL của đề tài ta có bảng VE , với các trường thông tin
( id_ve, id_lich, id_ghe, id_nd, trang_thai, thoi_gian_dat )
- Bổ sung trường phi chuẩn (gia_ve)
 Vì giá vé có thể tính toán được dựa vào suát chiếu , loại ghế, ngày chiếu  
→ Nhưng thêm trực tiếp vào bảng sẽ giúp:  
Truy xuất nhanh hơn trong các báo cáo (thay vì JOIN nhiều bảng rồi tính toán)  
Hữu ích cho lưu giữ lịch sử giá vé theo từng thời điểm  
- Viết trigger cho bảng VE
  Mỗi khi INSERT vé mới → hệ thống tự tính gia_ve theo logic trên.
  ![Untitled9](https://github.com/user-attachments/assets/437fcc52-51c9-4672-87d4-d210c61c368f)
- Dữ liệu trong bảng VE
![Untitled9](https://github.com/user-attachments/assets/4a593f8e-468f-4081-9878-3f19d00193aa)

- Cách trigger trg_tinh_gia_ve hoạt động
Khi một bản ghi mới được chèn vào bảng VE, trigger trg_tinh_gia_ve sẽ tự động chạy.   
Trigger này tính toán giá vé dựa trên logic cụ thể:  
Giá vé cơ bản là 80000.  
Nếu số ghế (GHE.so_ghe) bắt đầu bằng các chữ cái đặc biệt như 'D' hoặc 'E', thì có thêm logic điều kiện phụ để thay đổi giá.
![Untitled10](https://github.com/user-attachments/assets/720f64d0-7210-4e3f-906a-9e102f1ad435)

- Ta kiểm tả trigger hoạt động
  Thực hiển INSERT thêm một dòng mới vào trong bảng VE
  ![Untitled11](https://github.com/user-attachments/assets/266e2ebf-793f-4063-80cf-cae8008ea938)

Kiểm tra bảng VE để xem giá vé (gia_ve) có được cập nhật chính xác không:
![Untitled11](https://github.com/user-attachments/assets/37264b1c-1b1b-4a6d-a7c5-8537a0af9318)

 - Kết Luận
   TRigger
   Trigger giúp tự động thực hiện logic khi có INSERT, UPDATE hoặc DELETE trên bảng.  
Trong bài, trigger được dùng để:  
Tự động tính gia_ve khi người dùng đặt vé (AFTER INSERT)  
(Tùy chọn) Cập nhật lại giá vé nếu thông tin thay đổi (AFTER UPDATE)  
(Tùy chọn) Ghi log các thay đổi để truy vết và kiểm tra dữ liệu.  
- Trigger giúp giảm lỗi và chuẩn hóa logic tính toán
  Không cần tính giá thủ công hay qua ứng dụng, trigger đảm bảo:  
Giá vé được tính nhất quán theo các điều kiện: ghế cao cấp, giờ chiếu tối, cuối tuần.  
Trigger chạy trong nền, không cần người dùng can thiệp.  
  - Có thể mở rộng trigger để ghi log, hỗ trợ kiểm tra sau này  
Việc ghi vào bảng LOG_TRIGGER giúp: 
Kiểm tra trigger có hoạt động không.  
Biết rõ vì sao giá vé có giá trị đó (theo lý do như “ghế cao cấp”, “chiếu tối”...).  
Tuy nhiên, cần chắc chắn câu lệnh INSERT vào log phải đúng logic và chạy sau tính giá.  

















