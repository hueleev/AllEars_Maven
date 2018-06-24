int pageSize = 5;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String pageNum = req.getParameter("pageNum");
			if (pageNum==null || pageNum == "") {
				pageNum = "1";}
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage -1) * pageSize +1;
			int endRow = currentPage * pageSize;
			int count = 0;
			int number = 0;
			List userList = null;
			UserlistDBBean dbPro = UserlistDBBean.getInstance();
			count = dbPro.getUserCount();
			if (count >0){
				userList = dbPro.getUsers(startRow,endRow);}
				number = count - (currentPage - 1)*pageSize;
			
			int bottomLine = 3;
			int pageCount =count/pageSize
					+(count % pageSize == 0 ? 0 : 1);
			int startPage = 1 + (currentPage -1) / bottomLine * bottomLine;
			int endPage = startPage + bottomLine -1;
			if (endPage > pageCount) endPage = pageCount;
			
			req.setAttribute("userList",userList);
			req.setAttribute("number",number);
			req.setAttribute("count", count);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("startPage", startPage);
			req.setAttribute("bottomLine", bottomLine);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("endPage", endPage);
			
				 return  "/user/list.jsp";