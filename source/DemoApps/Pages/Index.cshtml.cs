using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using Microsoft.Data.SqlClient;

namespace DemoApps.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        private readonly IConfiguration _config;

        public IndexModel(ILogger<IndexModel> logger, IConfiguration config)
        {
            this._logger = logger;
            this._config = config;
        }

        public List<Employee>? Employees { get; private set; }
        public void OnGet()
        {
            this.Employees = this.GetFromDatabase();
        }

        private List<Employee> GetFromDatabase()
        {
            var ret = new List<Employee>();
            string constr = this._config.GetConnectionString("connection1");
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
                            while (reader.Read())
                            {
                                ret.Add(new Employee()
                                {
                                    EmployeeId = reader.GetInt32(reader.GetOrdinal("employeeid")),
                                    Firstname = reader.GetString(reader.GetOrdinal("firstname")),
                                    Lastname = reader.GetString(reader.GetOrdinal("lastname"))
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
            return ret;
        }
    }

    public class Employee
    {
        public int EmployeeId { get; set;}
        public string Firstname { get; set; } = null!;
        public string Lastname { get; set; }= 1;
    }

}
