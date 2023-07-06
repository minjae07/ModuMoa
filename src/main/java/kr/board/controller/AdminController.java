package kr.board.controller;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

import kr.board.entity.Member;
import kr.board.entity.PageMaker;
import kr.board.mapper.MemberMapper;
import kr.board.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	MemberService memService;
	
	@GetMapping
	public RedirectView viewAdmin(Model model) {
		return new RedirectView("/admin/category");
	}
	
	@GetMapping("/category")
	public String viewCategory(Model model) {
		// View attribute
		model.addAttribute("template", "admin/category");
		return "admin/index";
	}
	
	@GetMapping("/users")
	public String viewAccount(Model model) {
		// View attribute
		 List<Member> memList = memService.getmemList(); 
	        model.addAttribute("memList", memList);
		return "admin/users";
	}
	
	@Delete("/userDel")
	public String userDel(int idx) {
		System.out.print("test");
		return "redirect:/admin/ users";
	}
}
	
