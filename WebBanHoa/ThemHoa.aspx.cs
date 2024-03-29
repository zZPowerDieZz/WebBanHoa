using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
namespace WebBanHoa
{
    public partial class ThemHoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //lấy giá trị chuỗi kết nối trong web.config
            string chuoiketnoi = ConfigurationManager.ConnectionStrings["HoaTuoiDBConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(chuoiketnoi);
            conn.Open();
            string sql = "INSERT INTO Hoa(tenhoa,gia,hinh,maloai,ngaydang,soluotxem)" + " values(@tenhoa,@gia,@hinh,@maloai,@ngaydang,@soluotxem)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@tenhoa", txtTenHoa.Text);
            cmd.Parameters.AddWithValue("@gia", txtGia.Text);
            if (FHinh.HasFile)
            {
                //xử lý upload hình
                string duong_dan = Server.MapPath("~/Hinh_San_Pham/") + FHinh.FileName;
                FHinh.SaveAs(duong_dan);
                cmd.Parameters.AddWithValue("@hinh", FHinh.FileName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@hinh", "no_image.png");
            }
            cmd.Parameters.AddWithValue("@maloai", ddlDM.SelectedValue);
            cmd.Parameters.AddWithValue("@ngaydang", txtNgayCapDang.Text);
            cmd.Parameters.AddWithValue("@soluotxem",0);
            //thực hiện câu lệnh truy vấn đến CSDL
            if (cmd.ExecuteNonQuery() > 0)
                Response.Redirect("XemHoa.aspx");
            else
                lbThongBao.Text = "Thao tác thêm tin Thất Bại!!!";
        }
    }
}