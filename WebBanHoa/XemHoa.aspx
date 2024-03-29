﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="WebBanHoa.XemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noiDung" runat="server">

    <div class="form-inline">
          Chọn danh mục loại <asp:DropDownList ID="ddlLoai" AutoPostBack="true" CssClass="form-control" runat="server" DataSourceID="dsLoai" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
    </div>

    <div class="row mt-2">
        <asp:Repeater ID="rptHoa" runat="server" DataSourceID="dsHoa">
              <ItemTemplate>
                    <div class="col-md-3 text-center mb-2">
                          <a href="#">
                              <img src="hinh_san_pham/<%# Eval("hinh") %>"  style="width:80%"  />
                          </a> <br />
                          
                           <%# Eval("TenHoa") %> <br />
                           Giá bán : <%# Eval("gia","{0:#,##0} đồng") %> <br />      
                        <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btn btn-success" />
                    </div>
              </ItemTemplate>
        </asp:Repeater>
    </div>
    
  



    <asp:SqlDataSource ID="dsLoai" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsHoa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlLoai" DefaultValue="1" Name="MaLoai" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
