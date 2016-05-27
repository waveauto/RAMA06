<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="About.aspx.vb" Inherits="RAMA06.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

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

