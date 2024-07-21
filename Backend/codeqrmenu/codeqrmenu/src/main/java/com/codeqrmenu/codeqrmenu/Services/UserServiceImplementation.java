package com.codeqrmenu.codeqrmenu.Services;
import com.codeqrmenu.codeqrmenu.DTO.UserRequest;
import com.codeqrmenu.codeqrmenu.Model.User;
import com.codeqrmenu.codeqrmenu.Repository.UserRepository;
import com.codeqrmenu.codeqrmenu.user.ChangePasswordRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;
import java.util.NoSuchElementException;

@Service
@RequiredArgsConstructor
public class UserServiceImplementation {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public User ajouterUser(UserRequest userRequest) {
        User user = new User();
        // Map UserRequest fields to User entity
        user.setEmail(userRequest.getEmail());
        user.setFirstName(userRequest.getFirstName());
        user.setLastName(userRequest.getLastName());

        user.setPassword(passwordEncoder.encode(userRequest.getPassword()));
        user.setRole(userRequest.getRole());
        //user.setUserStatus(userRequest.());
        // Add other mappings as needed
        return userRepository.save(user);
    }

  


    public void changePassword(ChangePasswordRequest request, Principal connectedUser) {

        var user = (User) ((UsernamePasswordAuthenticationToken) connectedUser).getPrincipal();

        // check if the current password is correct
        if (!passwordEncoder.matches(request.getCurrentPassword(), user.getPassword())) {
            throw new IllegalStateException("Wrong password");
        }
        // check if the two new passwords are the same
        if (!request.getNewPassword().equals(request.getConfirmationPassword())) {
            throw new IllegalStateException("Password are not the same");
        }

        // update the password
        user.setPassword(passwordEncoder.encode(request.getNewPassword()));

        // save the new password
        userRepository.save(user);
    }





}
