package com.example.servingwebcontent.Daniel.Equipment;


import com.example.servingwebcontent.Daniel.Equipment.Equipment;
import com.example.servingwebcontent.Daniel.Equipment.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(path = "/equipment")
public class EquipmentController {

    private final EquipmentService equipmentService;

    @Autowired
    public EquipmentController(EquipmentService equipmentService) {
        this.equipmentService = equipmentService;
    }

    @GetMapping
    public List<Equipment> getEquipment(){
        return equipmentService.findAll();
    }

    @GetMapping("/findAll")
    public ModelAndView findAll() {
        ModelAndView modelAndView = new ModelAndView("Daniel/findAllEquipment");

        // Retrieve data from MySQL and add it to the model
        Iterable<Equipment> equipmentList = equipmentService.findAll();
        modelAndView.addObject("equipmentList", equipmentList);
        return modelAndView;
    }

    @PostMapping("/addNewEquipment")
    public String addNewEquipment(Equipment newEquipment){
        equipmentService.save(newEquipment);
        return "redirect:/equipment/findAll";
    }

    @GetMapping("/editEquipment")
    public ModelAndView editEquipmentForm(@RequestParam Long equipmentId) {
        ModelAndView modelAndView = new ModelAndView("Daniel/editEquipment");
        Optional<Equipment> optionalEquipment = equipmentService.findById(equipmentId);
        Equipment equipment = optionalEquipment.orElse(null); // or handle it in a way that suits your logic
        modelAndView.addObject("equipment", equipment);
        return modelAndView;
    }

    @PostMapping("/editEquipment")
    public String editEquipment(@ModelAttribute Equipment updatedEquipment) {
        equipmentService.save(updatedEquipment);
        return "redirect:/equipment/findAll";
    }

    @PostMapping("/deleteEquipment")
    public String deleteEquipment(@RequestParam Long equipmentId) {
        equipmentService.deleteById(equipmentId);
        return "redirect:/equipment/findAll";
    }

}