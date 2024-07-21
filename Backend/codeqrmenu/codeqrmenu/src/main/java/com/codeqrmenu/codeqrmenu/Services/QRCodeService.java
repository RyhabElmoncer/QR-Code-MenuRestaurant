package com.codeqrmenu.codeqrmenu.Services;

import com.codeqrmenu.codeqrmenu.Model.QRCode;
import com.codeqrmenu.codeqrmenu.Repository.QRCodeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QRCodeService {
    @Autowired
    private QRCodeRepository qrCodeRepository;

    public QRCode saveQRCode(QRCode qrCode) {
        return qrCodeRepository.save(qrCode);
    }

    public List<QRCode> getAllQRCodes() {
        return qrCodeRepository.findAll();
    }
}

