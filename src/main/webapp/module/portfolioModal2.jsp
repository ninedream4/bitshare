<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<div w3-include-html="content.html"></div>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-md-4 slidelist-item">
<a class="portfolio-link" data-toggle="modal">
	<div class="caption">
		<div class="caption-content">
			<i class="fa fa-search-plus fa-3x"></i>
		</div>
	</div>
	<img class="img-responsive" src="/content/download/?src="+${content[j].title}+"/1.png" alt="">
</a>
<h3>${content.title}</h3>
</div>

