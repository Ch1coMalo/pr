using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace EfCoreTest1
{
    public class Analyses
    {
        [Column("NumAnalysis")]
        public int Id { get; set; }
        public int Quantity { get; set; }
        public string ViewAnalysis { get; set; }
        //public LinkedList<Reception> Reception { get; set; } = new();


    }
}
