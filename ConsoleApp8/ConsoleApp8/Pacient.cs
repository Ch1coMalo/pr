using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace EfCoreTest1
{
    public class Pacient
    {
        [Column("PacientID")]
  
        public int Id { get; set; }
        public string PacSurname { get; set; }
        public string PacName { get; set; }
        public string? PacFathername { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Address { get; set; }
        //public Reception? Reception { get; set; }

        public LinkedList<Reception> Reception { get; set; } = new();



    }
}
