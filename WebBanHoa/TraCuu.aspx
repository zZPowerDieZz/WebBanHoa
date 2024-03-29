<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TraCuu.aspx.cs" Inherits="WebBanHoa.TraCuu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noiDung" runat="server">
    <div class="form-inline mb-2">
        Giá bán từ <asp:TextBox ID="txtGiaTu" runat="server" CssClass="form-control"></asp:TextBox>
        đến <asp:TextBox ID="txtGiaDen" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:Button ID="btnTraCuu" runat="server" Text="Tìm kiếm" CssClass="btn btn-secondary" />
    </div>

    <div class="row mt-2">
        <asp:Repeater ID="rptHoa" runat="server" DataSourceID="dsHoaTheoGia">
              <ItemTemplate>
                    <div class="col-md-3">
                          <a href="#">
                              <img src="hinh_san_pham/<%# Eval("hinh") %>" style="width:80%" />
                          </a> <br />
                          
                           <%# Eval("TenHoa") %> <br />
                           Giá bán : <%# Eval("gia","{0:#,##0} đồng") %> <br />    
                           <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btn btn-success" />
                    </div>
              </ItemTemplate>
        </asp:Repeater>
    </div>


    <asp:SqlDataSource ID="dsHoaTheoGia" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Hoa] WHERE (([Gia] &gt;= @Gia) AND ([Gia] &lt;= @Gia2))">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtGiaTu" Name="Gia" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="txtGiaDen" Name="Gia2" PropertyName="Text" Type="Double" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
