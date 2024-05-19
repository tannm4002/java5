package app.springboot.entity;

import java.util.Date;

public class SinhVien {
    private String maSinhVien;
    private String tenSinhVien;
    private Date ngaySinh;
    private Boolean gioiTinh;
    private String chuyenNganh;
    private String email;

    public SinhVien() {
    }

    public SinhVien(String maSinhVien, String tenSinhVien, Date ngaySinh, Boolean gioiTinh, String chuyenNganh, String email) {
        this.maSinhVien = maSinhVien;
        this.tenSinhVien = tenSinhVien;
        this.ngaySinh = ngaySinh;
        this.gioiTinh = gioiTinh;
        this.chuyenNganh = chuyenNganh;
        this.email = email;
    }

    public String getMaSinhVien() {
        return maSinhVien;
    }

    public void setMaSinhVien(String maSinhVien) {
        this.maSinhVien = maSinhVien;
    }

    public String getTenSinhVien() {
        return tenSinhVien;
    }

    public void setTenSinhVien(String tenSinhVien) {
        this.tenSinhVien = tenSinhVien;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public Boolean getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(Boolean gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getChuyenNganh() {
        return chuyenNganh;
    }

    public void setChuyenNganh(String chuyenNganh) {
        this.chuyenNganh = chuyenNganh;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String getGioiTinhString() {
        return gioiTinh ? "Nam" : "Nữ";
    }

    @Override
    public String toString() {
        return "SinhVien{" +
                "maSinhVien='" + maSinhVien + '\'' +
                ", tenSinhVien='" + tenSinhVien + '\'' +
                ", ngaySinh=" + ngaySinh +
                ", gioiTinh=" + gioiTinh +
                ", chuyenNganh='" + chuyenNganh + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
