<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="ADownload.aspx.vb" Inherits="RAMA06.ADownload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:MultiView ID="multiview1" runat="server" ActiveViewIndex="0">

            <asp:View ID="viewAllCatData" runat="server">
                <h2 class="text-center">หมวดหมู่ไฟล์</h2>
                <div class="form-inline" style="padding-bottom:10px;">
                    <div class="form-group">
                        <asp:TextBox ID="txtCatSearch" runat="server" CssClass="form-control input-lg" autofocus="autofocus"></asp:TextBox>
                    </div>
                    <button type="submit" id="btnCatSearch" runat="server" class="btn btn-lg btn-primary">
                        <span class="glyphicon glyphicon-search"></span>&nbsp;ค้นหาข้อมูล
                    </button>

                    <asp:LinkButton ID="btnCatNew" runat="server" CssClass="btn btn-lg btn-primary">
                        <span class="glyphicon glyphicon-plus"></span>&nbsp;เพิ่มใหม่
                    </asp:LinkButton>
                </div>

                <div class="table-responsive">
                    <asp:GridView ID="gvCatData" runat="server" CssClass="table table-bordered" DataKeyNames="ID"
                        AllowPaging="false" AllowSorting="true" PageSize="10" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="ลำดับ">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="ชื่อหมวดหมู่" DataField="Name" SortExpression="a.Name">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="ลำดับที่แสดง" DataField="sort" SortExpression="a.sort">
                                <HeaderStyle HorizontalAlign="center" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="จำนวนไฟล์" SortExpression="count(b.ID)">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnFile" runat="server" CommandName="aFile" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>">
                                        <%#Eval("nFile")%>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="สถานะการใช้งาน" SortExpression="a.status">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkStatus" runat="server" AutoPostBack="true"
                                        OnCheckedChanged="chkCatStatus_CheckedChanged" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="แก้ไขข้อมูล">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" Text="แก้ไข" CommandName="aEdit"
                                        CommandArgument='<%# CType(Container, GridViewRow).RowIndex %>'></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ลบข้อมูล">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" Text="ลบ" CommandName="aDelete"
                                        CommandArgument='<%# CType(Container, GridViewRow).RowIndex %>' OnClientClick='return confirm("ยืนยันการลบข้อมูล \nท่านต้องการลบข้อมูลใช่หรือไม่?");' ></asp:LinkButton>
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

                <div class="form-inline">
                    <div class="form-group">
                        <label class="control-label" for="<%=ddlCatPage.ClientID %>">หน้า</label>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList ID="ddlCatPage" runat="server" CssClass="form-control" AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label class="control-label">จากทั้งหมด</label>
                        <asp:Label ID="lblCatAllPage" runat="server" CssClass="control-label"></asp:Label>
                        <label class="control-label">หน้า</label>
                    </div>
                </div>

            </asp:View>

            <asp:View ID="viewAddCatData" runat="server">
                <h2 class="text-left">หมวดหมู่ไฟล์</h2>
                <asp:Label ID="lblCatSubtitle" runat="server"></asp:Label>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-md-2">ชื่อหมวดหมู่</label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtCatName" runat="server" CssClass="form-control" autofocus="autofocus"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqvtxtCatName" runat="server" ControlToValidate="txtCatName"
                                Display="Dynamic" SetFocusOnError="true" CssClass="label label-danger">
                            กรุณากรอก
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">ลำดับที่แสดง</label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtCatSort" runat="server" CssClass="form-control"></asp:TextBox>
                           <%-- <asp:RequiredFieldValidator ID="reqvtxtCatSort" runat="server" ControlToValidate="txtCatSort"
                                Display="Dynamic" SetFocusOnError="true" CssClass="label label-danger">
                            กรุณากรอก
                            </asp:RequiredFieldValidator>--%>
                            <asp:CompareValidator ID="comptxtCatSort" runat="server" ControlToValidate="txtCatSort" Operator="DataTypeCheck" Type="Integer"
                                Display="Dynamic" SetFocusOnError="true" CssClass="label label-danger">
                            กรุณากรอกเป็นตัวเลข
                            </asp:CompareValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-3 col-md-offset-2">
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="chkCatStatus" runat="server" />
                                    ใช้งาน
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-3 col-md-offset-2">

                            <asp:LinkButton ID="btnBack" runat="server" CssClass="btn btn-lg btn-default" CausesValidation="false">
                                <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;ย้อนกลับ
                            </asp:LinkButton>

                            <button type="submit" id="btnCatSave" runat="server" class="btn btn-lg btn-success">
                                <span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;บันทึก
                            </button>

                        </div>
                    </div>


                </div>
            </asp:View>

            <asp:View ID="viewAllFileData" runat="server">
                <h2>ไฟล์ <small>หมวดหมู่ : <asp:Literal ID="ltrCatFile1" runat="server"></asp:Literal> </small></h2>
                <div class="form-inline" style="padding-bottom:10px;">
                    <div class="form-group">
                        <asp:TextBox ID="txtFileSearch" runat="server" CssClass="form-control input-lg" autofocus="autofocus"></asp:TextBox>
                    </div>
                    <button type="submit" id="btnFileSearch" runat="server" class="btn btn-lg btn-primary">
                        <span class="glyphicon glyphicon-search"></span>&nbsp;ค้นหาข้อมูล
                    </button>
                    <asp:LinkButton ID="btnFileNew" runat="server" CssClass="btn btn-lg btn-primary">
                        <span class="glyphicon glyphicon-plus"></span>&nbsp;เพิ่มใหม่
                    </asp:LinkButton>
                </div>

                <div class="table-responsive">
                    <asp:GridView ID="gvFileData" runat="server" CssClass="table table-bordered" DataKeyNames="ID"
                        AllowPaging="false" AllowSorting="true" PageSize="10" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="ลำดับ">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="ชื่อไฟล์" DataField="Name" SortExpression="a.Name">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="ลำดับที่แสดง" DataField="sort" SortExpression="a.sort">
                                <HeaderStyle HorizontalAlign="center" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="ตัวอย่าง" >
                                <ItemTemplate>
                                    <asp:Literal ID="ltrExample" runat="server"></asp:Literal>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="แบบฟอร์ม">
                                <ItemTemplate>
                                    <asp:Literal ID="ltrForm" runat="server"></asp:Literal>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="สถานะการใช้งาน" SortExpression="a.status">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkFileStatus" runat="server" AutoPostBack="true"
                                        OnCheckedChanged="chkFileStatus_CheckedChanged" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="แก้ไขข้อมูล">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" Text="แก้ไข" CommandName="aEdit"
                                        CommandArgument='<%# CType(Container, GridViewRow).RowIndex %>'></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ลบข้อมูล">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" Text="ลบ" CommandName="aDelete"
                                        CommandArgument='<%# CType(Container, GridViewRow).RowIndex %>' OnClientClick='return confirm("ยืนยันการลบข้อมูล \nท่านต้องการลบข้อมูลใช่หรือไม่?");' ></asp:LinkButton>
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

                <div class="form-inline">
                    <div class="form-group">
                        <label class="control-label" for="<%=ddlFilePage.ClientID%>">หน้า</label>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList ID="ddlFilePage" runat="server" CssClass="form-control" AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label class="control-label">จากทั้งหมด</label>
                        <asp:Label ID="lblFileAllPage" runat="server" CssClass="control-label"></asp:Label>
                        <label class="control-label">หน้า</label>
                    </div>
                </div>

                <div style="padding-top:10px;">
                    <asp:LinkButton ID="btnFileBack1" runat="server" CssClass="btn btn-default" CausesValidation="false">
                        <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;ย้อนกลับ
                    </asp:LinkButton>
                </div>

            </asp:View>

            <asp:View ID="viewAddFileData" runat="server">
                <h2>ไฟล์ <small>หมวดหมู่ : <asp:Literal ID="ltrCatFile2" runat="server"></asp:Literal></small></h2>
                <asp:Label ID="lblFileSubtitle" runat="server"></asp:Label>
                <div class="form-horizontal">

                    <div class="form-group">
                        <label class="control-label col-md-2">ชื่อเอกสาร :</label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtFileName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqvtxtFileName" runat="server" ControlToValidate="txtFileName"
                                Display="Dynamic" SetFocusOnError="true" CssClass="label label-danger">
                            กรุณากรอกชื่อเอกสาร
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">ตัวอย่าง :</label>
                        <div class="col-md-10">
                            <asp:Literal ID="ltrFileExample" runat="server"></asp:Literal>
                            <asp:HiddenField ID="hdfOldFileExample" runat="server" />
                            <asp:FileUpload ID="uploadExample" runat="server" />
                        </div>
                        
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">แบบฟอร์ม :</label>
                        <div class="col-md-10">
                            <asp:Literal ID="ltrFileForm" runat="server"></asp:Literal>
                            <asp:HiddenField ID="hdfOldFileForm" runat="server" />
                            <asp:FileUpload ID="uploadForm" runat="server" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">ลำดับที่แสดง :</label>
                        <div class="col-md-1">
                            <asp:TextBox ID="txtFileSort" runat="server" CssClass="form-control text-right"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="reqvtxtSort" runat="server" ControlToValidate="txtSort"
                            Display="Dynamic" SetFocusOnError="true" CssClass="label label-danger">
                            กรุณากรอก
                        </asp:RequiredFieldValidator>--%>
                            <asp:CompareValidator ID="comptxtFileSort" runat="server" ControlToValidate="txtFileSort" Operator="DataTypeCheck" Type="Integer"
                                Display="Dynamic" SetFocusOnError="true" CssClass="label label-danger">
                            กรุณากรอกเป็นตัวเลข
                            </asp:CompareValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">หมายเหตุ :</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtFileRemark" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-3 col-md-offset-2">
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="chkFileStatus" runat="server" />
                                    สถานะการใช้งาน
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-10 col-md-offset-2">
                            <asp:LinkButton ID="btnFileBack" runat="server" CssClass="btn btn-default" CausesValidation="false">
                                <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;ย้อนกลับ
                            </asp:LinkButton>
                            <button type="button" id="btnFileSave" runat="server" class="btn btn-success">
                                <span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;บันทึกข้อมูล
                            </button>
                        </div>
                    </div>


                </div>
            </asp:View>

        </asp:MultiView>

        <asp:HiddenField ID="hdfSortField" runat="server" />
        <asp:HiddenField ID="hdfSortDirectoin" runat="server" />

        <asp:HiddenField ID="hdfMode" runat="server" />
        <asp:HiddenField ID="hdfID" runat="server" />
        <asp:HiddenField ID="hdfCatID" runat="server" />
        <asp:HiddenField ID="hdfFlagSave" runat="server" />
    </div>
</asp:Content>
