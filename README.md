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
