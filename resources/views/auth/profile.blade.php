<!DOCTYPE html>
<html>
<head>
	<title></title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<h2>My profile</h2>
		<div class="row">
			<div class="col-md-8">
				<table>
					<thead>
						<th>Nom</th>
						<th>Email</th>
						<th></th>
					</thead>
					<tbody>
						<tr>
							<td>{{ $LoggedUserInfo->name }}</td>
							<td>{{ $LoggedUserInfo->email }}</td>
							<td><a href="logout">Logout</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

</body>
</html>