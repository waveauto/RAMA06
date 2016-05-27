<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="Manual.aspx.vb" Inherits="RAMA06.Manual" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="text-center">
            <h2>คู่มือการใช้งาน</h2>
        </div>
        <br />
        <div class="jumbotron">

            <%--<div class="form-group" id="divedit" runat="server">
                <asp:LinkButton ID="btnsave" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-plus"></span> &nbsp;แก้ไขAbout
                </asp:LinkButton>

            </div>--%>

            <div class="form-group">
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </div>
        </div>

        <hr />

    </div>
</asp:Content>
