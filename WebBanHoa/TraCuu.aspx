<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TraCuu.aspx.cs" Inherits="WebBanHoa.TraCuu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noiDung" runat="server">
    <div class="form-inline mb-2">
        Giá bán từ <asp:TextBox ID="txtGiaTu" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvGiaTu" runat="server" ErrorMessage="Chưa nhập giá trị từ" ControlToValidate="txtGiaTu" Text="(*)" ForeColor="#ff0000"></asp:RequiredFieldValidator>
        đến <asp:TextBox ID="txtGiaDen" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvGiaDen" runat="server" ErrorMessage="Chưa nhập giá trị đến" ControlToValidate="txtGiaDen" Text="(*)" ForeColor="#ff0000"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cvGia" runat="server" ErrorMessage="Giá đến phải lớn hơn giá từ" ControlToCompare="txtGiaTu" Operator="GreaterThan" ForeColor="#ff0000" ControlToValidate="txtGiaDen" Text="(*)" ></asp:CompareValidator>
        <asp:Button ID="btnTraCuu" runat="server" Text="Tìm kiếm" CssClass="btn btn-secondary" />
    </div>

    <div class="row mt-2">
        <asp:Repeater ID="rptHoa" runat="server" DataSourceID="dsHoaTheoGia">
              <ItemTemplate>
                    <div class="col-md-3 text-center mb-2">
                          <a href="#">
                              <img src="hinh_san_pham/<%# Eval("hinh") %>" style="width:80%" />
                          </a> <br />
                          
                           <%# Eval("TenHoa") %> <br />
                           Giá bán :<span class="text-danger"><%# Eval("gia","{0:#,##0} đồng") %></span><br /><asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btn btn-success" />
                    </div>
              </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:ValidationSummary ID="vsLoi" runat="server" ForeColor="#ff0000"/>

    <asp:SqlDataSource ID="dsHoaTheoGia" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Hoa] WHERE (([Gia] &gt;= @Gia) AND ([Gia] &lt;= @Gia2))">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtGiaTu" Name="Gia" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="txtGiaDen" Name="Gia2" PropertyName="Text" Type="Double" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
