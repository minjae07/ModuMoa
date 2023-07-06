package kr.board.controller;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.board.entity.Board;
import kr.board.entity.Criteria;
import kr.board.entity.Member;
import kr.board.entity.PageMaker;
import kr.board.entity.TblBoard;
import kr.board.entity.TblReply;
import kr.board.entity.Time;
import kr.board.service.BoardService;
import kr.board.service.TblReplyService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	private TblReplyService tblReplyService;
	

	@RequestMapping("/tboard.do")
	public String getList(Criteria cri, Model model, String keyWord, String searchType) {
		
		cri.setKeyWord(keyWord);
		cri.setSearchType(searchType);
		
		List<TblBoard> list = boardService.getList(cri);
		model.addAttribute("list",list);
		
		List<TblBoard> notice = boardService.getNotice();
		model.addAttribute("notice", notice);
		
		 int totalCount = boardService.totalCount(cri);
		 cri.setTotalCount(totalCount);
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("criteria", cri);
		return "board/list";
	}
	
	
	
	@GetMapping("/register.do")
	public String register() {
		return "board/register";
	}
	
	@PostMapping("/register.do")
	public String register(TblBoard vo, RedirectAttributes rttr) {
		boardService.register(vo);
		rttr.addFlashAttribute("result", vo.getIdx());
		
		Criteria cri = new Criteria();
		cri.setBoardType(vo.getBoardType());
		return "redirect:/tboard.do";
	}
	
	@RequestMapping(value = "/view.do")
	public String get(@RequestParam("idx") int idx, Model model, Criteria cri, String keyWord, String searchType) {
		
		//게시글
	    TblBoard vo = boardService.get(idx);
	    boardService.count(idx);
	    model.addAttribute("vo", vo);
	    
	    //댓글 list
	    List<TblReply> replyList = tblReplyService.getReplyList(idx);
	    
	    model.addAttribute("replyList", replyList);
	    
		
		//게시판 list
		
		List<TblBoard> list = boardService.getList(cri);
		model.addAttribute("list",list);
		
		List<TblBoard> notice = boardService.getNotice();
		model.addAttribute("notice", notice);
		
		 int totalCount = boardService.totalCount(cri);
		 cri.setTotalCount(totalCount);
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("pageMaker", pageMaker);
		 
	    return "board/view";
	}
	@GetMapping("/modify.do")
	public String modify(@RequestParam Integer idx, Model model) {
		 TblBoard vo = boardService.get(idx);
		 model.addAttribute("vo", vo);
		 return "board/modify";
	}
	
	@PostMapping("/modify.do")
	public String modify(TblBoard vo) {
		boardService.modify(vo);
		return "redirect:/tboard.do";
	}
	@RequestMapping("/remove")
	public String remove(@RequestParam int idx) {
		TblBoard vo = boardService.get(idx);
		int boardGroup = vo.getBoardGroup();
		/* int replyCount = boardService.hasReplies(boardGroup); */
			boardService.remove(idx);
		return "redirect:/tboard.do";
	}
	@GetMapping("/reply")
	public String reply(int idx, Model model) {
		TblBoard vo = boardService.get(idx);		
		model.addAttribute("vo",vo);
		return "board/reply";
				
	}	
	@PostMapping("/reply")
	public String reply(TblBoard vo) {
		boardService.reply(vo);
		return "redirect:/tboard.do"; 
	}
	
	@PostMapping("/tblReply")
	public String addReply(TblReply vo, RedirectAttributes rttr, HttpSession session) {
	    Member loginUser = (Member) session.getAttribute("mvo");
	    vo.setWriter(loginUser.getMemName()); 
	    tblReplyService.addReply(vo);
	    rttr.addAttribute("idx", vo.getIdx()); // 게시글 번호를 파라미터로 전달
	    
	    return "redirect:/view.do";
	}

	@RequestMapping("/temp.do")
	public String temp(@RequestParam int idx) {
			boardService.temp(idx);
		return "redirect:/tboard.do";
	}
	
	@RequestMapping("/delTemp.do")
	public String delTemp(@RequestParam int idx) {
			boardService.delTemp(idx);
		return "redirect:/tboard.do";
	}
	
	
}