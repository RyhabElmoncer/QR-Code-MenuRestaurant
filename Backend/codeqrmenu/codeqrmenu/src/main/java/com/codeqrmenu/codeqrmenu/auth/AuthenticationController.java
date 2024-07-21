package com.codeqrmenu.codeqrmenu.auth;

import com.codeqrmenu.codeqrmenu.DTO.UserRequest;
import com.codeqrmenu.codeqrmenu.Services.UserServiceImplementation;
import com.google.firebase.auth.FirebaseAuthException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200")
public class AuthenticationController {

  private final AuthenticationService service;
  private final UserServiceImplementation userService;

  @PostMapping("/signup")
  public ResponseEntity<?> signup(@RequestBody UserRequest userRequest) {
    try {
      userService.ajouterUser(userRequest);
      return ResponseEntity.ok(new ResponseMessage("Utilisateur enregistré avec succès"));
    } catch (Exception e) {
      return ResponseEntity.badRequest().body(new ResponseMessage("Erreur lors de l'inscription : " + e.getMessage()));
    }
  }

  @PostMapping("/authenticate")
  public ResponseEntity<?> authenticate(@RequestBody AuthenticationRequest request) {
    try {
      AuthenticationResponse response = service.authenticate(request);
      return ResponseEntity.ok(response);
    } catch (Exception e) {
      return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(new ResponseMessage("Authentication failed: " + e.getMessage()));
    }
  }

  @PostMapping("/refresh-token")
  public void refreshToken(HttpServletRequest request, HttpServletResponse response) throws IOException {
    service.refreshToken(request, response);
  }



}
