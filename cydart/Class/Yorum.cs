using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cydart.Class
{
    public class Yorum
    {
        int id;
        string gonadi, email, konu, mesaj;

        public int Id { get => id; set => id = value; }
        public string Gonadi { get => gonadi; set => gonadi = value; }
        public string Email { get => email; set => email = value; }
        public string Konu { get => konu; set => konu = value; }
        public string Mesaj { get => mesaj; set => mesaj = value; }

        public Yorum() { }

        public Yorum(string gonadi, string email, string konu, string mesaj)
        {
            Gonadi = gonadi;
            Email = email;
            Konu = konu;
            Mesaj = mesaj;
        }
    }
}