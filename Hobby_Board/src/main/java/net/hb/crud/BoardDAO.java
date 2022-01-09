package net.hb.crud;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate temp;  

	public void dbInsert(BoardDTO dto) {
		 temp.insert("board.add", dto);  
		 System.out.println("dao 저장 성공");
	}//dbInsert

	
	public List<BoardDTO> dbSelect(int startRow, int endRow, String skey, String sval) {
		BoardDTO dto = new BoardDTO();
		dto.setStartRow(startRow);
		dto.setEndRow(endRow);
		dto.setSkey(skey);  //필드
		dto.setSval(sval);  //검색어
		List<BoardDTO> list = temp.selectList("board.selectAll", dto);
		return list;
	}//dbSelect
	
	
	public int dbCountAll() {  //전체개수
		int GGtotal = temp.selectOne("board.countAll"); 
		return GGtotal;
	}//dbCountAll
	
	
	public int dbCountAllSearch(String skey, String sval) {  //조회 개수
		BoardDTO dto = new BoardDTO();
		dto.setSkey(skey);
		dto.setSval(sval);
		int Gtotal = temp.selectOne("board.countAllSearch", dto);  
		return Gtotal;
	}//dbCountAllSearch
	
	
	public BoardDTO dbDetail(int code) {
		BoardDTO dto = temp.selectOne("board.detail", code);
		return dto;
	}//dbDetail
	
	
	public void dbDelete(int code) {
		temp.delete("board.del", code);  
		System.out.println("dao 삭제 성공");
	}//dbDelete
	
	
	public void dbEdit(BoardDTO dto) {
		temp.update("board.update", dto);
	}

}//BoardDAO
