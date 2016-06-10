<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="testindex.aspx.vb" Inherits="RAMA06.testindex1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3>Responsive Bootstrap Carousel with Multi items in ASP.Net</h3>
        </div>
        <div class="panel-body">
            <div class="container">
                <div id="myCarousel2" class="carousel slide">

                    <div class="carousel-inner">
                        <asp:Repeater ID="rptObject" runat="server">
                            <ItemTemplate>
                                <asp:Literal ID="ltCarousel" runat="server"></asp:Literal>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>


                    <a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>


                </div>
            </div>
        </div>
    </div>



</asp:Content>
