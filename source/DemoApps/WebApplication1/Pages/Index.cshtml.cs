using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace WebApplication1.Pages
{
    public class IndexModel : PageModel
    {
        public class Employee
        {
            public int EmployeeId { get; set; }
            public string Firstname { get; set; }
            public string Lastname { get; set; }
        }

        public List<Employee> Employees = new List<Employee>();
        
        public void OnGet()
        {
            var constr = @"Data Source=(localdb)\ProjectsV13;Initial Catalog=demo0517;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            using (var con = new SqlConnection(constr))
            {
                using (var cmd = con.CreateCommand())
                {
                    cmd.CommandText = "select * from employee";

                    con.Open();
                    try
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while(reader.Read())
                            {
                                this.Employees.Add(new Employee() {
                                    EmployeeId = reader.GetInt32( reader.GetOrdinal("employeeid")),
                                    Firstname = reader.GetString( reader.GetOrdinal("firstname")),
                                    Lastname = reader.GetString( reader.GetOrdinal("lastname"))
                                    });
                            }
                        }
                    }
                    finally
                    {
                        con.Close();
                    }

                }
            }
        }
    }
}
