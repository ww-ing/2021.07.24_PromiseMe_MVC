package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import common.util.CommonUtil;
import member.model.UserDAOMyBatis;
import member.model.UserVO;

public class JoinEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) 
	throws Exception {
		
		String username=req.getParameter("username");
		String userid=req.getParameter("userid");
		String pwd=req.getParameter("pwd");
		String hp1=req.getParameter("hp1");
		String hp2=req.getParameter("hp2");
		String hp3=req.getParameter("hp3");
		
		UserVO user = new UserVO(null,username,userid,pwd,hp1,hp2,hp3,null,"1");
		if(user.getUsername()==null || user.getUserid()==null){
			
			this.setRedirect(false);
			this.setViewPage("join.me");	
			return;
		}
		
		UserDAOMyBatis userDao=new UserDAOMyBatis();
		
		int	n = userDao.insertUser(user);

		String msg=(n>0)?"회원가입 성공! 로그인 페이지로 이동합니다":"회원가입 실패";
		String loc=(n>0)?"login.me":"javascript:history.back()";
		
		CommonUtil.addMsgLoc(req,msg,loc);
		
		this.setRedirect(false);
		this.setViewPage("msg.jsp");

	}

}