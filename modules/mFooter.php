<div id="footer">
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Liên Hệ</title>
</head>
<body>
    <footer>
        <h1 class="h1-footer">Liên hệ</h1>
        <form action="" method="post" id="contactForm-footer">
            <label for="name">Tên:</label>
            <input class ="input-footer"type="text" id="name" name="name" required placeholder="Name">
            <br><br>
            <label for="email">Email:</label>
            <input class ="input-footer" type="email" id="email" name="email" required placeholder="Email">
            <br><br> 
            <label for="message">Ý kiến:</label>
            <textarea class ="input-footer" id="message" name="message" required placeholder="Message"></textarea>
            <br><br>
            <button type="submit" name="submit">Gửi</button>
        </form>
        
        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            // Kết nối tới MySQL
            $servername = "localhost";
            $username = "root";
            $password = "";
            $dbname = "babyshop";  // Thay 'your_database_name' bằng tên cơ sở dữ liệu của bạn

            $conn = new mysqli($servername, $username, $password, $dbname);

            // Kiểm tra kết nối
            if ($conn->connect_error) {
                die("Kết nối thất bại: " . $conn->connect_error);
            }

            // Lấy dữ liệu từ form và lọc
            $name = $conn->real_escape_string(trim($_POST["name"]));
            $email = $conn->real_escape_string(trim($_POST["email"]));
            $message = $conn->real_escape_string(trim($_POST["message"]));

            // Kiểm tra dữ liệu hợp lệ
            if (!empty($name) && !empty($email) && !empty($message) && filter_var($email, FILTER_VALIDATE_EMAIL)) {
                // Chuẩn bị truy vấn
                $sql = "INSERT INTO feedback (name, email, message) VALUES ('$name', '$email', '$message')";

                if ($conn->query($sql) === TRUE) {
                    echo "<p>Cảm ơn bạn đã gửi ý kiến!</p>";
                } else {
                    echo "<p>Đã xảy ra lỗi: " . $conn->error . "</p>";
                }
            } else {
                echo "<p>Vui lòng điền đầy đủ và đúng định dạng các mục nhập liệu.</p>";
            }

            // Đóng kết nối
            $conn->close();
        }
        ?>
        
    </footer>
    <p class="footer-people">Make by Lê Ngọc Minh dob: 08/10/2003, Nguyễn Đăng Công dob: 26/09/2003, Trần Hoàng Minh dob: 13/12/2003 &copy;</p>
</body>
</html>

</div>