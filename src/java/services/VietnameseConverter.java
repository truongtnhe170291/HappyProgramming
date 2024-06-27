/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;


import java.util.HashMap;
import java.util.Map;
/**
 *
 * @author ADMIN
 */
public class VietnameseConverter {
    private static final Map<Character, Character> VIETNAMESE_CHAR_MAP = new HashMap<>();

    static {
        VIETNAMESE_CHAR_MAP.put('à', 'a'); VIETNAMESE_CHAR_MAP.put('á', 'a'); VIETNAMESE_CHAR_MAP.put('ả', 'a');
        VIETNAMESE_CHAR_MAP.put('ã', 'a'); VIETNAMESE_CHAR_MAP.put('ạ', 'a'); VIETNAMESE_CHAR_MAP.put('ă', 'a');
        VIETNAMESE_CHAR_MAP.put('ằ', 'a'); VIETNAMESE_CHAR_MAP.put('ắ', 'a'); VIETNAMESE_CHAR_MAP.put('ẳ', 'a');
        VIETNAMESE_CHAR_MAP.put('ẵ', 'a'); VIETNAMESE_CHAR_MAP.put('ặ', 'a'); VIETNAMESE_CHAR_MAP.put('â', 'a');
        VIETNAMESE_CHAR_MAP.put('ầ', 'a'); VIETNAMESE_CHAR_MAP.put('ấ', 'a'); VIETNAMESE_CHAR_MAP.put('ẩ', 'a');
        VIETNAMESE_CHAR_MAP.put('ẫ', 'a'); VIETNAMESE_CHAR_MAP.put('ậ', 'a');
        VIETNAMESE_CHAR_MAP.put('đ', 'd');
        VIETNAMESE_CHAR_MAP.put('è', 'e'); VIETNAMESE_CHAR_MAP.put('é', 'e'); VIETNAMESE_CHAR_MAP.put('ẻ', 'e');
        VIETNAMESE_CHAR_MAP.put('ẽ', 'e'); VIETNAMESE_CHAR_MAP.put('ẹ', 'e'); VIETNAMESE_CHAR_MAP.put('ê', 'e');
        VIETNAMESE_CHAR_MAP.put('ề', 'e'); VIETNAMESE_CHAR_MAP.put('ế', 'e'); VIETNAMESE_CHAR_MAP.put('ể', 'e');
        VIETNAMESE_CHAR_MAP.put('ễ', 'e'); VIETNAMESE_CHAR_MAP.put('ệ', 'e');
        VIETNAMESE_CHAR_MAP.put('ì', 'i'); VIETNAMESE_CHAR_MAP.put('í', 'i'); VIETNAMESE_CHAR_MAP.put('ỉ', 'i');
        VIETNAMESE_CHAR_MAP.put('ĩ', 'i'); VIETNAMESE_CHAR_MAP.put('ị', 'i');
        VIETNAMESE_CHAR_MAP.put('ò', 'o'); VIETNAMESE_CHAR_MAP.put('ó', 'o'); VIETNAMESE_CHAR_MAP.put('ỏ', 'o');
        VIETNAMESE_CHAR_MAP.put('õ', 'o'); VIETNAMESE_CHAR_MAP.put('ọ', 'o'); VIETNAMESE_CHAR_MAP.put('ô', 'o');
        VIETNAMESE_CHAR_MAP.put('ồ', 'o'); VIETNAMESE_CHAR_MAP.put('ố', 'o'); VIETNAMESE_CHAR_MAP.put('ổ', 'o');
        VIETNAMESE_CHAR_MAP.put('ỗ', 'o'); VIETNAMESE_CHAR_MAP.put('ộ', 'o'); VIETNAMESE_CHAR_MAP.put('ơ', 'o');
        VIETNAMESE_CHAR_MAP.put('ờ', 'o'); VIETNAMESE_CHAR_MAP.put('ớ', 'o'); VIETNAMESE_CHAR_MAP.put('ở', 'o');
        VIETNAMESE_CHAR_MAP.put('ỡ', 'o'); VIETNAMESE_CHAR_MAP.put('ợ', 'o');
        VIETNAMESE_CHAR_MAP.put('ù', 'u'); VIETNAMESE_CHAR_MAP.put('ú', 'u'); VIETNAMESE_CHAR_MAP.put('ủ', 'u');
        VIETNAMESE_CHAR_MAP.put('ũ', 'u'); VIETNAMESE_CHAR_MAP.put('ụ', 'u'); VIETNAMESE_CHAR_MAP.put('ư', 'u');
        VIETNAMESE_CHAR_MAP.put('ừ', 'u'); VIETNAMESE_CHAR_MAP.put('ứ', 'u'); VIETNAMESE_CHAR_MAP.put('ử', 'u');
        VIETNAMESE_CHAR_MAP.put('ữ', 'u'); VIETNAMESE_CHAR_MAP.put('ự', 'u');
        VIETNAMESE_CHAR_MAP.put('ỳ', 'y'); VIETNAMESE_CHAR_MAP.put('ý', 'y'); VIETNAMESE_CHAR_MAP.put('ỷ', 'y');
        VIETNAMESE_CHAR_MAP.put('ỹ', 'y'); VIETNAMESE_CHAR_MAP.put('ỵ', 'y');
    }

    public static String removeDiacritics(String input) {
        StringBuilder sb = new StringBuilder();
        for (char c : input.toCharArray()) {
            if (VIETNAMESE_CHAR_MAP.containsKey(c)) {
                sb.append(VIETNAMESE_CHAR_MAP.get(c));
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }
    
    //test
    public static void main(String[] args) {
        String message = "chuyển khoản";
        String result = removeDiacritics(message);
        System.out.println(result); // Should print "chuyen khoan"
    }
}
