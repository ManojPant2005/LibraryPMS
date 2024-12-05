using LibraryPMS.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LibraryPMS.DAL
{
    public class BookDAL
    {
        private readonly string _connectionString;

        public BookDAL()
        {
            _connectionString = ConfigurationManager.ConnectionStrings["LibraryDBConnectionString"].ConnectionString;
        }

        public List<Book> GetAllBooks()
        {
            var books = new List<Book>();
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Books", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    books.Add(new Book
                    {
                        BookID = Convert.ToInt32(reader["BookID"]),
                        Title = reader["Title"].ToString(),
                        Author = reader["Author"].ToString(),
                        Genre = reader["Genre"].ToString(),
                        Price = Convert.ToDecimal(reader["Price"])
                    });
                }
            }
            return books;
        }

        public void AddBook(Book book)
        {
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Books (Title, Author, Genre, Price) VALUES (@Title, @Author, @Genre, @Price)", con);
                cmd.Parameters.AddWithValue("@Title", book.Title);
                cmd.Parameters.AddWithValue("@Author", book.Author);
                cmd.Parameters.AddWithValue("@Genre", book.Genre);
                cmd.Parameters.AddWithValue("@Price", book.Price);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void UpdateBook(Book book)
        {
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Books SET Title = @Title, Author = @Author, Genre = @Genre, Price = @Price WHERE BookID = @BookID", con);
                cmd.Parameters.AddWithValue("@BookID", book.BookID);
                cmd.Parameters.AddWithValue("@Title", book.Title);
                cmd.Parameters.AddWithValue("@Author", book.Author);
                cmd.Parameters.AddWithValue("@Genre", book.Genre);
                cmd.Parameters.AddWithValue("@Price", book.Price);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void DeleteBook(int bookId)
        {
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Books WHERE BookID = @BookID", con);
                cmd.Parameters.AddWithValue("@BookID", bookId);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}