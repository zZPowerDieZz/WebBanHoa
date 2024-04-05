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
    <asp:ValidationSummary ID="vsLoi" runat="server" ForeColor="#ff0000"/>

    <asp:SqlDataSource ID="dsHoaTheoGia" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Hoa] WHERE (([Gia] &gt;= @Gia) AND ([Gia] &lt;= @Gia2))">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtGiaTu" Name="Gia" PropertyName="Text" Type="Double" DefaultValue="50000"/>
            <asp:ControlParameter ControlID="txtGiaDen" Name="Gia2" PropertyName="Text" Type="Double" DefaultValue="500000"/>
        </SelectParameters>
    </asp:SqlDataSource>

    <%--<div class="row mt-2">
        <asp:Repeater ID="rptHoa" runat="server" DataSourceID="dsHoaTheoGia">
              <ItemTemplate>
                    <div class="col-md-3 text-center mb-2">
                          <a href="#">
                              <img src="hinh_san_pham/<%# Eval("hinh") %>" style="width:80%" />
                          </a> <br />
                          
                           <%# Eval("TenHoa") %> <br />
                           Giá bán :<span class="text-danger"><%# Eval("gia","{0:#,##0} đồng") %></span><br />
                        <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btn btn-success" />
                    </div>
              </ItemTemplate>
        </asp:Repeater>
    </div>--%>
    
    <hr />
    <asp:ListView ID="lvHoa" runat="server" ItemPlaceholderID="itemPlacHolder" DataSourceID="dsHoaTheoGia">
        <ItemTemplate>
            <div class =" col-md-3 mt-2 text-center">
                <a>
                    <img src="Hinh_San_Pham/<%# Eval("Hinh") %>" style="width:200px;object-fit:cover"/>
                </a>
                <br/>
                <%# Eval("TenHoa") %> <br/>
                Giá bán: <span class="price"><%# Eval("Gia","{0:#,##0} VND") %></span><br />
                <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btn btn-success" />
            </div>
        </ItemTemplate>
        <EmptyDataTemplate>                          
                <div class="alert alert-warning">
                     Không có dữ liệu
                </div>                   
            </EmptyDataTemplate>
        <LayoutTemplate>
            <div class="row">
                <div runat="server" id="itemPlacHolder"></div>
                
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

</asp:Content>
