package com.nchu.software.commons.util;

import com.nchu.software.commons.Exception.ThisSystemException;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ThisSystemUtil {
    public static String checkBlank(String messgae,String target){

        if (target == null|| target.trim().equals("")){
            throw new ThisSystemException(messgae);
        }
        return target;
    }
    public static String $(String messgae,String target){
        return checkBlank(messgae,target);
    }

    public static void checkNotNULL(String message,Object o){
        if (o == null){
            throw new ThisSystemException(message);
        }
    }

    public static void checkNotEmpty(String message,List o){
        if (o.size() == 0){
            throw new ThisSystemException(message);
        }
    }

    public static void checkEmpty(String message,List o){
        if (o.size() != 0){
            throw new ThisSystemException(message);
        }
    }

    public static void checkNULL(String message,Object o){
        if (o != null){
            throw new ThisSystemException(message);
        }
    }

    public static void checkEquals(String message,Object s1,Object s2){
        if (s1==null?s2!=s1:!s1.equals(s2)){
            throw new ThisSystemException(message);
        }
    }
    public static void checkNotEquals(String message,Object s1,Object s2){
        if (s1==null?s2==s1:s1.equals(s2)){
            throw new ThisSystemException(message);
        }
    }

    public static void assertPatternMatch(String message,String reg,String target){
        Pattern pattern = Pattern.compile(reg);
        Matcher matcher = pattern.matcher(target);
        if (!matcher.matches()){
            throw new ThisSystemException(message);
        }
    }

    public static String uuid(){
        String uuid = UUID.randomUUID().toString();
        char[] cs = new char[32];
        char c;
        for (int i = 0,j = 0;i<uuid.length();++i){
            if ((c=uuid.charAt(i)) != '-'){
                cs[j++]=c;
            }
        }
        return new String(cs);

    }

    public static String md5(String OrderNo) {
        String result = OrderNo;
        String re_md5 = new String();
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(result.getBytes());
            byte b[] = md.digest();
            int i;
            StringBuffer buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0){
                    i += 256;
                }
                if (i < 16){
                    buf.append("0");
                }
                buf.append(Integer.toHexString(i));
            }
            re_md5 = buf.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return re_md5.toUpperCase();
    }

    public static void assertTure(String message,boolean b){
        if (!b){
            throw new ThisSystemException(message);
        }
    }

    public static void assertFalse(String message,boolean b){
        if (b){
            throw new ThisSystemException(message);
        }
    }
}
