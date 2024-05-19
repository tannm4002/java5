<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!doctype html>
<html>
<head>
    <title>Chi tiết sinh viên</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-3">
    <h2 class="text-center text-info">Chi Tiết Sinh Viên</h2>
    <form action="/sinh-vien/cap-nhat" method="post">
        <div class="mb-3">
            <label for="maSinhVien" class="form-label">Mã Sinh Viên</label>
            <input readonly type="text" class="form-control" id="maSinhVien" name="maSinhVien" value="${sinhVien.maSinhVien}" required>
        </div>
        <div class="mb-3">
            <label for="tenSinhVien" class="form-label">Tên Sinh Viên</label>
            <input type="text" class="form-control" id="tenSinhVien" name="tenSinhVien" value="${sinhVien.tenSinhVien}" required>
        </div>
        <div class="mb-3">
            <label for="ngaySinh" class="form-label">Ngày Sinh</label>
            <input type="date" class="form-control" id="ngaySinh" name="ngaySinh" value="<fmt:formatDate value="${sinhVien.ngaySinh}" pattern="yyyy-MM-dd"/>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Giới Tính</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="gioiTinh" id="gioiTinhNam" value="true" ${sinhVien.gioiTinh ? 'checked' : ''} required>
                <label class="form-check-label" for="gioiTinhNam">Nam</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="gioiTinh" id="gioiTinhNu" value="false" ${!sinhVien.gioiTinh ? 'checked' : ''} required>
                <label class="form-check-label" for="gioiTinhNu">Nữ</label>
            </div>
        </div>
        <div class="mb-3">
            <label for="chuyenNganh" class="form-label">Chuyên Ngành</label>
            <select class="form-select" id="chuyenNganh" name="chuyenNganh" required>
                <option value="">Chuyên ngành</option>
                <option value="Công nghệ thông tin" ${sinhVien.chuyenNganh == 'Công nghệ thông tin' ? 'selected' : ''}>Công nghệ thông tin</option>
                <option value="Marketing" ${sinhVien.chuyenNganh == 'Marketing' ? 'selected' : ''}>Marketing</option>
                <option value="Tự động hóa" ${sinhVien.chuyenNganh == 'Tự động hóa' ? 'selected' : ''}>Tự động hóa</option>
                <option value="Thiết kế đồ họa" ${sinhVien.chuyenNganh == 'Thiết kế đồ họa' ? 'selected' : ''}>Thiết kế đồ họa</option>
                <option value="Xây dựng website" ${sinhVien.chuyenNganh == 'Xây dựng website' ? 'selected' : ''}>Xây dựng website</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="${sinhVien.email}" required>
        </div>
        <button type="submit" class="btn btn-primary">Cập nhật</button>
        <a class="btn btn-info" href="/sinh-vien/trang-chu">Quay lại</a>
    </form>
</div>
</body>
</html>