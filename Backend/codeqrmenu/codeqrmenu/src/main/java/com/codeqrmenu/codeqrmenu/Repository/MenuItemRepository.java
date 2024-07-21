package com.codeqrmenu.codeqrmenu.Repository;
import com.codeqrmenu.codeqrmenu.Model.MenuItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface MenuItemRepository extends JpaRepository<MenuItem, Long> {
    // Custom query methods can be added here
}

