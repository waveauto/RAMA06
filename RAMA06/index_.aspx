<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="index_.aspx.vb" Inherits="RAMA06.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script src="ckeditor/ckeditor.js"></script>

    <script>
        $(function () {
            $("#tabs").tabs();
        });
    </script>
   
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {

            $('#tabs').tabs({
                activate: function () {
                    var newIdx = $('#tabs').tabs('option', 'active');
                    $('#<%=hidLastTab.ClientID%>').val(newIdx);

                },
                active: previouslySelectedTab,
                show: { effect: "fadeIn", duration: 1000 }
            });

        });
    </script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <br />
        <div id="tabs">
            <ul class="nav nav-tabs">

                <li><a data-toggle="tab" href="#Tab1">ทุนภายในคณะฯ</a></li>
                <li><a data-toggle="tab" href="#Tab2">ทุนภายนอกคณะฯ</a></li>
                <li><a data-toggle="tab" href="#Tab3">ทุนรัฐบาล</a></li>
                <li><a data-toggle="tab" href="#Tab4">ทุนเอกชน</a></li>
                <li><a data-toggle="tab" href="#Tab5">ข่าวประชาสัมพันธ์ทั่วไป</a></li>
            </ul>
        </div>

        <div class="tab-content">
            <div id="Tab1" class="tab-pane fade">
                <h2 class="text-center ">ทุนภายใน คณะแพทยศาสตร์โรงพยาบาลรามาธิบดี</h2>
                <button class="btn btn-info btn-lg" data-target="#myModal" data-toggle="modal" type="button">ค้นหา</button>
                <a href="Page/Menu1.aspx">Menu1.aspx</a><br />
                <br />
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h1 class="panel-title">รายการ</h1>
                    </div>
                    <div class="table-responsive">
                        <div class="text-center">
                            <i>หน้าที่ <%=gvDataTab1.PageIndex + 1%> จาก <%=gvDataTab1.PageCount%> </i>
                        </div>
                        <asp:GridView ID="gvDataTab1" runat="server" CssClass="table table-bordered table-hover"
                            AllowPaging="true" AllowSorting="true" PageSize="30" AutoGenerateColumns="false" ShowFooter="false">
                            <Columns>
                                <asp:TemplateField HeaderText="ลำดับ">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField HeaderText="ID" DataField="ID" SortExpression="ID">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="วันที่" DataField="DateTime" SortExpression="DateTime">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <%--  <asp:BoundField HeaderText="เรื่อง" DataField="Topic" SortExpression="Topic">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>--%>

                                <asp:TemplateField HeaderText="ชื่อทุน" SortExpression="Topic">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="selectLink" runat="server"
                                            NavigateUrl='<%#"~/Page/MainRecord/View-News.aspx?id=" + Eval("Topic").ToString()%>'
                                            Target="_Blank" Text='<%# Bind("Topic")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField HeaderText="จำนวนทุน" DataField="CountFund" SortExpression="CountFund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="จำนวนทุนคงเหลือ" DataField="FunReal" SortExpression="FunReal">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="red" />
                                    <ItemStyle HorizontalAlign="Left" ForeColor="red" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="จำนวนเงินต่อทุน" DataField="MuneyPerFund" SortExpression="MuneyPerFund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="วันที่เริ่มให้ทุน" DataField="Start_date" SortExpression="Start_date">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="วันที่สิ้นสุดให้ทุน" DataField="End_date" SortExpression="End_date">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="จำนวนวันคงเหลือ" DataField="Endday" SortExpression="Endday">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="red" />
                                    <ItemStyle HorizontalAlign="Left" ForeColor="red" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="แหล่งทุน" DataField="From_Fund" SortExpression="From_Fund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="ประเภททุน" DataField="Type_Fund" SortExpression="Type_Fund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="อ่าน" DataField="Hits" SortExpression="Hits">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                            </Columns>
                            <EmptyDataTemplate>
                                ไม่พบข้อมูล
                            </EmptyDataTemplate>
                            <PagerSettings Position="TopAndBottom" />
                        </asp:GridView>
                        <div class="text-center">
                            <i>หน้าที่ <%=gvDataTab1.PageIndex + 1%> จาก <%=gvDataTab1.PageCount%> </i>
                        </div>
                    </div>
                </div>
            </div>
            <div id="Tab2" class="tab-pane fade">
                <h2 class="text-center ">ทุนภายนอก คณะแพทยศาสตร์โรงพยาบาลรามาธิบดี</h2>
                <button class="btn btn-info btn-lg" data-target="#myModal" data-toggle="modal" type="button">ค้นหา</button>
                <br />
                <br />
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h1 class="panel-title">รายการ</h1>
                    </div>
                    <div class="table-responsive">
                        <div class="text-center">
                            <i>หน้าที่ <%=gvDataTab2.PageIndex + 1%> จาก <%=gvDataTab2.PageCount%> </i>
                        </div>
                        <asp:GridView ID="gvDataTab2" runat="server" CssClass="table table-bordered table-hover"
                            AllowPaging="true" AllowSorting="true" PageSize="30" AutoGenerateColumns="false" ShowFooter="false">
                            <Columns>
                                <asp:TemplateField HeaderText="ลำดับ">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField HeaderText="ID" DataField="ID" SortExpression="ID">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="วันที่" DataField="DateTime" SortExpression="DateTime">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <%--  <asp:BoundField HeaderText="เรื่อง" DataField="Topic" SortExpression="Topic">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>--%>

                                <asp:TemplateField HeaderText="ชื่อทุน" SortExpression="Topic">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="selectLink" runat="server"
                                            NavigateUrl='<%#"~/Page/MainRecord/View-News.aspx?id=" + Eval("Topic").ToString()%>'
                                            Target="_Blank" Text='<%# Bind("Topic")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField HeaderText="จำนวนทุน" DataField="CountFund" SortExpression="CountFund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="จำนวนทุนคงเหลือ" DataField="FunReal" SortExpression="FunReal">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="red" />
                                    <ItemStyle HorizontalAlign="Left" ForeColor="red" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="จำนวนเงินต่อทุน" DataField="MuneyPerFund" SortExpression="MuneyPerFund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="วันที่เริ่มให้ทุน" DataField="Start_date" SortExpression="Start_date">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="วันที่สิ้นสุดให้ทุน" DataField="End_date" SortExpression="End_date">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="จำนวนวันคงเหลือ" DataField="Endday" SortExpression="Endday">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="red" />
                                    <ItemStyle HorizontalAlign="Left" ForeColor="red" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="แหล่งทุน" DataField="From_Fund" SortExpression="From_Fund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="ประเภททุน" DataField="Type_Fund" SortExpression="Type_Fund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="อ่าน" DataField="Hits" SortExpression="Hits">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                            </Columns>
                            <EmptyDataTemplate>
                                ไม่พบข้อมูล
                            </EmptyDataTemplate>
                            <PagerSettings Position="TopAndBottom" />
                        </asp:GridView>
                        <div class="text-center">
                            <i>หน้าที่ <%=gvDataTab2.PageIndex + 1%> จาก <%=gvDataTab2.PageCount%> </i>
                        </div>
                    </div>
                </div>
            </div>
            <div id="Tab3" class="tab-pane fade">
                <h2 class="text-center ">ทุนรัฐบาล</h2>
                <button class="btn btn-info btn-lg" data-target="#myModal" data-toggle="modal" type="button">ค้นหา</button>
                <br />
                <br />
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h1 class="panel-title">รายการ</h1>
                    </div>
                    <div class="table-responsive">
                        <div class="text-center">
                            <i>หน้าที่ <%=gvDataTab3.PageIndex + 1%> จาก <%=gvDataTab3.PageCount%> </i>
                        </div>
                        <asp:GridView ID="gvDataTab3" runat="server" CssClass="table table-bordered table-hover"
                            AllowPaging="true" AllowSorting="true" PageSize="30" AutoGenerateColumns="false" ShowFooter="false">
                            <Columns>
                                <asp:TemplateField HeaderText="ลำดับ">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField HeaderText="ID" DataField="ID" SortExpression="ID">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="วันที่" DataField="DateTime" SortExpression="DateTime">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <%--  <asp:BoundField HeaderText="เรื่อง" DataField="Topic" SortExpression="Topic">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>--%>

                                <asp:TemplateField HeaderText="ชื่อทุน" SortExpression="Topic">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="selectLink" runat="server"
                                            NavigateUrl='<%#"~/Page/MainRecord/View-News.aspx?id=" + Eval("Topic").ToString()%>'
                                            Target="_Blank" Text='<%# Bind("Topic")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField HeaderText="จำนวนทุน" DataField="CountFund" SortExpression="CountFund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="จำนวนทุนคงเหลือ" DataField="FunReal" SortExpression="FunReal">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="red" />
                                    <ItemStyle HorizontalAlign="Left" ForeColor="red" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="จำนวนเงินต่อทุน" DataField="MuneyPerFund" SortExpression="MuneyPerFund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="วันที่เริ่มให้ทุน" DataField="Start_date" SortExpression="Start_date">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="วันที่สิ้นสุดให้ทุน" DataField="End_date" SortExpression="End_date">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="จำนวนวันคงเหลือ" DataField="Endday" SortExpression="Endday">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="red" />
                                    <ItemStyle HorizontalAlign="Left" ForeColor="red" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="แหล่งทุน" DataField="From_Fund" SortExpression="From_Fund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="ประเภททุน" DataField="Type_Fund" SortExpression="Type_Fund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="อ่าน" DataField="Hits" SortExpression="Hits">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                            </Columns>
                            <EmptyDataTemplate>
                                ไม่พบข้อมูล
                            </EmptyDataTemplate>
                            <PagerSettings Position="TopAndBottom" />
                        </asp:GridView>
                        <div class="text-center">
                            <i>หน้าที่ <%=gvDataTab3.PageIndex + 1%> จาก <%=gvDataTab3.PageCount%> </i>
                        </div>
                    </div>
                </div>
            </div>
            <div id="Tab4" class="tab-pane fade">
                <h2 class="text-center ">ทุนเอกชน</h2>
                <button class="btn btn-info btn-lg" data-target="#myModal" data-toggle="modal" type="button">ค้นหา</button>
                <br />
                <br />
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h1 class="panel-title">รายการ</h1>
                    </div>
                    <div class="table-responsive">
                        <div class="text-center">
                            <i>หน้าที่ <%=gvDataTab4.PageIndex + 1%> จาก <%=gvDataTab4.PageCount%> </i>
                        </div>
                        <asp:GridView ID="gvDataTab4" runat="server" CssClass="table table-bordered table-hover"
                            AllowPaging="true" AllowSorting="true" PageSize="30" AutoGenerateColumns="false" ShowFooter="false">
                            <Columns>
                                <asp:TemplateField HeaderText="ลำดับ">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField HeaderText="ID" DataField="ID" SortExpression="ID">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="วันที่" DataField="DateTime" SortExpression="DateTime">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>



                                <asp:TemplateField HeaderText="ชื่อทุน" SortExpression="Topic">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="selectLink" runat="server"
                                            NavigateUrl='<%#"~/Page/MainRecord/View-News.aspx?id=" + Eval("Topic").ToString()%>'
                                            Target="_Blank" Text='<%# Bind("Topic")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField HeaderText="จำนวนทุน" DataField="CountFund" SortExpression="CountFund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="จำนวนทุนคงเหลือ" DataField="FunReal" SortExpression="FunReal">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="red" />
                                    <ItemStyle HorizontalAlign="Left" ForeColor="red" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="จำนวนเงินต่อทุน" DataField="MuneyPerFund" SortExpression="MuneyPerFund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="วันที่เริ่มให้ทุน" DataField="Start_date" SortExpression="Start_date">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="วันที่สิ้นสุดให้ทุน" DataField="End_date" SortExpression="End_date">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="จำนวนวันคงเหลือ" DataField="Endday" SortExpression="Endday">
                                    <HeaderStyle HorizontalAlign="Center" ForeColor="red" />
                                    <ItemStyle HorizontalAlign="Left" ForeColor="red" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="แหล่งทุน" DataField="From_Fund" SortExpression="From_Fund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="ประเภททุน" DataField="Type_Fund" SortExpression="Type_Fund">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="อ่าน" DataField="Hits" SortExpression="Hits">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                            </Columns>
                            <EmptyDataTemplate>
                                ไม่พบข้อมูล
                            </EmptyDataTemplate>
                            <PagerSettings Position="TopAndBottom" />
                        </asp:GridView>
                        <div class="text-center">
                            <i>หน้าที่ <%=gvDataTab4.PageIndex + 1%> จาก <%=gvDataTab4.PageCount%> </i>
                        </div>
                    </div>
                </div>
            </div>
            <div id="Tab5" class="tab-pane fade in active">
                <asp:MultiView ID="mutiview1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="viewshow" runat="server">

                        <asp:HiddenField ID="hidLastTab" Value="0" runat="server" />
                        <asp:HiddenField ID="hdfmode" runat="server" />
                        <asp:HiddenField ID="hdfid" runat="server" />
                        <asp:HiddenField ID="hdfIDNew" runat="server" />
                        <br />
                        <div class="text-center">
                            <h1 class="panel-title">ข่าวประชาสัมพันธ์ทั่วไป</h1>
                        </div>


                        <div class="form-inline" style="padding-bottom: 10px;">
                            <div class="form-group">
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" autofocus="autofocus" placeholder="คำค้นหา..."></asp:TextBox>
                            </div>
                            <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-primary btn-lg">
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

                    </asp:View>


                    <asp:View ID="viewdetail" runat="server">
                        <div class="container">
                            <div class="messagealert" id="alert_container">
                            </div>

                            <h2 class="text-center">ข่าว</h2>
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <div class="panel panel-primary">
                                <div class="panel-body">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label required">ชื่อข่าว :</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="tbnewHead" runat="server" CssClass="form-control input-lg" ReadOnly="true"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rqfvtxtName" runat="server" ControlToValidate="tbnewHead" Display="Dynamic" CssClass="label label-danger">
                             กรุณากรอกชื่อข่าว
                                                </asp:RequiredFieldValidator>
                                            </div>

                                        </div>
                                        <hr />

                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="inputLarge">
                                                รายละเอียดข่าว :
                                            </label>
                                            <p></p>

                                        </div>
                                        <div class="text-center">
                                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                        </div>

                                        <hr />

                                        <div class="form-group">
                                            <label class="col-md-2 control-label" for="inputLarge">
                                                เอกสารแนบ :
                                            </label>
                                        </div>
                                        <div class="table-responsive">
                                            <asp:GridView ID="gvpic" DataKeyNames="id_imgoss_New" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" AllowPaging="True" PageSize="20">
                                                <Columns>
                                                    <asp:BoundField HeaderText="ลำดับ" DataField="row">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="ขื่อไฟล์" HeaderStyle-Width="1300px">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnnamefile" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "namefile") %>' CommandName="aviewfile" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>" ItemStyle-Width="1800px"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                </Columns>

                                            </asp:GridView>
                                        </div>
                                        <hr />


                                    </div>

                                </div>

                            </div>

                            <asp:LinkButton ID="btnback" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false">
                         <span class="glyphicon glyphicon-chevron-left"></span> &nbsp;กลับไปหน้าข่าว
                            </asp:LinkButton>
                        </div>

                    </asp:View>
                </asp:MultiView>
            </div>
        </div>
    </div>


    <br />

</asp:Content>
