using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryPMS
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Login_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Value; 
            string password = txtPassword.Value; 

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                return;
            }

            using (SqlConnection conn = new SqlConnection("Server=MP\\SQLEXPRESS;Database=LibraryDB;Trusted_Connection=True;TrustServerCertificate=True;"))
            {
                conn.Open();
                string selectUserQuery = "SELECT PasswordHash FROM Users WHERE Username = @Username";
                SqlCommand cmd = new SqlCommand(selectUserQuery, conn);
                cmd.Parameters.AddWithValue("@Username", username);

                object result = cmd.ExecuteScalar();

                if (result == null)
                {
                    return;
                }

                string storedHash = result.ToString();

                if (VerifyPassword(password, storedHash))
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    return;
                }
            }
        }

        private bool VerifyPassword(string enteredPassword, string storedHash)
        {
            string enteredHash = HashPassword(enteredPassword);
            return enteredHash == storedHash;
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(hashBytes);
            }
        }
    }
}