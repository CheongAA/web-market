<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />

<!-- Bootstrap js -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<!-- custom CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Category -->
<script type="text/javascript">
	$.ajax({
				url : "/category",
				type : "get",
				success : function(data) {
					Object.keys(data).forEach(
									function(k) {
										var a = $('<a>');
										a.text(data[k]);
										a.attr("href", "/products/" + k);
										a.addClass("dropdown-item p-2 text-center text-muted text-decoration-none");
										$("#header_category").append(a);
									});
				}
			});
</script>
</head>
<body>
	<div class="container-fluid">
		<!-- Header -->
		<div class="row justify-content-center">
			<div class="col-sm-12">
				<tiles:insertAttribute name="header" />
			</div>
		</div>
		<hr />

		<!-- Main -->
		<div class="row justify-content-center content">
			<main role="main" class="col-sm-10">
				<tiles:insertAttribute name="content" />
			</main>
		</div>
		
		<!-- Footer -->
		<div class="row justify-content-center">
			<div class="col-sm-10">
				<tiles:insertAttribute name="footer" />
			</div>
		</div>
	</div>
</body>
</html>