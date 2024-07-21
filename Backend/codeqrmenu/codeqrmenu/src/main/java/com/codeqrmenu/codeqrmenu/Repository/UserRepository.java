package com.codeqrmenu.codeqrmenu.Repository;

import java.util.List;
import java.util.Optional;

import com.codeqrmenu.codeqrmenu.Enum.Role;
import com.codeqrmenu.codeqrmenu.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.mongodb.repository.Query;

public interface UserRepository extends JpaRepository<User, Integer> {
  Optional<User> findByEmail(String email);

  // Méthode ajoutée pour vérifier l'existence d'un email
  boolean existsByEmail(String email);
  List<User> findByRole(Role role);

}
