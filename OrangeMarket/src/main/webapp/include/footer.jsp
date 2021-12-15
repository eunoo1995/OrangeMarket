<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<%
	String jsName = request.getParameter("jsName");
%>

</main>
<!-- contWrap end -->
	
<footer id="footer">
	<div class="footer-inner">

		<article class="footer-top">
			<div class="footer-center">
				<ul class="footer-nav">
					<li>
						<p class="footer-nav-tit">Product</p>
						<ul class="depth2">
							<li><a href="#">How it works</a></li>
							<li><a href="#">Features</a></li>
							<li><a href="#">Pricing</a></li>
							<li><a href="#">Testimonials</a></li>
						</ul>
					</li>
					<li>
						<p class="footer-nav-tit">About form</p>
						<ul class="depth2">
							<li><a href="#">Our team</a></li>
							<li><a href="#">Careers</a></li>
							<li><a href="#">Press</a></li>
							<li><a href="#">Stores</a></li>
						</ul>
					</li>
					<li>
						<p class="footer-nav-tit">고객센터</p>
						<ul class="depth2">
							<li><a href="inquiry-list">문의하기</a></li>
							<li><a href="qna-list">자주묻는질문</a></li>
							<li><a href="#">운영정책</a></li>
							<li>
								<button type="button" 
								 style="background:#eee; height:10px; 
								 border:1px solid #eee;"
								 onclick="location='admin-login'"></button>
							</li>
						</ul>
					</li>
					<li>
						<p class="footer-nav-tit">약관</p>
						<ul class="depth2">
							<li><a href="#">이용약관</a>
							<li><a href="#">개인정보처리지침</a></li>
							<li><a href="#">위치정보</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</article>
		<article class="footer-bottom">
			<p class="footer-copy">Â©2018 - Form | All right reserved</p>
		</article>
	</div>
</footer>

	
	<%	
	if(jsName != null && !jsName.equals("")) {
		pageContext.setAttribute("jsName", jsName);
	%>
		<script type="text/javascript" src="/js/${jsName}.js"></script>
	<%
	}
	%>

</body>
</html>