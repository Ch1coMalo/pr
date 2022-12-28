using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace EfCoreTest1
{
    public class Reception   
    {
        [Column("ReceptionID")]
        public int Id { get; set; }
        public DateTime DataRec { get; set; }
        public DateTime DataFinal { get; set; }
        public int DiagnosisID { get; set; }
        public int DocID { get; set; }
        public int PacientID { get; set; }
        public int NumRecipe { get; set; }
        public int NumAnalysis { get; set; }

        //public LinkedList<Pacient> Pacient { get; set; } = new();
        public Pacient? Pacient { get; set; }
        //public Conclusion? Conclusion { get; set; }
    }
}
