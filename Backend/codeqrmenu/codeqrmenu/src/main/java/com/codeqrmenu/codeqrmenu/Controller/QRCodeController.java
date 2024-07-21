package com.codeqrmenu.codeqrmenu.Controller;

import com.codeqrmenu.codeqrmenu.Model.QRCode;
import com.codeqrmenu.codeqrmenu.Services.QRCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/qr-codes")
public class QRCodeController {
    @Autowired
    private QRCodeService qrCodeService;

    @PostMapping("/create")
    public ResponseEntity<QRCode> createQRCode(@RequestBody QRCode qrCode) {
        QRCode savedQRCode = qrCodeService.saveQRCode(qrCode);
        return ResponseEntity.ok(savedQRCode);
    }

    @GetMapping("/all")
    public ResponseEntity<List<QRCode>> getAllQRCodes() {
        List<QRCode> qrCodes = qrCodeService.getAllQRCodes();
        return ResponseEntity.ok(qrCodes);
    }
}
