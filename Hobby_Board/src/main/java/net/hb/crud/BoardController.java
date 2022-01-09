package net.hb.crud;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	@Autowired
	ServletContext application;  //파일업로드/다운로드할 때 application.getRrealPath("폴더")
	
	@Inject
	@Autowired
	BoardDAO dao;  //없으면 NullPointerException 에러 발생함
	
	@RequestMapping(value = "/boardWrite.sp", method = RequestMethod.GET)
	public String board_write() {
		logger.info("Enter board_write");
		return "boardWrite";  // WEB-INF/views/boardWrite.jsp문서 가리킴
	}//board_write
	
	
	@RequestMapping("/boardInsert.sp")
	public String board_insert(BoardDTO dto) {
        String path=application.getRealPath("./resources/upload");
        
        String img=dto.getUpload_f().getOriginalFilename();
        File file = new File(path, img);  //input type="file" name="upload_f"
        try{ dto.getUpload_f().transferTo(file); }catch(Exception ex){  }  
        dto.setImg_file_name(img);  

		dao.dbInsert(dto); 
		return "redirect:/boardList.sp";
	}//board_insert

	
	@RequestMapping("/boardList.sp")
	public String board_select(HttpServletRequest request, Model model) { //전체 출력
		//페이징 관련 변수
		int startRow, endRow;  
		String pnum;  
		int pageNUM;  
		int pageCount, startPage, endPage, tmp;
		
		//검색 관련 변수
		String skey="", sval="";
		String returnpage;
		
		skey = request.getParameter("keyfield");
		sval = request.getParameter("keyword");
		if(skey=="" || sval=="" || skey == null || sval == null || skey.equals("")) {
			skey="title";
			sval="";
		}
		returnpage = "&keyfield=" + skey + "&keyword=" + sval;
		
		pnum = request.getParameter("pageNum");
		if(pnum=="" || pnum==null || pnum.equals("")) {pnum="1";}  
		pageNUM = Integer.parseInt(pnum);
		startRow = ((pageNUM-1) * 10) + 1;
		endRow = pageNUM * 10;
		
		int Gtotal = dao.dbCountAllSearch(skey, sval);  //조회 개수
		int GGtotal = dao.dbCountAll();  //총 개수
		
		//총 페이지 개수
		if(Gtotal % 10 == 0){pageCount = Gtotal / 10;}
		else{pageCount = (Gtotal / 10) + 1;}
		tmp = (pageNUM - 1) % 10;
		startPage = pageNUM - tmp;
		endPage = startPage + 9;
		if(endPage > pageCount) {endPage = pageCount;}
		
		List<BoardDTO> LG = dao.dbSelect(startRow, endRow, skey, sval);  //시작행, 끝행, 검색필드, 검색어
		model.addAttribute("LG", LG);
		model.addAttribute("Gtotal", Gtotal);  //조회개수
		model.addAttribute("GGtotal", GGtotal);  //총 개수
		model.addAttribute("pageCount", pageCount);  //총 페이지 개수
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageNUM", pageNUM);  //선택한 페이지 숫자화
		model.addAttribute("returnpage", returnpage);  //검색 후 페이징
		return "boardList";  //WEB-INF/views/boardList.jsp   
	}//board_select

	
	@RequestMapping("/boardDetail.sp")
	public ModelAndView board_detail(@RequestParam("idx") int data, Model model) {  
		ModelAndView mav = new ModelAndView();
		BoardDTO dto = dao.dbDetail(data);
		mav.addObject("dto", dto);
		mav.setViewName("boardDetail");
		return mav;
	}//board_detail
	
	@RequestMapping("/boardDetail2.sp")
	public String board_detail2(@RequestParam("idx") int data, Model model) { //save  
		//HttpServletRequest request 이거 대신에 RequestParam으로 받아옴
		//int data2 = Integer.parseInt(request.getParameter("idx"));
		BoardDTO dto = dao.dbDetail(data);
		model.addAttribute("dto", dto);
		return "boardDetail";
	}//board_detail
	
	
	@RequestMapping("/boardDelete.sp")
	public String board_delete(@RequestParam("idx") int data) {
		dao.dbDelete(data);
		return "redirect:/boardList.sp";
	}
	
	
	@RequestMapping("/boardEdit.sp")
	public String board_edit(HttpServletRequest request, Model model) {
		int data = Integer.parseInt(request.getParameter("idx"));
		BoardDTO dto = dao.dbDetail(data);
		model.addAttribute("dto", dto);
		return "boardEdit";  //boardEdit.jsp
	}
	
	
	@RequestMapping("/boardEditSave.sp")
	public String board_edit(BoardDTO dto) {
        String path=application.getRealPath("./resources/upload");
        
        String img=dto.getUpload_f().getOriginalFilename();
        File file = new File(path, img);  //input type="file" name="upload_f"
        try{ dto.getUpload_f().transferTo(file); }catch(Exception ex){  }  
        dto.setImg_file_name(img);

        dao.dbEdit(dto);
		return "redirect:/boardList.sp";
	}
	
	
	@RequestMapping("/download.sp")
	public void board_download(HttpServletRequest request, HttpServletResponse response) {
		try {
			String filename= request.getParameter("fname");
			String path = application.getRealPath("./resources/upload");
			File file = new File(path, filename);
			response.setHeader("Content-Disposition", "attachment;filename=" + filename);
			
			InputStream is = new FileInputStream(file);  //inputStream은 추상클래스라 new 못 씀
			OutputStream out = response.getOutputStream();
			
			byte[] bt = new byte[(int)file.length()];  //long형이라 int형으로 변환해줌
			is.read(bt, 0, bt.length);
			out.write(bt);
			
			is.close();
			out.close();
		}catch(Exception e) {System.out.println("에러 이유: " + e.toString());}
	}//board_download

	
}//BoardController
