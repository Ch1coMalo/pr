using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace EfCoreTest1
{
    public class Specialty
    {
        [Column("ProfessionID")]
        public int Id { get; set; }
        public string Proffesion { get; set; }
        //public LinkedList<Doc> Doc { get; set; } = new();
    }
}
