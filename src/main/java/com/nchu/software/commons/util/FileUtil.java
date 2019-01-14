package com.nchu.software.commons.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

/**
 * @ClassName FileUtil
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/10 11:02
 * @Version 1.0
 */
public class FileUtil {
    /**
     * 方法实现说明
     * @Author 范孝发
     * @Description 处理文件上传，返回文件名
     * @Date 15:39 2019/1/14
     * @Param [pathName, replyAppendix, request]
     * @exception
     * @return java.lang.String
     **/
    public static String upload(String pathName, MultipartFile replyAppendix, HttpServletRequest request) {
        //获得当前工程下的路径
        String path = request.getSession().getServletContext().getRealPath(pathName);
        //文件夹存不存在就新建一个
        File dir = new File(path);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        //判断附件是否为空，为空就附件字段为null
        if (replyAppendix != null && !replyAppendix.isEmpty()) {
            /**
             * 对文件名进行操作防止文件重名
             */
            //1，获取原始文件名
            String originalFilename = replyAppendix.getOriginalFilename();
            //2,截取源文件的文件名前缀,不带后缀
            String fileNamePrefix = originalFilename.substring(0, originalFilename.lastIndexOf("."));
            //3,加工处理文件名，原文件加上时间戳
            String newFileNamePrefix = fileNamePrefix + "_" +System.currentTimeMillis();
            //4,得到新文件名
            String newFileName = newFileNamePrefix + originalFilename.substring(originalFilename.lastIndexOf("."));
            //5,构建文件对象
            File file1 = new File(path + "/" + newFileName);
            //6,执行上传操作
            try {
                replyAppendix.transferTo(file1);
                return file1.getName(); //存入文件名称
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    /**
     * 方法实现说明
     * @Author 范孝发
     * @Description 处理文件下载
     * @Date 15:40 2019/1/14
     * @Param [pathName, fileName, request, response]
     * @exception
     * @return int
     **/
    public static int download(String pathName, String fileName, HttpServletRequest request, HttpServletResponse response) {
        try {
            // 获取上传文件的目录
            ServletContext sc = request.getSession().getServletContext();
            // 上传位置
            String fileSaveRootPath = sc.getRealPath(pathName);
            // 得到要下载的文件
            File file = new File(fileSaveRootPath + "/" + fileName);

            // 如果文件不存在
            if (!file.exists()) {
                return 0;
            }
            // 处理文件名
            String realname = getFileName(fileName);
            // 设置响应头，控制浏览器下载该文件
            response.setHeader("content-disposition", "attachment;filename="
                    + URLEncoder.encode(realname, "utf-8"));
            response.setCharacterEncoding("UTF-8");
            // 读取要下载的文件，保存到文件输入流
            FileInputStream in = new FileInputStream(fileSaveRootPath + "/" + fileName);
            // 创建输出流
            OutputStream out = response.getOutputStream();
            // 创建缓冲区
            byte buffer[] = new byte[1024];
            int len = 0;
            // 循环将输入流中的内容读取到缓冲区当中
            while ((len = in.read(buffer)) > 0) {
                // 输出缓冲区的内容到浏览器，实现文件下载
                out.write(buffer, 0, len);
            }
            // 关闭文件输入流
            in.close();
            // 关闭输出流
            out.close();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * 方法实现说明
     * @Author 范孝发
     * @Description 处理文件名，去除时间戳
     * @Date 15:41 2019/1/14
     * @Param [fileName]
     * @exception
     * @return java.lang.String
     **/
    public static String getFileName(String fileName){
        return fileName.substring(0,fileName.indexOf("_")) + fileName.substring(fileName.lastIndexOf("."));
    }
}
