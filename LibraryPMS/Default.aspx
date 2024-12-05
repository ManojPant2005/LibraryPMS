<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LibraryPMS.Default" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Library Management</title>
        <link rel="stylesheet" href="Content/style.css" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <h2>Library PMS</h2>
            <a href="#"><b style="font-family:'Palatino Linotype'">DASHBOARD</b></a>
            <a href="#"><b style="font-family:'Palatino Linotype'">BOOKS</b></a>
            <a href="#"><b style="font-family:'Palatino Linotype'">MEMBERS</b></a>
            <a href="#"><b style="font-family:'Palatino Linotype'">COLLECTIONS</b></a>
            <a href="#"><b style="font-family:'Palatino Linotype'">POPULAR BOOKS</b></a>
        </div>

        <div class="topbar">
            <nav class="navbar navbar-expand-lg">
                <a class="navbar-brand" href="#"><b style="font-family:'Palatino Linotype'">LIBRARY MANAGEMENT</b></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#"><b style="font-family:'Palatino Linotype'">HOME</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b style="font-family:'Palatino Linotype'">PROFILE</b></a>
                        </li>
<li class="nav-item">
    <a class="nav-link" href="Logout.aspx"><b style="font-family:'Palatino Linotype'">LOGOUT</b></a>
</li>

                    </ul>
                </div>
            </nav>
        </div>

        <div class="main-content">
            <h1>Library Management</h1>
            
            <button type="button" class="btn btn-primary add-button" data-toggle="modal" data-target="#addBookModal">
                <i class="fas fa-plus"></i> + ADD NEW BOOK
            </button>

            <div class="grid-container">
                <asp:GridView ID="GridViewBooks" CssClass="GridView" runat="server" AutoGenerateColumns="False"
                              OnRowEditing="GridViewBooks_RowEditing"
                              OnRowDeleting="GridViewBooks_RowDeleting"
                              OnRowCancelingEdit="GridViewBooks_RowCancelingEdit"
                              OnRowUpdating="GridViewBooks_RowUpdating"
                              DataKeyNames="BookID">
                    <Columns>
                        <asp:BoundField DataField="BookID" HeaderText="Book ID" ReadOnly="True" SortExpression="BookID" />
                        <asp:TemplateField HeaderText="TITLE">
                            <ItemTemplate>
                                <%# Eval("Title") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxTitle" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="AUTHOR">
                            <ItemTemplate>
                                <%# Eval("Author") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxAuthor" runat="server" Text='<%# Bind("Author") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CATEGORY">
                            <ItemTemplate>
                                <%# Eval("Genre") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxGenre" runat="server" Text='<%# Bind("Genre") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PRICE">
                            <ItemTemplate>
                                <%# Eval("Price", "{0:C}") %>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxPrice" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField HeaderText="ACTIONS" ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>

 <div class="modal fade" id="addBookModal" tabindex="-1" role="dialog" aria-labelledby="addBookModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addBookModalLabel"><b>Add New Book</b></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>


                        <div class="modal-body">
                            <asp:TextBox ID="TextBoxTitle" runat="server" Placeholder="Title" CssClass="form-control"></asp:TextBox><br />
                            <asp:TextBox ID="TextBoxAuthor" runat="server" Placeholder="Author" CssClass="form-control"></asp:TextBox><br />
                            <asp:TextBox ID="TextBoxGenre" runat="server" Placeholder="Genre" CssClass="form-control"></asp:TextBox><br />
                            <asp:TextBox ID="TextBoxPrice" runat="server" Placeholder="Price" CssClass="form-control"></asp:TextBox><br />
                        </div>

                        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="False" />

                        <div class="modal-footer">
                            <asp:Button ID="ButtonAdd" runat="server" Text="Add Book" CssClass="btn btn-primary" OnClick="ButtonAdd_Click" />
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>



    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>