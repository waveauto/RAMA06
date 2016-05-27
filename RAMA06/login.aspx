<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="login.aspx.vb" Inherits="RAMA06.login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
 <div class="container">
        <div class="page-header">
            <h1 class="text-center">เข้าใช้งานระบบ</h1>
            
        </div>
<!-- Simple Login - START -->
        <div class="form-group">
            <asp:TextBox ID="tbusername" runat="server" class="form-control input-lg" placeholder="User Name"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:TextBox ID="tbpassword" runat="server" class="form-control input-lg" placeholder="Password" TextMode="Password"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="cmdLogin" runat="server" class="btn btn-primary btn-lg btn-block" Text="Sign In" />
             </div>
        <br />
        <br />
        <br />
        <br />
        <br />
<!-- Simple Login - END -->
    </div>
    <br />
</asp:Content>
