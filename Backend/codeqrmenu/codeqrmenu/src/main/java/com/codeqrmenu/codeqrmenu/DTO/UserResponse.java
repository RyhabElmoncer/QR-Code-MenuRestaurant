package com.codeqrmenu.codeqrmenu.DTO;
import com.codeqrmenu.codeqrmenu.Enum.Role;
import lombok.*;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserResponse {
    private String email;
    private String firstName;
    private String lastName;
    private String phone;

    private Role role;

    
}
