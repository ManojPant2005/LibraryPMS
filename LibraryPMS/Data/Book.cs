using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LibraryPMS.Data
{
    public class Book
    {
        public int BookID { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string Genre { get; set; }
        public decimal Price { get; set; }
    }
}