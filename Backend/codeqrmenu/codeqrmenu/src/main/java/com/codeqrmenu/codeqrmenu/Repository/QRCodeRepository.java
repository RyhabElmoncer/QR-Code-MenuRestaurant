package com.codeqrmenu.codeqrmenu.Repository;

import com.codeqrmenu.codeqrmenu.Model.QRCode;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QRCodeRepository extends JpaRepository<QRCode, Long> {
}

