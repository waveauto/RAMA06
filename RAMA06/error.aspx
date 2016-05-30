<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="error.aspx.vb" Inherits="RAMA06._error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-left">เกิดข้อผิดพลาด : </h1>
    <div class="panel panel-primary">
        <div class="container">
            <div class="panel-body">
                <asp:Literal ID="ltrMsg" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
</asp:Content>
