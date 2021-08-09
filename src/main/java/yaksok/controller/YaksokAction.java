package yaksok.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import user.domain.UserVO;
import yaksok.model.YaksokDAOMyBatis;
import yaksok.model.YaksokVO;

public class YaksokAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) 
	throws Exception {
		
		//세션에서 꺼내오기
		HttpSession session=req.getSession();
		UserVO user=(UserVO) session.getAttribute("loginUser");
		int useridx=user.getIdx();
		String idx=Integer.toString(useridx);

		YaksokDAOMyBatis dao=new YaksokDAOMyBatis();
		
		
		//샘플
		int cnt=dao.getTableCount();
		
		req.setAttribute("msg", "약속 카운터수 체크");
		req.setAttribute("count", cnt);
		
		//selectAllYaksok
		List<YaksokVO> yaksokList=dao.selectAllYaksok(idx);
		System.out.println("yaksokList="+yaksokList);
		
		req.setAttribute("yaksokList", yaksokList);
		
		this.setViewPage("yaksok/yaksok.jsp");
		this.setRedirect(false);
		
	}

}
