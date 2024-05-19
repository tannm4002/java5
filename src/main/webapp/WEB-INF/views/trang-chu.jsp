<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <style>
        body::-webkit-scrollbar {
            display: none;
        }
    </style>
</head>
<body class="container-fluid">
<div class="container mt-3">
    <a class="btn btn-info" href="/sinh-vien/trang-chu">Làm mới</a>
    <h2 class="text-center text-info">Thêm Sinh Viên</h2>
    <form action="/sinh-vien/them" method="post" id="addForm">
        <div class="mb-3">
            <label for="maSinhVien" class="form-label">Mã Sinh Viên</label>
            <input type="text" class="form-control" id="maSinhVien" name="maSinhVien" required>
            <p class="text-danger" id="maSinhVienError" hidden>Mã sinh viên đã tồn tại</p>
        </div>
        <div class="mb-3">
            <label for="tenSinhVien" class="form-label">Tên Sinh Viên</label>
            <input type="text" class="form-control" id="tenSinhVien" name="tenSinhVien" required>
        </div>
        <div class="mb-3">
            <label for="ngaySinh" class="form-label">Ngày Sinh</label>
            <input type="date" class="form-control" id="ngaySinh" name="ngaySinh" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Giới Tính</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="gioiTinh" id="gioiTinhNam" value="true" required>
                <label class="form-check-label" for="gioiTinhNam">Nam</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="gioiTinh" id="gioiTinhNu" value="false" required>
                <label class="form-check-label" for="gioiTinhNu">Nữ</label>
            </div>
        </div>
        <div class="mb-3">
            <label for="chuyenNganh" class="form-label">Chuyên Ngành</label>
            <select class="form-select" id="chuyenNganh" name="chuyenNganh" required>
                <option value="">Chọn chuyên ngành</option>
                <option value="Công nghệ thông tin">Công nghệ thông tin</option>
                <option value="Marketing">Marketing</option>
                <option value="Tự động hóa">Tự động hóa</option>
                <option value="Thiết kế đồ họa">Thiết kế đồ họa</option>
                <option value="Xây dựng website">Xây dựng website</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <button id="btnThem" type="submit" class="btn btn-primary">Thêm Sinh Viên</button>
    </form>
</div>
<h2 class="text-center mt-3 text-success">DANH SÁCH SINH VIÊN</h2>
<%--Form tìm kiếm--%>
<form action="/sinh-vien/tim-kiem" method="get" class="d-flex justify-content-center">
    <input type="text" class="form-control" name="t" placeholder="Nhập từ khóa tìm kiếm">
    <button type="submit" class="btn btn-primary ms-2">Tìm kiếm</button>
</form>
<hr>
<%--Bộ lọc sinh viên--%>
<form action="/sinh-vien/loc" method="get" class="mt-3">
    <%--    Lọc theo năm sinh từ - đến--%>
    <div class="d-flex justify-content-center mb-2">
        <input type="text" name="tuNam" class="form-control me-2" placeholder="Từ năm" value="${param.tuNam}">
        <input type="text" name="denNam" class="form-control ms-2" placeholder="Đến năm" value="${param.denNam}">
    </div>
    <%--    Lọc theo giới tính--%>
    <div class="mb-2">
        <select name="gioiTinh" class="form-select me-2">
            <option value="">Chọn giới tính</option>
            <option value="true" ${param.gioiTinh == 'true' ? 'selected' : ''}>Nam</option>
            <option value="false" ${param.gioiTinh == 'false' ? 'selected' : ''}>Nữ</option>
        </select>
    </div>
    <select name="chuyenNganh" class="form-select">
        <option value="">Chọn chuyên ngành</option>
        <option value="Công nghệ thông tin" ${param.chuyenNganh == 'Công nghệ thông tin' ? 'selected' : ''}>Công nghệ thông tin</option>
        <option value="Marketing" ${param.chuyenNganh == 'Marketing' ? 'selected' : ''}>Marketing</option>
        <option value="Tự động hóa" ${param.chuyenNganh == 'Tự động hóa' ? 'selected' : ''}>Tự động hóa</option>
        <option value="Thiết kế đồ họa" ${param.chuyenNganh == 'Thiết kế đồ họa' ? 'selected' : ''}>Thiết kế đồ họa</option>
        <option value="Xây dựng website" ${param.chuyenNganh == 'Xây dựng website' ? 'selected' : ''}>Xây dựng website</option>
    </select>
    <button text-center type="submit" class="btn btn-primary mt-2">Lọc</button>
</form>
<table class="table table-header table-hover text-center align-middle">
    <thead>
    <tr>
        <th>STT</th>
        <th>Mã sinh viên</th>
        <th>Tên sinh viên</th>
        <th>Ngày sinh</th>
        <th>Giới tính</th>
        <th>Chuyên ngành</th>
        <th>Email</th>
        <th>Thao tác</th>
    </tr>
    </thead>
    <c:if test="${empty dsSinhVien}">
    <tr>
        <td colspan="8" class="text-danger fs-4">Không có sinh viên nào</td>
    </tr>
    <tbody>
    </c:if>
    <c:forEach items="${dsSinhVien}" var="sinhVien" varStatus="stt">
        <tr>
            <td>${stt.count}</td>
            <td class="maSinhVien">${sinhVien.maSinhVien}</td>
            <td>${sinhVien.tenSinhVien}</td>
            <td><fmt:formatDate value="${sinhVien.ngaySinh}" pattern="dd/MM/yyyy"/></td>
            <td>
                ${sinhVien.gioiTinh ? 'Nam' : 'Nữ'}
            </td>
            <td>${sinhVien.chuyenNganh}</td>
            <td>${sinhVien.email}</td>
            <td>
                <a href="/sinh-vien/chi-tiet/${sinhVien.maSinhVien}" class="btn btn-primary">Chi tiết</a>
                <a id="btnXoa" href="/sinh-vien/xoa/${sinhVien.maSinhVien}" class="btn btn-danger">Xóa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<!-- Modal Xóa-->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn có chắc chắn muốn xóa sinh viên này không?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <a href="" class="btn btn-danger" id="confirmDelete">Xóa</a>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    const btnXoa = document.querySelectorAll('#btnXoa');
    const confirmDelete = document.querySelector('#confirmDelete');
    const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
    btnXoa.forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            confirmDelete.href = e.target.href;
            deleteModal.show();
        });
    });
    let btnThem = document.getElementById('btnThem');
    btnThem.addEventListener('click', (e) => {
        let maSinhVien = document.getElementById('maSinhVien').value;
        let maSinhVienError = document.getElementById('maSinhVienError');
        let arrMaSinhVien = document.querySelectorAll('.maSinhVien');
        for (const ma of arrMaSinhVien) {
            if (maSinhVien === ma.textContent) {
                e.preventDefault();
                maSinhVienError.hidden = false;
                break;
            } else {
                maSinhVienError.hidden = true;
            }
        }
    });
</script>
</html>