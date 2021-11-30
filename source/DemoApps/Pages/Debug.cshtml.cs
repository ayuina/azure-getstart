using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;

namespace DemoApps.Pages
{
    public class DebugModel : PageModel
    {
        public string Message { get; set; }

        public DebugModel(IConfiguration config)
        {
            this.Message = config.GetConnectionString("connection1");
        }

        public void OnGet()
        {
        }
        
    }
}
