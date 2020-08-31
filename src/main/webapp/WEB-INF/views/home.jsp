<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- custom CSS -->
<link href="resources/css/home.css" rel="stylesheet">
<title>MARKET:: 오늘도 신선한 하루</title>
</head>
<body>

	<div id="carouselExampleControls" class="row carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">

			<c:forEach var="discount" items="${discounts}" varStatus="status">
				<c:choose>
					<c:when test="${status.count eq 1}">
						<div class="carousel-item active">
							<a
								href="${pageContext.request.contextPath}/discount/${discount.discount_id}">
								<img
								src="https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-1.2.1&w=1000&q=80"
								class="d-block w-100" alt="${discount.discount_name}">
								<div class="carousel-caption d-none d-md-block">
									<h1 class="display-3 pb-5 font-weight-bold">${discount.discount_name}
										${discount.discount_rate}%</h1>
									<h3 class="pb-2">${discount.discount_desc}</h3>
									<h4 class="pb-5 mb-5 font-weight-light">
										<fmt:formatDate pattern="yyyy/MM/dd"
											value="${discount.discount_start}" />
										(
										<fmt:formatDate pattern="E" value="${discount.discount_start}" />
										) ~
										<fmt:formatDate pattern="yyyy/MM/dd"
											value="${discount.discount_end}" />
										(
										<fmt:formatDate pattern="E" value="${discount.discount_end}" />
										)
									</h4>
								</div>
							</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="carousel-item">
							<a
								href="${pageContext.request.contextPath}/discount/${discount.discount_id}">
								<img
								src="https://viralsweep.com/blog/wp-content/uploads/2015/02/furiouscamera.jpg"
								class="d-block w-100" alt="${discount.discount_name}">
							<div class="carousel-caption d-none d-md-block">
								<h1 class="display-3 pb-5 font-weight-bold">${discount.discount_name}
									${discount.discount_rate}%</h1>
								<h3 class="pb-2">${discount.discount_desc}</h3>
								<h4 class="pb-5 mb-5 font-weight-light">
									<fmt:formatDate pattern="yyyy/MM/dd"
										value="${discount.discount_start}" />
									(
									<fmt:formatDate pattern="E" value="${discount.discount_start}" />
									) ~
									<fmt:formatDate pattern="yyyy/MM/dd"
										value="${discount.discount_end}" />
									(
									<fmt:formatDate pattern="E" value="${discount.discount_end}" />
									)
								</h4>
							</div>
							
							</a>
						</div>
					</c:otherwise>
				</c:choose>

			</c:forEach>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleControls"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<div class="row p-5 mx-auto">
		<div class="row mb-5">
			<div class="col-md-9">
				<h2>
					First featurette heading. <span class="text-muted">It’ll
						blow your mind.</span>
				</h2>
				<p class="lead">Donec ullamcorper nulla non metus auctor
					fringilla. Vestibulum id ligula porta felis euismod semper.
					Praesent commodo cursus magna, vel scelerisque nisl consectetur.
					Fusce dapibus, tellus ac cursus commodo.</p>
			</div>
			<div class="col-md-3">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="500" height="500" xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
					aria-label="Placeholder: 500x500">
					<title>Placeholder</title><rect width="100%" height="100%"
						fill="#eee" />
					<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
			</div>
		</div>

		<div class="row mb-5">
			<div class="col-md-3">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="500" height="500" xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
					aria-label="Placeholder: 500x500">
					<title>Placeholder</title><rect width="100%" height="100%"
						fill="#eee" />
					<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
			</div>
			<div class="col-md-9">
				<h2>
					Oh yeah, it’s that good. <span class="text-muted">See for
						yourself.</span>
				</h2>
				<p class="lead">Donec ullamcorper nulla non metus auctor
					fringilla. Vestibulum id ligula porta felis euismod semper.
					Praesent commodo cursus magna, vel scelerisque nisl consectetur.
					Fusce dapibus, tellus ac cursus commodo.</p>
			</div>
		</div>

		<div class="row">
			<div class="col-md-9">
				<h2>
					And lastly, this one. <span class="text-muted">Checkmate.</span>
				</h2>
				<p class="lead">Donec ullamcorper nulla non metus auctor
					fringilla. Vestibulum id ligula porta felis euismod semper.
					Praesent commodo cursus magna, vel scelerisque nisl consectetur.
					Fusce dapibus, tellus ac cursus commodo.</p>
			</div>
			<div class="col-md-3">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="500" height="500" xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
					aria-label="Placeholder: 500x500">
					<title>Placeholder</title><rect width="100%" height="100%"
						fill="#eee" />
					<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
			</div>
		</div>
	</div>
</body>
</html>
