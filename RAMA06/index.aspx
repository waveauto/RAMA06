<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="index.aspx.vb" Inherits="RAMA06.testindex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <script type="text/javascript">
        $(function () {
            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                var target = $(e.target).attr("href")
                alert(target);
                <%--$("<%=hdfmode.ClientID%>").val(target);--%>
            });
        })
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="text-center">
        <asp:LinkButton ID="btnshowgov" runat="server" class="btn btn-primary btn-outline btn-lg">
                          &nbsp;ข่าวทุนรัฐบาล
        </asp:LinkButton>
        <asp:LinkButton ID="btnshowout" runat="server" class="btn btn-primary btn-outline btn-lg">
                          &nbsp;ข่าวทุนเอกชน
        </asp:LinkButton>
        <asp:LinkButton ID="btnshowother" runat="server" class="btn btn-primary btn-outline btn-lg">
                          &nbsp;ข่าวประชาสัมพันธ์ทั่วไป
        </asp:LinkButton>
    </div>

   <br />

    <asp:MultiView ID="multiview1" runat="server" ActiveViewIndex="0">

        <asp:View ID="viewshowgov" runat="server">

            <asp:HiddenField ID="hdffrequency" runat="server" />
            <asp:HiddenField ID="HiddenField3" runat="server" />
            <br />
            <div class="text-center">
                <%--  <h1 class="panel-title">ข่าวประชาสัมพันธ์ทั่วไป</h1>--%>
                <h2>ข่าวทุนรัฐบาล</h2>
            </div>


            <div class="form-inline" style="padding-bottom: 10px;">
                <div class="form-group">
                    <asp:TextBox ID="tbsearcht1" runat="server" CssClass="form-control" autofocus="autofocus" placeholder="คำค้นหา..."></asp:TextBox>
                </div>
                <asp:LinkButton ID="btnsearcht1" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-search"></span> &nbsp;ค้นหา
                </asp:LinkButton>

            </div>


            <div class="table-responsive">
                <asp:GridView ID="gvdatat1" DataKeyNames="IDfound" runat="server" CssClass="table table-bordered table-striped table-hover"
                    AllowPaging="true" AllowSorting="true" PageSize="20" AutoGenerateColumns="false" ShowFooter="false">
                    <Columns>
                        <asp:BoundField HeaderText="ลำดับ" DataField="row" ItemStyle-Width="90px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="วันที่ลง" DataField="datesend" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="150px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="ชื่อทุน">
                            <ItemTemplate>
                                <asp:LinkButton ID="btntopic" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "namefound") %>' CommandName="aname" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>" ItemStyle-Width="150px"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField HeaderText="จำนวนทุน" DataField="numfound" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="จำนวนเงินต่อทุน" DataField="nummoneyfound" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="วันที่เริ่มให้" DataField="datefound" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="วันที่สิ้นสุดให้ทุน" DataField="endfound" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="ประเภททุน" DataField="typefound" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="300px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>




                    </Columns>
                    <EmptyDataTemplate>
                        ไม่พบข้อมูล
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>


            <asp:HiddenField ID="HiddenField4" runat="server" />
            <asp:HiddenField ID="HiddenField5" runat="server" />
            <p></p>
            <div class="form-inline">
                <div class="form-group">
                    <label class="control-label" for="<%=ddlPaget1.ClientID %>">หน้า</label>
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="ddlPaget1" runat="server" CssClass="form-control" AutoPostBack="true">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="control-label">จากทั้งหมด</label>
                    <asp:Label ID="lblAllPaget1" runat="server" CssClass="control-label"></asp:Label>
                    <label class="control-label">หน้า</label>
                </div>
            </div>
            <p></p>
        </asp:View>


        <asp:View ID="viewshowout" runat="server">
             <asp:HiddenField ID="HiddenField1" runat="server" />
            <br />
            <div class="text-center">

                <h2>ข่าวทุนเอกชน</h2>
            </div>


            <div class="form-inline" style="padding-bottom: 10px;">
                <div class="form-group">
                    <asp:TextBox ID="tbsearcht2" runat="server" CssClass="form-control" autofocus="autofocus" placeholder="คำค้นหา..."></asp:TextBox>
                </div>
                <asp:LinkButton ID="btnsearcht2" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-search"></span> &nbsp;ค้นหา
                </asp:LinkButton>

            </div>


            <div class="table-responsive">
                <asp:GridView ID="gvdatat2" DataKeyNames="IDpriv" runat="server" CssClass="table table-bordered table-striped table-hover"
                    AllowPaging="true" AllowSorting="true" PageSize="20" AutoGenerateColumns="false" ShowFooter="false">
                    <Columns>
                        <asp:BoundField HeaderText="ลำดับ" DataField="row" ItemStyle-Width="90px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="วันที่ลงข่าว" DataField="datesend" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="150px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="เรื่อง" ItemStyle-Width="900px">
                            <ItemTemplate>

                                <asp:LinkButton ID="btntopic" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "privHead") %>' CommandName="aEdit" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>" ItemStyle-Width="750px"></asp:LinkButton>

                                <asp:Image ID="image" runat="server" ImageUrl="~/Images/new1.jpg" Visible="true" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lbldateend" runat="server" Text='<%# Eval("dateend") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblstatusactionicon" runat="server" Text='<%# Eval("statusicon") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>




                    </Columns>
                    <EmptyDataTemplate>
                        ไม่พบข้อมูล
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>


            <p></p>
            <div class="form-inline">
                <div class="form-group">
                    <label class="control-label" for="<%=ddlPage.ClientID %>">หน้า</label>
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="ddlPaget2" runat="server" CssClass="form-control" AutoPostBack="true">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="control-label">จากทั้งหมด</label>
                    <asp:Label ID="lblAllPaget2" runat="server" CssClass="control-label"></asp:Label>
                    <label class="control-label">หน้า</label>
                </div>
            </div>
            <p></p>

        </asp:View>

        <asp:View ID="viewother" runat="server">
            <asp:HiddenField ID="hdfid" runat="server" />
            <br />
            <div class="text-center">

                <h2>ข่าวประชาสัมพันธ์ทั่วไป</h2>
            </div>


            <div class="form-inline" style="padding-bottom: 10px;">
                <div class="form-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" autofocus="autofocus" placeholder="คำค้นหา..."></asp:TextBox>
                </div>
                <asp:LinkButton ID="bttnsearch" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-search"></span> &nbsp;ค้นหา
                </asp:LinkButton>

            </div>


            <div class="table-responsive">
                <asp:GridView ID="gvData" DataKeyNames="IDNew" runat="server" CssClass="table table-bordered table-striped table-hover"
                    AllowPaging="true" AllowSorting="true" PageSize="20" AutoGenerateColumns="false" ShowFooter="false">
                    <Columns>
                        <asp:BoundField HeaderText="ลำดับ" DataField="row" ItemStyle-Width="90px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="วันที่ลงข่าว" DataField="datesend" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="150px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="เรื่อง" ItemStyle-Width="900px">
                            <ItemTemplate>

                                <asp:LinkButton ID="btntopic" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "newHead") %>' CommandName="aEdit" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>" ItemStyle-Width="750px"></asp:LinkButton>

                                <asp:Image ID="image" runat="server" ImageUrl="~/Images/new1.jpg" Visible="true" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lbldateend" runat="server" Text='<%# Eval("dateend") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblstatusactionicon" runat="server" Text='<%# Eval("statusicon") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>




                    </Columns>
                    <EmptyDataTemplate>
                        ไม่พบข้อมูล
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>


            <asp:HiddenField ID="hdfSortField" runat="server" />
            <asp:HiddenField ID="hdfSortDirectoin" runat="server" />
            <p></p>
            <div class="form-inline">
                <div class="form-group">
                    <label class="control-label" for="<%=ddlPage.ClientID %>">หน้า</label>
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="ddlPage" runat="server" CssClass="form-control" AutoPostBack="true">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="control-label">จากทั้งหมด</label>
                    <asp:Label ID="lblAllPage" runat="server" CssClass="control-label"></asp:Label>
                    <label class="control-label">หน้า</label>
                </div>
            </div>
            <p></p>
        </asp:View>

    </asp:MultiView>




</asp:Content>
