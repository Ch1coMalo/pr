using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace EfCoreTest1
{
    public class Prepar
    {
        [Column("PreparationID")]
        public int Id { get; set; }
        public string Preparation { get; set; }
        public string Сontraindications { get; set; }
        public string PeriodOfUse { get; set; }
        public string? ShelfLife { get; set; }
        public string Dose { get; set; }
        public LinkedList<Recipe> Recipe { get; set; } = new();
    }
}
