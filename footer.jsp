<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<style>
	#footer{border-top: 2px solid rgb(179, 179, 179); 
			background: #e9ecf2;
			min-width: 1250px;
			width: 100%;
			position: relative;
			font-size: 18px;
			height: 300px;
			font-family: 'MinSans-Regular';
			}
	.font{
		color: #000000;
		font-size: 15px;
	}
	#footer_inner{
		width: 100%;
		display: inline-block;
		margin: 10px 0;
		padding: 0 150px;
		
	}
	#left_footer{
		margin-top: 10px;
		margin-left: 40px;
		height: 200px;
	}
	#left_footer dd{
		font-size: 16px;
	}
	.font_box{
		margin-top: 10px;
		font-size: 12px;
		font-family: 'MinSans-Bold';
	}
	#copyright{
		color: lightgray;
	}
	.footer_li{
		display: inline-block;
		height: 160px;
		position: relative;
		float: left;
		margin-right: 40px;
	}
	
	.title_footer_box{
		margin-left: 27px;
	}
	.title_font_box{
		font-size: 35px;
	}
	
	#right_box{
		float: right;
	}
	
	#right_footer{
		margin-top: 133px;
	}
	
	#right_footer>a{
		text-decoration: none;
		color: #C3C3C3;
	}
</style>
</head>
<body>
	<footer id="footer">
		<div id="footer_inner">
			<div class="title_footer_box">
				<div class="title_footer">
					<span id="co_title" class="title_font_box"><b>Project</b></span>
				</div>
			</div>
			<div class="footer_text_area">
				<ol style="list-style: none; padding-left: 0; display: inline-block;">
					<li class="footer_li">
						<div id="left_footer">
							<dl>
								<dt class="font_box">
									사업자
								</dt>
								<dd>(주)혼밥심</dd>
								<dt class="font_box">
									대표
								</dt>
								<dd>김남희 외 5명</dd>
								<dt class="font_box">
									주소
								</dt>
								<dd>서울특별시 강남구 논현로</dd>
							</dl>
						</div>
					</li>
					<li class="footer_li">
						<div id="mid_footer">
							<dl>
								<dt class="font_box">
									&nbsp;
								</dt>
								<dd>&nbsp;</dd>
								<dt class="font_box">
									Tel
								</dt>
								<dd style="font-size:15px;">010.1234.5678</dd>
								<dt class="font_box">
									Email
								</dt>
								<dd style="font-size:16px;">honbabsim@gmail.com</dd>
							</dl>
						</div>
					</li>
				</ol>
				<div id="right_box">
					<div id="right_footer">
						<a href="${contextPath}/privacy.com" target="_blank"><label style="padding-right: 40px; cursor: pointer;">개인정보처리방침</label></a>
						<span style="color: #C3C3C3;">고객지원: 02.888.9999</span>
					</div>
				</div>
				<div id="copy" style="margin-top: 10px;">
					<span id="copyright">&copy; 2024 HonBabsim Co. All rights reserved.</span>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>
