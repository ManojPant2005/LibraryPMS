<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LibraryPMS.Login" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Login</title>
    <link rel="stylesheet" href="Content/style.css" />

        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form id="loginForm" runat="server">
            <div class="form-group">
                <label for="txtUsername">Username</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"></span>
                    </div>
                    <input type="text" id="txtUsername" class="form-control" placeholder="Enter your username" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <label for="txtPassword">Password</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"></span>
                    </div>
                    <input type="password" id="txtPassword" class="form-control" placeholder="Enter your password" runat="server" />
                </div>
            </div>

            <button type="submit" class="btn btn-primary" runat="server" onserverclick="Login_Click">Login</button>
        </form>

        <div class="link-container">
            <p>Don't have an account? <a href="Register.aspx">Register here</a></p>
        </div>
    </div>

</body>
</html>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
