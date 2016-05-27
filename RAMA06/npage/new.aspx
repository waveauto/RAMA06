<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="new.aspx.vb" Inherits="RAMA06._new" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:MultiView ID="mutiview1" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewshow" runat="server">
            <asp:HiddenField ID="hdfmode" runat="server" />
            <asp:HiddenField ID="hdfid" runat="server" />
            <asp:HiddenField ID="hdfIDNew" runat="server" />
            <h1 class="panel-title">ข่าวประชาสัมพันธ์ทั่วไป</h1>

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



</asp:Content>
