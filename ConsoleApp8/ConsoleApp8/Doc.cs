using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace EfCoreTest1
{
    public class Doc
    {
        [Column("DocID")]
        public int Id { get; set; }
        public string DocSurname { get; set; }
        public string DocName { get; set; }
        public string? DocFathername { get; set; }
        public int ProfessionID { get; set; }
       // public Specialty? Specialty { get; set; }
        public LinkedList<Reception> Reception { get; set; } = new();


    }
}
