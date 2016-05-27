<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="nlogregis.aspx.vb" Inherits="RAMA06.nlogregis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="page-header">
            <h1 class="text-center">กรอกข้อมูล</h1>

        </div>
        <!-- Simple Login - START -->
        <div class="form-group">
            <asp:TextBox ID="tbcodestaff" runat="server" class="form-control input-lg" placeholder="รหัสบุคคล"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:TextBox ID="tbpassword" runat="server" class="form-control input-lg" placeholder="รหัสผ่าน" TextMode="Password"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="cmdLogin" runat="server" class="btn btn-primary btn-lg btn-block" Text="Sign In" />
        </div>
        <br />
        <br />
        <br />
        <!-- Simple Login - END -->
    </div>
</asp:Content>
