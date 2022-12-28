using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace EfCoreTest1
{
    public class Conclusion
    {
        [Column("DiagnosisID")]
        public int Id { get; set; }
        public string Diagnosis { get; set; }
        //public LinkedList<Reception> Receptions { get; set; } = new();
    }
}
