using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace WebBanHoa.Models
{
    public class Cart
    {
        //khai báo danh sách dùng để lưu trữ các sản phẩm (CartItem)
        private List<CartItem> _items;

        //phương thức khởi tạo giỏ hàng
        public Cart()
        {
            _items = new List<CartItem>();
        }
        //phương thức trả về danh sách các sản phẩm trong giỏ
        public List<CartItem> Items { get { return _items; } }
        //phương thức thêm sản phẩm vào giỏ
        public void Add(int masp)
        {
            //truy xuất CSDL để lấy thông tin về sản phẩm cần thêm vào giỏ hàng
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["HoaTuoiDBConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from Hoa where mahoa=@mahoa", conn);
            cmd.Parameters.AddWithValue("@mahoa", masp);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                //tạo đối tượng CartItem
                CartItem sp = new CartItem
                {
                    MaSP = masp,

                    TenSP = dr["TenHoa"].ToString(),
                    Hinh = dr["hinh"].ToString(),
                    DonGia = int.Parse(dr["Gia"].ToString()),

                    SoLuong = 1
                };
                //thêm vào giỏ (đề nghị sinh viên tự lập trình
                // cho trường hợp sản phẩm đã có trong giỏ)
                int index = findId(masp);
                if (index == -1) //chưa có trong giỏ
                    _items.Add(sp);
                else
                {  //sản phẩm đã có trong giỏ
                    _items[index].SoLuong++;
                }
            }
        }
        //Phương thức cập nhật số lượng,
        public void Update(int masp, int soluong)
        {
            int index = findId(masp);
            if (index != -1) //tìm thấy
            {
                if (soluong > 0)
                    _items[index].SoLuong = soluong;
                else
                    _items.RemoveAt(index);
            }
        }
        //phương thức xoá sản phẩm khỏi giỏ,
        public void Delete(int masp)
        {
            int index = findId(masp);
            if (index != -1)
                _items.RemoveAt(index);
        }
        private int findId(int masp)
        {
            for (int i = 0; i < _items.Count; i++)
            {
                if (_items[i].MaSP == masp)
                {
                    return i;//tìm thấy
                }
            }
            return -1;//không tìm thấy
        }
        //tính tổng thành tiền
        public int Total
        {
            get
            {
                int tong = 0;
                foreach (CartItem item in _items)
                {
                    tong += item.ThanhTien;
                }
                return tong;
            }
        }
    }
}