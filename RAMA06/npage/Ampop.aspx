<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="Ampop.aspx.vb" Inherits="RAMA06.Ampop" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script src="../ckeditor/ckeditor.js"></script>

    <script>
        $(function () {
            CKEDITOR.replace('<%=tbdetailname.ClientID%>', { filebrowserImageUploadUrl: '../ckeditor/Upload.ashx' });
         });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="multiview1" runat="server" ActiveViewIndex="0">
           
        <asp:View ID="viewshow" runat="server">
            <h2 class="text-center">การจัดการPopup</h2>
            <asp:HiddenField ID="hdfPopID" runat="server" />
            <div class="form-inline" style="padding-bottom: 10px;">
                <div class="form-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control input-lg" autofocus="autofocus" placeholder="คำค้นหา..."></asp:TextBox>
                </div>
                <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-search"></span> &nbsp;ค้นหา
                </asp:LinkButton>
                <asp:LinkButton ID="btnNew" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-plus"></span> &nbsp;เพิ่มPopup
                </asp:LinkButton>

            </div>

            <div class="table-responsive">
                <asp:GridView ID="gvData" DataKeyNames="PopID" runat="server" CssClass="table table-bordered table-striped table-hover"
                    AllowPaging="true" AllowSorting="true" PageSize="20" AutoGenerateColumns="false" ShowFooter="false">
                    <Columns>
                        <asp:BoundField HeaderText="ลำดับ" DataField="row" ItemStyle-Width="80px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="ชื่อpopup" DataField="headname" ItemStyle-Width="1100px">
                            <HeaderStyle HorizontalAlign="left" />
                            <ItemStyle HorizontalAlign="left" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="ประเภทไฟล์" DataField="typefile" ItemStyle-Width="100px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="สถานะการใช้งาน" ItemStyle-Width="120px">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkStatus" runat="server" AutoPostBack="true"
                                    OnCheckedChanged="chkStatus_CheckedChanged" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="แก้ไข" ItemStyle-Width="80px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" Text="แก้ไข" CommandName="aEdit"
                                    CommandArgument='<%# CType(Container, GridViewRow).RowIndex %>'></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ลบ" ItemStyle-Width="80px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDel" runat="server" Text="ลบ" CommandName="aDel"
                                    CommandArgument='<%# CType(Container, GridViewRow).RowIndex %>'></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
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

        <asp:View ID="viewadd" runat="server">
            <asp:HiddenField ID="hdfrID" runat="server" />
            <h2 class="text-center ">เลือกการกรอกPopUp 

            </h2>
            <br />
            <div class="text-center">
                <div class="form-group">


                    <label class="radio-inline">
                        <asp:RadioButton ID="rdbinsert1" GroupName="insert" runat="server" Text="แสดงข้อมูลเป็นข้อความ" OnSelectedIndexChanged="rdbinsert1_SelectedIndexChanged" AutoPostBack="true" />
                    </label>
                    <label class="radio-inline">
                        <asp:RadioButton ID="rdbinsert2" GroupName="insert" runat="server" Text="แสดงข้อมูลเป็นวิดีโอ" OnSelectedIndexChanged="rdbinsert2_SelectedIndexChanged" AutoPostBack="true" />
                    </label>
                     <label class="radio-inline">
                        <asp:RadioButton ID="rdbinsert3" GroupName="insert" runat="server" Text="แสดงข้อมูลเป็นรูปสไลด์" OnSelectedIndexChanged="rdbinsert3_SelectedIndexChanged" AutoPostBack="true" />
                    </label>


                </div>
            </div>
            <hr />

        </asp:View>

        <asp:View ID="viewaddtext" runat="server">
            <div class="container">
                <asp:HiddenField ID="hdfmodetext" runat="server" />
                <h2 class="text-center">ข้อมูลpopupเป็นข้อความ</h2>
                <div class="panel panel-primary">
                    <div class="panel-body">


                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-md-3 control-label required">ชื่อPopup :</label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="tbheadname" runat="server" CssClass="form-control input-lg" placeholder="ชื่อPopup"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqfvtxtName" runat="server" ControlToValidate="tbheadname" Display="Dynamic" CssClass="label label-danger">
                             กรุณากรอกชื่อPopup
                                    </asp:RequiredFieldValidator>
                                </div>

                            </div>
                            <hr />
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="inputLarge">
                                    รายละเอียดpopup :
                                </label>
                            </div>


                            <asp:Literal ID="Literal1" runat="server" Visible="false"></asp:Literal>
                            <asp:TextBox ID="tbdetailname" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine"></asp:TextBox>


                            <hr />
                            <div class="form-group">
                                <label class="col-md-3 control-label required">แนบไฟล์ (ถ้ามี) :</label>
                                <div class="col-md-4">
                                    <asp:FileUpload ID="FileUpload4" class="form-control input-lg" runat="server" />
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-md-3"></label>

                                <div class="col-md-4">
                                    <asp:LinkButton ID="btnupload" runat="server" CssClass="btn btn-primary btn-lg" CausesValidation="false">
                                    <span class="glyphicon glyphicon-circle-arrow-down"></span> &nbsp;Upload File
                                    </asp:LinkButton>
                                </div>
                                <hr />
                                
                            </div>

                            <div class="table-responsive">
                                <asp:GridView ID="gvpic" DataKeyNames="id_imgoss_popup" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" AllowPaging="True" PageSize="20">
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

                                        <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnDel" runat="server" Text="ลบ" CommandName="aDel" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>
                            </div>
                            <hr />

                            <div class="text-center">
                                <%-- <asp:LinkButton ID="btnview" runat="server" CssClass="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                         <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp;Preview
                                </asp:LinkButton>--%>

                                <asp:LinkButton ID="btnsave" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp;บันทึกข้อมูล
                                </asp:LinkButton>
                            </div>
                            <asp:LinkButton ID="btnback" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false">
                         <span class="glyphicon glyphicon-chevron-left"></span> &nbsp;กลับหน้าเมนู
                            </asp:LinkButton>

                        </div>



                    </div>

                </div>
            </div>
        </asp:View>

        <asp:View ID="viewaddvideo" runat="server">
            <asp:HiddenField ID="hdfmodevideo" runat="server" />
            <div class="container">
                <h2 class="text-center">ข้อมูลpopupเป็นไฟล์วิดีโอ</h2>
                <div class="panel panel-success">
                    <div class="panel-body">

                        <div class="form-horizontal">

                            <div class="form-group">
                                <label class="col-md-3 control-label required">ชื่อไฟล์วิดีโอ :</label>
                                <div class="col-md-5">
                                    <asp:TextBox ID="tbHeadvideo" runat="server" CssClass="form-control input-lg"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbHeadvideo" Display="Dynamic" CssClass="label label-danger">
                             กรุณากรอกชื่อไฟล์วิดีโอ
                                    </asp:RequiredFieldValidator>
                                </div>

                            </div>
                            <hr />

                            <div class="form-group">
                                <label class="col-md-3 control-label required">แนบไฟล์วิดีโอ :</label>
                                <div class="col-md-5">
                                    <asp:FileUpload ID="FileUpload1" class="form-control input-lg" runat="server" />
                                </div>

                            </div>

                            <div class="text-center">
                                <%-- <asp:LinkButton ID="btnview" runat="server" CssClass="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                         <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp;Preview
                                </asp:LinkButton>--%>

                                <asp:LinkButton ID="btnsavevideo" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp;บันทึกข้อมูล
                                </asp:LinkButton>
                            </div>

                            <hr />

                            <asp:LinkButton ID="btnbackvideo" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false">
                         <span class="glyphicon glyphicon-chevron-left"></span> &nbsp;กลับหน้าเมนู
                            </asp:LinkButton>


                        </div>

                    </div>

                </div>




            </div>
        </asp:View>

        <asp:View ID="viewaddslid" runat="server">
            <div class="container">
                  <asp:HiddenField ID="hdfmodepicslid" runat="server" />
                <h2 class="text-center">ข้อมูลpopupเป็นรุปสไลด์</h2>
                <div class="panel panel-warning">
                    <div class="panel-body">
                        <div class="form-horizontal">

                            <div class="form-group">
                                <label class="col-md-3 control-label required">ชื่อPopup :</label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="tbpicheadname" runat="server" CssClass="form-control input-lg" placeholder="ชื่อPopup"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbpicheadname" Display="Dynamic" CssClass="label label-danger">
                             กรุณากรอกชื่อPopup
                                    </asp:RequiredFieldValidator>
                                </div>

                            </div>
                            <hr />
                            <hr />
                            <div class="form-group">
                                <label class="col-md-3 control-label required">แนบไฟล์ (ถ้ามี) :</label>
                                <div class="col-md-4">
                                    <asp:FileUpload ID="FileUpload2" class="form-control input-lg" runat="server" />
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-md-3"></label>

                                <div class="col-md-4">
                                    <asp:LinkButton ID="btnsavepicslid" runat="server" CssClass="btn btn-primary btn-lg" CausesValidation="false">
                                    <span class="glyphicon glyphicon-circle-arrow-down"></span> &nbsp;Upload File
                                    </asp:LinkButton>
                                </div>
                                <hr />

                            </div>

                            <div class="table-responsive">
                                <asp:GridView ID="gvpicpop" DataKeyNames="id_imgoss_popup" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" AllowPaging="True" PageSize="20">
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

                                        <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnDel" runat="server" Text="ลบ" CommandName="aDel" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>
                            </div>
                            <hr />


                            <div class="text-center">
                                <%-- <asp:LinkButton ID="btnview" runat="server" CssClass="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                         <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp;Preview
                                </asp:LinkButton>--%>

                                <asp:LinkButton ID="btnsavepicpop" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp;บันทึกข้อมูล
                                </asp:LinkButton>
                            </div>
                            <asp:LinkButton ID="btnbackpicpopup" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false">
                         <span class="glyphicon glyphicon-chevron-left"></span> &nbsp;กลับหน้าเมนู
                            </asp:LinkButton>




                        </div>

                    </div>

                </div>



            </div>





        </asp:View>
    </asp:MultiView>
</asp:Content>
