package com.example.servingwebcontent.WayLun.BorrowClassroom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.example.servingwebcontent.WayLun.Borrow.BorrowService;
import com.example.servingwebcontent.Daniel.Classroom.Classroom;
import com.example.servingwebcontent.Daniel.Classroom.ClassroomService;
import com.example.servingwebcontent.WayLun.BorrowForm;

@Controller
@RequestMapping(path = "/borrowclassroom")
public class BorrowClassroomController {

    private final BorrowClassroomService borrowClassroomService;
    private final BorrowService borrowService;
    private final ClassroomService classroomService;

    @Autowired
    public BorrowClassroomController(BorrowClassroomService borrowClassroomService, BorrowService borrowService, ClassroomService classroomService) {
        this.borrowClassroomService = borrowClassroomService;
        this.borrowService = borrowService;
        this.classroomService = classroomService;
    }

    /*@GetMapping("/addNewBorrowClassroom")
    public ModelAndView addNewBorrowClassroom(Model model) {
        ModelAndView modelAndView = new ModelAndView("WayLun/Borrow");
        modelAndView.addObject("borrowForm", new BorrowForm());

        Iterable<Classroom> classrooms = classroomService.findAll();
        modelAndView.addObject("classrooms", classrooms);
        return modelAndView;
    }

    @PostMapping("/addNewBorrowClassroom")
    public String addNewBorrowClassroom(@ModelAttribute("borrowCForm") BorrowForm borrowForm) {
        borrowService.save(borrowForm.getBorrow());
        borrowForm.getBorrowClassroom().setBorrow(borrowForm.getBorrow());
        borrowForm.getBorrowClassroom().setClassroom(borrowForm.getClassroom());
        borrowClassroomService.save(borrowForm.getBorrowClassroom());
        return "redirect:/borrowclassroom/addNewBorrowClassroom";
    }

    @GetMapping("/findAll")
    public ModelAndView findAll() {
        ModelAndView modelAndView = new ModelAndView("WayLun/BorrowClassroom");

        Iterable<BorrowClassroom> borrowClassrooms = borrowClassroomService.getBorrowClassroom();
        modelAndView.addObject("borrowClassrooms", borrowClassrooms);
        return modelAndView;
    }*/
}
