<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LibraryPMS.Register" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Register</title>
        <link rel="stylesheet" href="Content/style.css" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="register-container">
        <h2>Register</h2>
        <form id="registerForm" runat="server">
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
            <div class="form-group">
                <label for="txtEmail">Email</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"></span>
                    </div>
                    <input type="email" id="txtEmail" class="form-control" placeholder="Enter your email" runat="server" />
                </div>
            </div>

            <button type="submit" class="btn btn-primary" runat="server" onserverclick="Register_Click">Register</button>
        </form>
        <div class="link-container">
            <p>Already have an account? <a href="Login.aspx">Login here</a></p>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
