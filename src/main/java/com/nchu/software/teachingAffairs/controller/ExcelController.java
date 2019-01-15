package com.nchu.software.teachingAffairs.controller;

import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import cn.afterturn.easypoi.excel.entity.result.ExcelImportResult;
import com.nchu.software.commons.util.ExcelUtil;
import com.nchu.software.teachingAffairs.entity.AchievementEntity;
import com.nchu.software.teachingAffairs.entity.CourseEntity;
import com.nchu.software.teachingAffairs.entity.StudentEntity;
import com.nchu.software.teachingAffairs.service.impl.AchievementServiceImpl;
import com.nchu.software.teachingAffairs.service.impl.CourseServiceImpl;
import com.nchu.software.teachingAffairs.service.impl.StudentServiceImpl;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

import static cn.afterturn.easypoi.util.PoiCellUtil.getCellValue;


/**
 * @ClassName ExcelReader
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/11 00:10
 * @Version 1.0
 */

@Controller
public class ExcelController {

    @Autowired
    private AchievementServiceImpl achievementService;
    @Autowired
    private StudentServiceImpl studentService;
    @Autowired
    private CourseServiceImpl courseService;

    @RequestMapping("/achievement")
    public String uploadResults(@RequestParam("upfile1") MultipartFile file,Model model) throws Exception {
        if (!file.isEmpty()) {
            HSSFWorkbook workbook = new HSSFWorkbook(file.getInputStream());
            List<AchievementEntity> achievements = new ArrayList<>();
            if (workbook != null) {
                HSSFSheet sheet = null;
                String courseNo = null;
                for (int i = 0; i < workbook.getNumberOfSheets(); i++) {// 获取每个Sheet表
                    sheet = workbook.getSheetAt(i);
                    if (sheet != null) {
                        for (int j = 0; j < sheet.getPhysicalNumberOfRows(); j++) {// 获取每行
                            HSSFRow row = sheet.getRow(j);
                            if (row != null) {
                                for (int k = 0; k < row.getPhysicalNumberOfCells(); k++) {// 获取每个单元格
                                    if(ExcelUtil.getCellValue(row.getCell(k)).contains("课程编码")){
                                        String str = ExcelUtil.getCellValue(row.getCell(k));
                                        courseNo = str.substring(str.indexOf("课程编码")+5,str.indexOf("课程编码")+12);
                                    }
                                    if (ExcelUtil.isStuNo(row.getCell(k))) {
                                        AchievementEntity achievement = new AchievementEntity(getCellValue(row.getCell(k)), courseNo,
                                                getCellValue(row.getCell(k + 2)), getCellValue(row.getCell(k + 3)), getCellValue(row.getCell(k + 4)),
                                                getCellValue(row.getCell(k + 5)), getCellValue(row.getCell(k + 6)), getCellValue(row.getCell(k + 7)));
                                        k += 7;
                                        achievements.add(achievement);
                                    }
                                }
                            }
                        }
                    }

                }
               achievementService.listInsert(achievements);
            }
        }
        model.addAttribute("pageUrl","leadingexcel.jsp");
        return "teachingAffairs/bszn";
    }

    @RequestMapping("/student")
    public String uploadStudent(@RequestParam("upfile2") MultipartFile file ,Model model) throws Exception {
        if (!file.isEmpty()) {
            ImportParams params = new ImportParams();
            params.setNeedVerfiy(true);
            ExcelImportResult<StudentEntity> result = ExcelImportUtil.importExcelMore(
                    file.getInputStream(),StudentEntity.class, params);
            List<StudentEntity> list = result.getList();
            for(StudentEntity studentEntity : list){
                System.out.println(studentEntity.getName());
            }
            studentService.listInsert(list);
        }
        model.addAttribute("pageUrl","leadingexcel.jsp");
        return "teachingAffairs/bszn";
    }

    @RequestMapping("/course")
    public String uploadCourse(@RequestParam("upfile3") MultipartFile file, Model model) throws Exception {
        if (!file.isEmpty()) {
            ImportParams params = new ImportParams();
            params.setNeedVerfiy(true);
            ExcelImportResult<CourseEntity> result = ExcelImportUtil.importExcelMore(
                    file.getInputStream(),CourseEntity.class, params);
            List<CourseEntity> list = result.getList();
            for(CourseEntity courseEntity : list){
                System.out.println(courseEntity.getCourseName());
            }
            courseService.listInsert(list);
        }
        model.addAttribute("pageUrl","leadingexcel.jsp");
        return "teachingAffairs/bszn";
    }
    /*@RequestMapping("/download")
    public void download(HttpServletResponse response) {
        List<com.nchu.software.mailbox.entity.Student> list = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            com.nchu.software.mailbox.entity.Student student = new com.nchu.software.mailbox.entity.Student();
            student.setId("162011");
            student.setName("张三");
            student.setExperimentalResults(89);
            student.setNormalResults(23);
            student.setMidtermResults(56);
            student.setFinalResults(80);
            student.setTotalResults(90);
            student.setFlag(1);
            list.add(student);
        }
        try {
            // 告诉浏览器用什么软件可以打开此文件
            response.setHeader("content-Type", "application/vnd.ms-excel");
            // 下载文件的默认名称
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("成绩表.xls", "UTF-8"));
            //编码
            response.setCharacterEncoding("UTF-8");
            Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("成绩表", "成绩表"), Student.class, list);
            workbook.write(response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }*/

}
