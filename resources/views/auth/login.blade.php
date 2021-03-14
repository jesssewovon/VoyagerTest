<!DOCTYPE html>
<html>
<head>
	<title></title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<h2>Loggin</h2>
		<div class="row">
			<div class="col-md-6">
				<form action="{{ route('auth.check') }}" method="post">
				  @csrf
				  <div class="results">
				  	@if(Session::get('fail'))
				  		<div class="alert alert-danger">
				  			{{ Session::get('fail') }}
				  		</div>
				  	@endif
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Email address</label>
				    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email" value="{{ old('email') }}">
				    <span class="text-danger">@error('email') {{ $message }} @enderror</span>
				    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Password</label>
				    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
				    <span class="text-danger">@error('password') {{ $message }} @enderror</span>
				  </div>
				  <button type="submit" class="btn btn-primary">Log in</button>
				</form>
			</div>
		</div>
	</div>

	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

</body>
</html>