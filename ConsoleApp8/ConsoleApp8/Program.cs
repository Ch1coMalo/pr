using System;
using EfCoreTest1;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.Text;
using System.IO;
using System.Data;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
using System.Data.SqlClient;

namespace EfCoreTest1
{
    class Program
    {
        static void Main(string[] args)
        {

            /*
            using (ApplicationContext db = new ApplicationContext())
            {
                var Reception = db.Reception.ToArray();
                Console.WriteLine("Список объектов");
                foreach (Reception u in Reception)
                {
                    Console.WriteLine(u.Id + " " + u.DataRec + " " + u.DataFinal + " "
                        + u.DiagnosisID + " " + u.DocID + " " + u.PacientID + " " + u.NumRecipe + " " + u.NumAnalysis);
                }
            }
            
            //Вывести даты начала приемов 
            using (ApplicationContext db = new ApplicationContext())
            {
                    var receptions = db.Reception.ToArray().Select(u => u.DataRec);
                foreach (var u in receptions)
                {
                    Console.WriteLine(u);
                }

            }
            */

            /* 
              using (ApplicationContext db = new ApplicationContext())
              {
                 var Pacient = db.Pacient.ToArray();
                 Console.WriteLine("Список объектов");
                 foreach (Pacient u in Pacient)
                 {

                     Console.WriteLine(u.Id + " " + u.PacSurname + " " + u.PacName + " "
                         + u.PacFathername + " " + u.DateOfBirth + " " + u.Address);
                 }

               }
            */

            //Вывести дату начала приема и ФИО пациента с номером Id = 2 

            using (ApplicationContext db = new ApplicationContext())
            {

                var users = from u in db.Pacient.ToArray()
                            join
                            c in db.Reception.ToArray() on u.Id equals c.PacientID
                            where c.Id == 2
                            select new { Data = c.DataRec, FIO = u.PacSurname };



                foreach (var p in users)
                {
                    Console.WriteLine(p.Data + " " + p.FIO);
                }
                Console.WriteLine();
            }

            //-------------------------------------------------------------------

            //Удалить информацию о препарате с номером 5.
            /*
            using (ApplicationContext db = new ApplicationContext())
            {
                Prepar? deluser = (from Prepar in db.Prepar where Prepar.Id == 5 select Prepar).First();
                if (deluser != null)
                {
                    db.Prepar.Remove(deluser);
                    db.SaveChanges();
                }
                var prepar = db.Prepar.ToArray();
                Console.WriteLine("Список объектов");
                foreach (Prepar u in prepar)
                {
                    Console.WriteLine(u.Preparation);
                }
            }
              //-------------------------------------------------------------------
             
            */

            //Вывести название анализа с количеством от 1 до 2 включительно

            using (ApplicationContext db = new ApplicationContext())
            {
                var analys = from i in db.Analyses.ToArray()
                             where i.Quantity >= 1
                             where i.Quantity <= 2
                             select i;
                foreach (var i in analys)
                {
                    Console.WriteLine(i.ViewAnalysis);
                }
                Console.WriteLine();
            }

            //-------------------------------------------------------------------
            //Добавить нового врача
            /*
            using (ApplicationContext db = new ApplicationContext())
            {
                int maxId = db.Doc.Max(p => p.Id);
                Doc doc = new Doc { Id = maxId + 1, DocSurname = "Игнатьева", DocName = "Юлия", DocFathername = "Викторовна", ProfessionID = 3 };
                db.Doc.Add(doc);
                db.SaveChanges();
                var docs = db.Doc.ToArray();
                foreach (var a in docs)
                {
                    Console.WriteLine(a.Id + " " + a.DocSurname + " " + a.DocName + " " + a.DocFathername + " " + a.ProfessionID);
                }
            }
            {
                Console.WriteLine();
            }
            */
            //-------------------------------------------------------------------

            //Вывести номер приема, дату начала и дату окончания лечения пациент с диагнозом ОРВИ

            using (ApplicationContext db = new ApplicationContext())
            {

                var users = from u in db.Conclusion.ToArray()
                            join
                            c in db.Reception.ToArray() on u.Id equals c.DiagnosisID
                            where u.Diagnosis == "ОРВИ"
                            select new { D = c.Id, Data1 = c.DataRec, Data2 = c.DataFinal, Dia = u.Diagnosis };



                foreach (var p in users)
                {
                    Console.WriteLine(p.D + " " + p.Data1 + " " + p.Data2 + " " + p.Dia);
                }
                Console.WriteLine();
            }

            //-------------------------------------------------------------------

            //Вывести номер приема с указанием номера врача.
            using (ApplicationContext db = new ApplicationContext())
            {
                var rec = db.Pacient.SelectMany(u => u.Reception);
                foreach (var i in rec)
                {
                    Console.WriteLine($"{i.Id}  {i.DocID}");
                }

            }

            //Изменить срок годности препарата под номером 4 на 4 года.

            using (ApplicationContext db = new ApplicationContext())
            {
                Prepar? upduser = (from Prepar in db.Prepar where Prepar.Id == 4 select Prepar).First();
                if (upduser != null)
                {
                    upduser.ShelfLife = "4 года";
                    db.SaveChanges();
                }
                var prep = db.Prepar.ToArray();
                Console.WriteLine();
                foreach (Prepar u in prep)
                {
                    Console.WriteLine(u.Id + "  " + u.ShelfLife);
                }

            }


            using (ApplicationContext db = new ApplicationContext())
            {
                int maxId = db.Prepar.Max(p => p.Id);
                Prepar prepar = new Prepar { Id = maxId + 1, Preparation = "Парацетомол", Сontraindications = "Тяжелые нарушения функции печени, почек", PeriodOfUse = "Неделя", ShelfLife = "3 года", Dose = "1 т при температуре" };
                db.Prepar.Add(prepar);
                db.SaveChanges();
                var preraps = db.Prepar.ToArray();
                Console.WriteLine();
                foreach (var a in preraps)
                {
                    Console.WriteLine(a.Id + " " + a.Preparation + " " + a.Сontraindications + " " + a.PeriodOfUse + " " + a.ShelfLife + " " + a.Dose);
                }
            }
            {
                Console.WriteLine();
            }



        }
    }
}

