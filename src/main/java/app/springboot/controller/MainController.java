package app.springboot.controller;

import app.springboot.entity.SinhVien;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@SpringBootApplication
@Controller
public class MainController {
    static List<SinhVien> DS_SINH_VIEN = new ArrayList<>();

    static {
        try {
            DS_SINH_VIEN.addAll(List.of(
                    new SinhVien("SV001", "Nguyễn Văn A", new SimpleDateFormat("dd/MM/yyyy").parse("17/06/2000"), true, "Công nghệ thông tin", "Email1@example.com"),
                    new SinhVien("SV0012", "Nguyễn Văn A", new SimpleDateFormat("dd/MM/yyyy").parse("17/06/2009"), true, "Công nghệ thông tin", "Email1@example.com"),
                    new SinhVien("SV0013", "Nguyễn Văn A", new SimpleDateFormat("dd/MM/yyyy").parse("17/06/2008"), true, "Công nghệ thông tin", "Email1@example.com"),
                    new SinhVien("SV002", "Nguyễn Thị B", new SimpleDateFormat("dd/MM/yyyy").parse("17/06/2007"), false, "Marketing", "Email2@example.com"),
                    new SinhVien("SV003", "Nguyễn Văn C", new SimpleDateFormat("dd/MM/yyyy").parse("17/06/2002"), true, "Tự động hóa", "Email3@example.com"),
                    new SinhVien("SV004", "Nguyễn Thị D", new SimpleDateFormat("dd/MM/yyyy").parse("17/06/2003"), false, "Thiết kế đồ họa", "Email4@example.com"),
                    new SinhVien("SV005", "Nguyễn Văn E", new SimpleDateFormat("dd/MM/yyyy").parse("17/06/2004"), true, "Xây dựng website", "Email5@example.com"),
                    new SinhVien("SV006", "Nguyễn Văn E", new SimpleDateFormat("dd/MM/yyyy").parse("17/06/2004"), true, "Xây dựng website", "Email5@example.com"),
                    new SinhVien("SV007", "Nguyễn Văn E", new SimpleDateFormat("dd/MM/yyyy").parse("17/06/2004"), true, "Xây dựng website", "Email5@example.com"),
                    new SinhVien("SV008", "Nguyễn Văn E", new SimpleDateFormat("dd/MM/yyyy").parse("17/06/2004"), true, "Xây dựng website", "Email5@example.com")
            ));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("/sinh-vien/trang-chu")
    public String trangChu(Model model) {
        model.addAttribute("dsSinhVien", DS_SINH_VIEN);
        return "trang-chu";
    }

    @PostMapping("/sinh-vien/them")
    public String themSinhVien(@RequestParam Map<String, String> params) throws ParseException {
        System.out.println(params.get("gioiTinh"));
        DS_SINH_VIEN.add(new SinhVien(
                params.get("maSinhVien"),
                params.get("tenSinhVien"),
                new SimpleDateFormat("yyyy-MM-dd").parse(params.get("ngaySinh")),
                Boolean.parseBoolean(params.get("gioiTinh")),
                params.get("chuyenNganh"),
                params.get("email")
        ));
        return "redirect:/sinh-vien/trang-chu";
    }

    @GetMapping("/sinh-vien/xoa/{maSinhVien}")
    public String xoaSinhVien(@PathVariable String maSinhVien) {
        DS_SINH_VIEN.removeIf(sv -> sv.getMaSinhVien().equals(maSinhVien));
        return "redirect:/sinh-vien/trang-chu";
    }

    @GetMapping("/sinh-vien/chi-tiet/{maSinhVien}")
    public String chiTietSinhVien(@PathVariable String maSinhVien, Model model) {
        SinhVien sinhVien = DS_SINH_VIEN.stream().filter(sv -> sv.getMaSinhVien().equals(maSinhVien)).findFirst().orElse(null);
        model.addAttribute("sinhVien", sinhVien);
        return "chi-tiet";
    }

    @PostMapping("/sinh-vien/cap-nhat")
    public String capNhatSinhVien(@RequestParam Map<String, String> params) throws ParseException {
        SinhVien sinhVien = DS_SINH_VIEN.stream().filter(sv -> sv.getMaSinhVien().equals(params.get("maSinhVien"))).findFirst().orElse(null);
        if (sinhVien != null) {
            sinhVien.setTenSinhVien(params.get("tenSinhVien"));
            sinhVien.setNgaySinh(new SimpleDateFormat("yyyy-MM-dd").parse(params.get("ngaySinh")));
            sinhVien.setGioiTinh(Boolean.parseBoolean(params.get("gioiTinh")));
            sinhVien.setChuyenNganh(params.get("chuyenNganh"));
            sinhVien.setEmail(params.get("email"));
        }
        return "redirect:/sinh-vien/trang-chu";
    }

    @GetMapping("/sinh-vien/tim-kiem")
    public String timKiemSinhVien(@RequestParam String t, Model model) {
        List<SinhVien> dsSinhVien = DS_SINH_VIEN.stream().filter(sv -> sv.getTenSinhVien().toLowerCase().contains(t.toLowerCase())
                || sv.getMaSinhVien().toLowerCase().contains(t.toLowerCase())
                || sv.getChuyenNganh().toLowerCase().contains(t.toLowerCase())
                || sv.getEmail().toLowerCase().contains(t.toLowerCase())
                || sv.getNgaySinh().toString().contains(t.toLowerCase())
                || sv.getGioiTinhString().toLowerCase().contains(t.toLowerCase())
        ).toList();
        model.addAttribute("dsSinhVien", dsSinhVien);
        return "trang-chu";
    }
    @GetMapping("/sinh-vien/loc")
public String locSinhVien(@RequestParam String tuNam, @RequestParam String denNam, @RequestParam String gioiTinh, @RequestParam String chuyenNganh, Model model) {
    List<SinhVien> dsSinhVien = DS_SINH_VIEN;
    if (!tuNam.isEmpty()) {
        Date tuNamDate = convertStringToDate(tuNam);
        dsSinhVien = dsSinhVien.stream().filter(sv -> sv.getNgaySinh().after(tuNamDate)).collect(Collectors.toList());
    }
    if (!denNam.isEmpty()) {
        Date denNamDate = convertStringToDate(denNam);
        dsSinhVien = dsSinhVien.stream().filter(sv -> sv.getNgaySinh().before(denNamDate)).collect(Collectors.toList());
    }
    if (!gioiTinh.isEmpty()) {
        dsSinhVien = dsSinhVien.stream().filter(sv -> sv.getGioiTinh() == Boolean.parseBoolean(gioiTinh)).collect(Collectors.toList());
    }
    if (!chuyenNganh.isEmpty()) {
        dsSinhVien = dsSinhVien.stream().filter(sv -> sv.getChuyenNganh().equals(chuyenNganh)).collect(Collectors.toList());
    }
    model.addAttribute("dsSinhVien", dsSinhVien);
    return "trang-chu";
}

    private Date convertStringToDate(String dateInString) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
        try {
            return formatter.parse(dateInString);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
    public static void main(String[] args) {
        SpringApplication.run(MainController.class, args);
    }
}
