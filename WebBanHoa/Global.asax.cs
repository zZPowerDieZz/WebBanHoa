using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.IO;

namespace WebBanHoa
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            string textFile = Server.MapPath("~/Dem.txt");
            //Đọc từ FIle
            int dem = int.Parse(File.ReadAllText(textFile));
            Application["Dem"] = dem;
        }
        protected void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Application["Dem"] = (int)Application["Dem"] + 1;
            //Ghi vào File
            string textFile = Server.MapPath("~/Dem.txt");
            File.WriteAllText(textFile, Application["Dem"].ToString());
            Application.UnLock();
        }
    }
}