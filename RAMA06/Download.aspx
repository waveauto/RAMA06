<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="Download.aspx.vb" Inherits="RAMA06.Download" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-default">
        <div class="panel-heading">
            <h4>ดาวน์โหลดแบบฟอร์ม</h4>
        </div>
        <div class="panel-body">
            <div class="panel-group" id="tb" role="tablist" aria-multiselectable="true">

                <%--<div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="h1">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#tb" href="#d1" aria-expanded="true" aria-controls="d1">xx1</a>
                        </h4>
                    </div>
                    <div id="d1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="h1">
                        <div class="panel-body">
                            xxxxxxxxxxxx1
                        </div>
                    </div>
                </div>--%>

                <asp:Literal ID="ltrData" runat="server"></asp:Literal>




            </div>
        </div>
    </div>

</asp:Content>
