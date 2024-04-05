﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="WebBanHoa.XemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noiDung" runat="server">

 <%--   <div class="row mt-2">
        <asp:Repeater ID="rptHoa" runat="server" DataSourceID="dsHoa">
              <ItemTemplate>
                    <div class="col-md-3 text-center mb-2">
                          <a href="#">
                              <img src="hinh_san_pham/<%# Eval("hinh") %>" style="width:80%"  />
                          </a> <br />
                          
                           <%# Eval("TenHoa") %> <br />
                           Giá bán : <span class="text-danger"><%# Eval("gia","{0:#,##0} đồng") %></span> <br />      
                        <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btn btn-success" OnClick="btAddToCart_Click" />
                    </div>
                  </ItemTemplate>
        </asp:Repeater>
    </div>--%>

             <asp:ListView ID="lvHoa" runat="server" DataSourceID="dsHoa">
            <ItemTemplate>
                 <div class=" col-md-3 mt-2 text-center">
                    <a href="#">
                        <img src="Hinh_San_Pham/<%# Eval("Hinh") %>"style="width:200px;object-fit:cover"/>
                    </a>
                    <br />
                    <%# Eval("TenHoa") %><br/>
                    Giá bán: <span class="price"><%# Eval("Gia","{0:#,##0} VNĐ") %></span><br/>
                    <asp:Button ID="btnAddToCard" runat="server" Text="Add To Card" CommandArgument='<%# Eval("Mahoa") %>' class="btn btn-success"
                        OnClick="btnAddToCart_Click"  />
                </div>
            </ItemTemplate>   
             <EmptyDataTemplate>
                  <div class="alert alert-warning">
                        Không có dữ liệu
                  </div>
             </EmptyDataTemplate>
            <LayoutTemplate>
                 <div class="row">
                      <div runat="server" id="itemPlaceHolder"></div>
                 </div>
                <br/>
                <div class="bg-dark text-center">
                <asp:DataPager ID="dtpage" runat="server" PagedControlID="lvHoa" PageSize="6" ClientIDMode="Static">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowPreviousPageButton="true"
                            ShowNextPageButton="false" ButtonCssClass="prev-page text-info" NextPageText="Sau" PreviousPageText="Trước"/>
                        <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn-cur-page text-info"
                            NumericButtonCssClass="btn-num-page text-success" />
                        <asp:NextPreviousPagerField ButtonType="Button"  ShowNextPageButton="true"
                            ShowPreviousPageButton="false" ButtonCssClass="next-page text-info" NextPageText="Sau"/>
                    </Fields>
                </asp:DataPager>
            </div>
            </LayoutTemplate>
        </asp:ListView>
  



    <asp:SqlDataSource ID="dsLoai" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsHoa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MaLoai" QueryStringField="catid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
