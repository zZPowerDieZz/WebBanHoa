<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemHoa.aspx.cs" Inherits="WebBanHoa.ThemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noiDung" runat="server" >
    <h2 class="text-center">Thêm hoa</h2>
    <div class="row mt-3 mb-2 ">
        <div class="col-md-2">Danh mục</div>
        <div class="col-md-10">
            <asp:DropDownList ID="ddlDM" runat="server" CssClass="form-control" DataSourceID="dsDM" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
        </div>
    </div>
    <div class="row mb-2">
        <div class="col-md-2">Tên hoa</div>
        <div class="col-md-10">
            <asp:TextBox ID="txtTenHoa" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTenHoa" runat="server" ControlToValidate="txtTenHoa" ErrorMessage="Tên hoa không được bỏ trống" ForeColor="#ff0000"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row mb-2">
        <div class="col-md-2">Giá</div>
        <div class="col-md-10">
            <asp:TextBox ID="txtGia" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvGia" runat="server" ErrorMessage="Không giá được rỗng" ControlToValidate="txtGia" ForeColor="#ff0000"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvGia" runat="server" ErrorMessage="Nhập giá sai kiểu" Operator="DataTypeCheck" Type="Double" ControlToValidate="txtGia" ></asp:CompareValidator>
        </div>
    </div>
    <div class="row mb-2">
        <div class="col-md-2">Ngày cập đăng</div>
        <div class="col-md-10">
            <asp:TextBox ID="txtNgayCapDang" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
        <div class="row mb-2">
        <div class="col-md-2">Hình</div>
        <div class="col-md-10">
        <asp:FileUpload ID="FHinh" runat="server" />
        </div>
    </div>
   
    <div class="row mb-2">
        <div class="col-md-2"></div>
        <div class="col-md-10">
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click"/>
            <asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <asp:SqlDataSource ID="dsDM" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
</asp:Content>
