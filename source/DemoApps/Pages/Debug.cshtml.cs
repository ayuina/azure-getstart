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

        public Dictionary<string, string> ConfigSettings{get; private set;}
        public DebugModel(IConfiguration _config)
        {
            this.ConfigSettings = _config.AsEnumerable().ToDictionary(kvp => kvp.Key, kvp=> kvp.Value);
        }

        public void OnGet()
        {
        }
        
    }
}
