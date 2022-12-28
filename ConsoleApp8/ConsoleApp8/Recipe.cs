using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace EfCoreTest1
{
    public class Recipe
    {
        [Column("NumRecipe")]
        public int Id { get; set; }
        public int PreparationID { get; set; }  
        public Prepar? Prepar { get; set; } 

    }
}
