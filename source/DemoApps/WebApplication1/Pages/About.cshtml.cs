using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;

namespace WebApplication1.Pages
{
    public class AboutModel : PageModel
    {
        public string Message { get; set; }

        public AboutModel(IConfiguration config)
        {
            this.Message = config.GetConnectionString("connection1");
        }

        public void OnGet()
        {
        }
        
    }
}
