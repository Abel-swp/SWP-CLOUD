package project;

import org.apache.commons.codec.binary.Base64;

public class Encryption {
    /**
     * 문자열 암호화 하기
     */
    public static String getEncoding(String str){
        return Base64.encodeBase64String(str.getBytes());
    }
    /**
     * 문자열 복호화 하기
     */
    public static String getDecoding(String str){
        return new String(Base64.decodeBase64(str));
    }
    
    public static void main(String[] args) {
    	
    	String abc = getEncoding("가나다라");
    	System.out.println(abc);
    	
    	String def = getDecoding(abc);
    	System.out.println(def);
    	
    }
    
}
