﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="testindex.aspx.vb" Inherits="RAMA06.testindex1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="modal fade" id="myModalslid" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"></h4>
                </div>
                <div class="modal-body">


                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                          <%--  <div class="item active">
                                <img src="Images/G1.jpg" alt="...">
                                <div class="carousel-caption">
                                    ...
                                </div>
                            </div>
                            <div class="item">
                                <img src="Images/G2.jpg" alt="...">
                                <div class="carousel-caption">
                                    ...
                                </div>
                            </div>

                             <div class="item">
                                <img src="Images/G3.jpg" alt="...">
                                <div class="carousel-caption">
                                    ...
                                </div>
                            </div>--%>

                            <asp:Repeater ID="images" runat="server">
                                <AlternatingItemTemplate>
                                    <div class="item active">
                                        <img src="<%# Eval("file_path").ToString()%>" />
                                        <%--<img src='/resimler/<%#Eval("SliderResim")%>' class="img-responsive" alt="">--%>
                                    </div>
                                </AlternatingItemTemplate>

                                <ItemTemplate>
                                    <div class="item">
                                        <img src="<%# Eval("file_path").ToString() %>" />
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>





                            ...
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>










                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>


</asp:Content>
