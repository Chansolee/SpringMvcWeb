package kr.or.ddit.commons;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

@RestController
public class QrController {
 
    @GetMapping("/qr.do")
    public Object createQr() throws WriterException, IOException {
        int width = 200;
        int height = 200;
        String testUrl = "https://192.168.143.26/Webstudy05_SpirngMVC/login/loginForm.do";
//        String testUrl = "babo mungchung seoyoun";
        BitMatrix matrix = new MultiFormatWriter().encode(testUrl, BarcodeFormat.QR_CODE, width, height);
 
        try (ByteArrayOutputStream out = new ByteArrayOutputStream();) {
            MatrixToImageWriter.writeToStream(matrix, "PNG", out);
            return ResponseEntity.ok()
                    .contentType(org.springframework.http.MediaType.IMAGE_PNG)
                    .body(out.toByteArray());
        }
    }
}