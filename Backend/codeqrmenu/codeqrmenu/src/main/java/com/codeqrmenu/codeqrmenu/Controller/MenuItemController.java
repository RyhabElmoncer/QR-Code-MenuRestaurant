package com.codeqrmenu.codeqrmenu.Controller;

import com.codeqrmenu.codeqrmenu.Model.MenuItem;
import com.codeqrmenu.codeqrmenu.Services.MenuItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/menu")
public class MenuItemController {
    @Autowired
    private MenuItemService menuItemService;

    @PostMapping("/add")
    public ResponseEntity<MenuItem> addMenuItem(@RequestBody MenuItem menuItem) {
        MenuItem savedMenuItem = menuItemService.saveMenuItem(menuItem);
        return ResponseEntity.ok(savedMenuItem);
    }

   /* @PutMapping("/update/{id}")
    public ResponseEntity<MenuItem> updateMenuItem(@PathVariable Long id, @RequestBody MenuItem menuItemDetails) {
        Optional<MenuItem> menuItem = menuItemService.findById(id);
        if (menuItem == null) {
            return ResponseEntity.notFound().build();
        }

        menuItem.set(menuItemDetails.getName());
        menuItem.setPrice(menuItemDetails.getPrice());

        MenuItem updatedMenuItem = menuItemService.saveMenuItem(menuItem);
        return ResponseEntity.ok(updatedMenuItem);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteMenuItem(@PathVariable Long id) {
        MenuItem menuItem = menuItemService.findById(id);
        if (menuItem == null) {
            return ResponseEntity.notFound().build();
        }

        menuItemService.deleteMenuItem(id);
        return ResponseEntity.ok().build();
    }
*/
    @GetMapping("/all")
    public ResponseEntity<List<MenuItem>> getAllMenuItems() {
        List<MenuItem> menuItems = menuItemService.getAllMenuItems();
        return ResponseEntity.ok(menuItems);
    }
}
