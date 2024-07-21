package com.codeqrmenu.codeqrmenu.DTO;

import com.codeqrmenu.codeqrmenu.Enum.Role;
import lombok.*;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserRequest {
    private String email;
    private String password;
    private String firstName;
    private String lastName;

    private Role role = Role.CLIENT;
}
