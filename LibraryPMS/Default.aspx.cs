using LibraryPMS.DAL;
using LibraryPMS.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryPMS
{
    public partial class Default : System.Web.UI.Page
    {
        private BookDAL _bookDal = new BookDAL();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindGrid();
            }
        }


        private void BindGrid()
        {
            GridViewBooks.DataSource = _bookDal.GetAllBooks();
            GridViewBooks.DataBind();
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TextBoxTitle.Text) ||
                string.IsNullOrWhiteSpace(TextBoxAuthor.Text) ||
                string.IsNullOrWhiteSpace(TextBoxGenre.Text) ||
                string.IsNullOrWhiteSpace(TextBoxPrice.Text))
            {
                lblErrorMessage.Text = "Please fill out all fields.";
                lblErrorMessage.Visible = true;
                return;  
            }

            if (decimal.TryParse(TextBoxPrice.Text, out decimal price))
            {
                var book = new Book
                {
                    Title = TextBoxTitle.Text,
                    Author = TextBoxAuthor.Text,
                    Genre = TextBoxGenre.Text,
                    Price = price
                };

                _bookDal.AddBook(book);

                BindGrid();

                lblErrorMessage.Visible = false;
            }
            else
            {
                lblErrorMessage.Text = "Please enter a valid price.";
                lblErrorMessage.Visible = true;
            }
        }

        protected void GridViewBooks_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewBooks.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GridViewBooks_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (e.RowIndex >= 0 && GridViewBooks.DataKeys.Count > e.RowIndex)
            {
                int bookId = Convert.ToInt32(GridViewBooks.DataKeys[e.RowIndex].Value);
                GridViewRow row = GridViewBooks.Rows[e.RowIndex];

                if (row != null)
                {
                    var book = new Book
                    {
                        BookID = bookId,
                        Title = (row.FindControl("TextBoxTitle") as TextBox).Text,
                        Author = (row.FindControl("TextBoxAuthor") as TextBox).Text,
                        Genre = (row.FindControl("TextBoxGenre") as TextBox).Text,
                        Price = decimal.Parse((row.FindControl("TextBoxPrice") as TextBox).Text)
                    };

                    _bookDal.UpdateBook(book);
                    GridViewBooks.EditIndex = -1;  
                    BindGrid(); 
                }
            }
        }

        protected void GridViewBooks_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (e.RowIndex >= 0 && GridViewBooks.DataKeys.Count > e.RowIndex)
            {
                int bookId = Convert.ToInt32(GridViewBooks.DataKeys[e.RowIndex].Value);

                _bookDal.DeleteBook(bookId);

                BindGrid();
            }
        }

        protected void GridViewBooks_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewBooks.EditIndex = -1;
            BindGrid();
        }
    }
}
