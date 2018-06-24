<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
 <!DOCTYPE html>
<html>
<title>AllEars</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-metro.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-flat.css">



<script>
function follow(x) {
    x.classList.toggle("fa fa-microphone-slash");
}
</script>

<script>
function unfollow(x) {
    x.classList.toggle("fa fa-microphone");
}
</script>
<%@include file="/common/variable.jspf" %>
<%@include file="/common/footer.jspf" %>
<body class="w3-theme-l5">





<!-- Navbar -->

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1200px; margin-top:80px; margin-bottom:80px;">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white w3-padding">
        <div class="w3-container">
         <h3 class="w3-center"><b>${user.displayname}</b></h3>
          <p class="w3-center">
          <c:if test="${etc.profilesize!=null||etc.profilesize!=0}">
        	<img src="${pageContext.request.contextPath}/profileSave/${etc.profilename}" class="w3-circle" style="height:230px; width:230px;" alt="">
         </c:if>
         <c:if test="${etc.profilesize==0||etc.profilesize==null}">
        	<img src="${pageContext.request.contextPath}/img/allears.jpg" class="w3-circle" alt="no" style="height:230px; width:230px;" alt="">
         </c:if>
         </p>
         
         
         <c:if test="${etc.etcid!=null}">
         <hr>
		<p class="w3-center">
	    		<c:if test="${etc.facelink!=null}">
             <a href="${etc.facelink}" target="_blank" class="w3-btn w3-round w3-blue w3-hover-white w3-round w3-xlarge fa fa-facebook-official"></a>
             </c:if>
             <c:if test="${etc.instalink!=null}">
             <a href="${etc.instalink}" target="_blank" class="w3-btn w3-round w3-pink w3-hover-white w3-round w3-xlarge fa fa-instagram"></a>
             </c:if>
             <c:if test="${etc.soundlink!=null}">
             <a href="${etc.soundlink}" target="_blank" class="w3-btn w3-round w3-deep-orange w3-xlarge w3-hover-white fa fa-soundcloud"></a>
             </c:if>
         </p>
         </c:if>
        <hr>

		 <p class="w3-center">
         	
         	<button onclick="document.getElementById('following').style.display='block'" class="w3-btn w3-round"><i class="fa fa-user w3-large w3-margin-right"></i>팔로잉 ${follow}</button>
				  <div id="following" class="w3-modal">
				    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:25%">
				      <div class="w3-container">
				        <span onclick="document.getElementById('following').style.display='none'" class="w3-btn w3-round w3-display-topright">&times;</span>
								
								<c:if test="${follow==0}"><p style="font-size:15pt; color:grey;">&nbsp;&nbsp;<i> 팔로잉한 사람이 없습니다! 팔로잉해주세요-!</i></p></c:if>
				        		
							        		<c:if test="${follow!=0}">
							             <table class="w3-table w3-bordered w3-padding-large" cellspacing="10" >
											<c:forEach var="followList" items="${followList}">
												<tr>
												<td align="center" width="100">&nbsp;&nbsp;<a href="friendPage?num=${followList.num}" style="font-size:15pt;">${followList.displayname}</a></td>
												</tr> 
											</c:forEach>
				             </table>
				             </c:if>				        


				      </div>
				    </div>
				  </div>
         </p>
         
         
         <p class="w3-center">
         	
         	<button onclick="document.getElementById('follower').style.display='block'" class="w3-btn w3-round"><i class="fa fa-users w3-large w3-margin-right"></i>팔로워 ${follower}</button>
				  <div id="follower" class="w3-modal">
				    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:25%">
				      <div class="w3-container">
				        <span onclick="document.getElementById('follower').style.display='none'" class="w3-btn w3-round w3-display-topright">&times;</span>
				        		<c:if test="${follower==0}"><p style="font-size:15pt; color:grey;">&nbsp;&nbsp;<i>팔로워가 없습니다!</i></p></c:if>
				        			<c:if test="${follower!=0}">
				            		 <table class="w3-table w3-bordered w3-padding-large" cellspacing="10" >
										<c:forEach var="followerList" items="${followerList}">
											<tr>
											<td align="center" width="100">&nbsp;&nbsp;<a href="friendPage?num=${followerList.num}" style="font-size:15pt;">>${followerList.displayname}</a></td>
											</tr> 
										</c:forEach>
				         	    </table>
				             </c:if>
				      </div>
				    </div>
				  </div>
         </p>
        
         
        <c:if test="${sessionid!=null}">
	     	<form method="post" action="follow">
	         <input type="hidden" name="userid" value="${user.userid}">
	         <input type="hidden" name="num" value="${user.num}">
			<p class="w3-center">
	         <c:if test="${!chk}">
	         <button type="submit" class="w3-btn w3-round w3-metro-yellow w3-hover-white w3-large">
	         <i onclick="follow(this)" class="fa fa-microphone w3-margin-right"></i>팔로우</button>
	         </c:if>
	        
	         <c:if test="${chk}">
	         <button type="submit" class="w3-btn w3-round w3-border w3-border-yellow w3-large">
	         <i onclick="unfollow(this)" class="fa fa-microphone-slash w3-margin-right"></i>언팔로우</button></c:if>
	         </p>
	         </form>
         </c:if>
         
         
         
         
         
         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>${user.position}</p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i>${user.address}</p>
         
        </div>
      </div>
      
      <br>
      
      <!-- Accordion -->
      <div>
      
     		<form method="post" action="guestlist">
          	<input type="hidden" name="gboardid" value="${user.userid}">
           <button type="submit" class="w3-btn w3-round w3-metro-yellow w3-hover-white" style="width:100%" value="방명록"><b>Guest Book</b></button>
          </form>
          <br>
          <form method="post" action="songlist">
          <input type="hidden" name="sboardid" value="${user.userid}">
           <button type="submit" class="w3-btn w3-round w3-metro-yellow w3-hover-white" style="width:100%" value="송 리스트"><b>Song List</b></button>
    	  </form>
      </div>
      <br>
      
     
      <br>
      
      <!-- Alert Box -->

    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
    

     
      
      
      
      <div class="w3-row-padding">
        <div class="w3-col m12">
      	<div class="w3-card w3-round w3-white w3-padding">
       		 <div class="w3-container w3-center w3-padding">
			<div class="w3-center">
			 	 <i class="fa fa-music w3-margin-right"></i><i class="fa fa-music w3-margin-right"></i><i class="fa fa-music w3-margin-right"></i>
			</div>
			<br><a style="font-size:13pt; color:black;">${user.bio}</a>
			</div>
		</div>
       </div>
      </div>
       
       <c:if test="${songList==null}">
       <br>
       <div class="w3-row-padding">
          <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-center">
            	  <br>
			  <a class="w3-margin-left" style="font-size:13pt; color:grey;">${user.displayname}님이 등록하신 곡이 없습니다 - </a><br><br>
            </div>
          </div>
          </div>
          </div>
      </c:if>
        
          
   
    
      
      
      <c:forEach var="song" items="${songList}">
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
		    	<c:if test="${etc.profilename!=null}">
		    	<img src="${pageContext.request.contextPath}/profileSave/${etc.profilename}" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:80px">
		    </c:if>
		    	<c:if test="${etc.profilename==null}">
		    	<img src="${pageContext.request.contextPath}/img/allears.jpg" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:80px">
		    </c:if>
		    
		    	<span class="w3-right w3-opacity">${song.sreg_date}</span>
		    	<h4><b>${user.displayname}</b></h4><h6>${user.position}</h6>
		    	<hr class="w3-clear">
		    	<span><h4><i class="fa fa-play-circle-o"></i>&nbsp;${song.stitle}</h4>
		    	<h4><i class="fa fa-pause-circle-o"></i>&nbsp;${song.genre}</h4></span>
		    	<i class="fa fa-commenting-o"></i><p>${song.sbio}</p>
		    	 <div class="w3-row-padding" style="margin:0 -16px">
		    		 <div class="w3-half">
		    		 <c:if test="${song.cfilesize!=0}">
		            	  <img src="${pageContext.request.contextPath}/songSave/${song.cfilename}" style="width:200px; height:200px;" class="w3-margin-bottom">
		             </c:if>
		             
		             <c:if test="${song.type eq 'mp3' || song.type eq 'wav'}">
						<audio controls="controls">
						  <source src="${pageContext.request.contextPath}/songSave/${song.sfilename}" type="audio/mpeg">
						  <source src="${pageContext.request.contextPath}/songSave/${song.sfilename}" type="audio/wav">
						</audio>
					</c:if>	
					
					<c:if test="${song.type eq 'mp4'}">
						<video width="320" height="240" controls>
						  <source src="${pageContext.request.contextPath}/songSave/${song.sfilename}" type="video/mp4">
						  <source src="${pageContext.request.contextPath}/songSave/${song.sfilename}" type="video/ogg">
						</video>
					</c:if>
					
		            </div>
		        </div>
<!--         <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-heartbeat"></i>  Like</button> 
        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button>  -->
      </div>
      </c:forEach>
      
      
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">


      
	  <iframe src="${pageContext.request.contextPath}/chart/chart.jsp" style="display:block; width:70vw; height:1000px; border:none; -webkit-transform: scale(0.75);
        -webkit-transform-origin: 0 0;"></iframe>
      <br>
      
      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>

<!-- Footer -->

 
<script>
// Accordion
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-theme-d1";
    } else { 
        x.className = x.className.replace("w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-theme-d1", "");
    }
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>



</body>
</html> 

