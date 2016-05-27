<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="IntellectualProperty.aspx.vb" Inherits="RAMA06.IntellectualProperty" %>
<%@ Register Src="~/userControl/ucSelectProject.ascx" TagPrefix="uc1" TagName="ucSelectProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="text-left">ขอแจ้งจดทรัพย์สินทางปัญญา(จดลิขสิทธิ์/สิทธิบัตร/อนุสิทธิบัตร) : </h1>
        <div class="panel panel-primary">
            <div class="container">
                <div class="panel-body">
                    <asp:MultiView ID="Multiview1" runat="server" ActiveViewIndex="0">
                        <asp:View ID="viewAllData" runat="server">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">วันที่ :</label>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">โครงการวิจัยเรื่อง(ไทย) :</label>
                                    <div class="col-md-7">
                                        <asp:TextBox ID="txtNameThai" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="col-md-1">
                                        <asp:Button ID="btnSearchPj" runat="server" CssClass="btn btn-primary" Text="ค้นหา" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">โครงการวิจัยเรื่อง(อังกฤษ) :</label>
                                    <div class="col-md-7">
                                        <asp:TextBox ID="txtNameEng" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">ชื่อสิ่งประดิดฐ์ หรือชื่อผลงาน :</label>
                                    <div class="col-md-7">
                                        <asp:TextBox ID="txtNameObj" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">ประเภทการจด :</label>
                                    <div class="col-md-6">
                                        <div class="radio">
                                            <label>
                                                <asp:RadioButton ID="rdbT11" runat="server" GroupName="T1" />จดลิขสิทธิ์</label>
                                        </div>
                                        <div class="radio">
                                            <label>
                                                <asp:RadioButton ID="rdbT12" runat="server" GroupName="T1" />สิทธิบัตร</label>
                                        </div>
                                         <div class="radio">
                                            <label>
                                                <asp:RadioButton ID="rdbT13" runat="server" GroupName="T1" />อนุสิทธิบัตร</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">เอกสารแนบ :</label>
                                    <div class="col-md-6">
                                        <asp:FileUpload ID="upload1" runat="server"></asp:FileUpload>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-2 col-md-offset-3">
                                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" Text="ยืนยันการส่งข้อมูล" />
                                    </div>
                                </div>

                            </div>
                        </asp:View>
                        <asp:View ID="viewSearchPj" runat="server">
                            <uc1:ucSelectProject runat="server" ID="ucSelectProject" />
                        </asp:View>
                    </asp:MultiView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
