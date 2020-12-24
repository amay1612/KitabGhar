<%@page import="java.util.List"%>
<%@page import="com.kitabghar.entities.Post"%>
<%@page import="com.kitabghar.dao.PostDao"%>
<%@page import="com.kitabghar.helper.ConnectionProvider"%>


<div class="row">

<%
    
  Thread.sleep(500);
  PostDao d=new PostDao(ConnectionProvider.getConnection());
   int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {
            posts = d.getAllPostsByCatId(cid);
        }
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center text-white'>No Books in this category..</h3>");
            return;
        }
  
  for(Post p:posts)
  {
      %>
      <div class="col-md-6 mt-2">
          <div class="card mt-4">
              <div class="card-header">
              <div >
                 <img class="card-img-top" style="width: 300px; height: 300px" src="uploadBookPics/<%=p.getBookPic()%>" alt="Card image cap">
              </div>
              </div>
              <div class="card-body">
                  <b><i>Book Name :</i> <%=p.getBookName()%></b>
                  <br>
                  <b><i>Author Name : </i><%=p.getAuthor()%></b>
                  <br>
                  <b><i>Book Price : </i><%=p.getBookPrice()%></b>
                  
              </div>
                  
                  <div class="card-footer bg-dark text-center">
                      <a href="showBookPost.jsp?postId=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Know More...</a>
                  </div>
              

              
          </div>
      </div> 
      
      
      
      <%
  }
  




%>
</div>