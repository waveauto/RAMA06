﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="Afoot.aspx.vb" Inherits="RAMA06.Afoot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
        .messagealert {
            width: 40%;
            /*position: fixed;*/
            top: 200px;
            z-index: 70000;
            padding: 0;
            font-size: 15px;
            width: auto;
            height: 20px;
            line-height: 20px;
        }
    </style>


    <script type="text/javascript">
        function ShowMessage(message, messagetype) {
            var cssclass;
            switch (messagetype) {
                case 'Success':
                    cssclass = 'alert-success'
                    break;
                case 'Error':
                    cssclass = 'alert-danger'
                    break;
                case 'Warning':
                    cssclass = 'alert-warning'
                    break;
                default:
                    cssclass = 'alert-info'
            }
            $('#alert_container').append('<div id="alert_div" style="margin: 0 0.5%; -webkit-box-shadow: 3px 4px 6px #999;" class="alert fade in ' + cssclass + '"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>' + messagetype + '!</strong> <span>' + message + '</span></div>');

            setTimeout(function () {
                $("#alert_div").fadeTo(2000, 500).slideUp(500, function () {
                    $("#alert_div").remove();
                });
            }, 5000);//5000=5 seconds
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:MultiView ID="mutiview1" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewshow" runat="server">
            <asp:HiddenField ID="hdfmode" runat="server" />
            <asp:HiddenField ID="hdfid" runat="server" />
            <asp:HiddenField ID="hdfIDNew" runat="server" />

            <div class="form-inline" style="padding-bottom: 10px;">
                <div class="form-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" autofocus="autofocus" placeholder="คำค้นหา..."></asp:TextBox>
                </div>
                <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-search"></span> &nbsp;ค้นหา
                </asp:LinkButton>
                 <asp:LinkButton ID="btnNew" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-plus"></span> &nbsp;เพิ่มFooter
                </asp:LinkButton>

            </div>

            <div class="table-responsive">
                <asp:GridView ID="gvData" DataKeyNames="IDfoot" runat="server" CssClass="table table-bordered table-striped table-hover"
                    AllowPaging="true" AllowSorting="true" PageSize="20" AutoGenerateColumns="false" ShowFooter="false">
                    <Columns>
                        <asp:BoundField HeaderText="ลำดับ" DataField="row">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="ชื่อหน่วย" DataField="namedept" SortExpression="dutyName">
                            <HeaderStyle HorizontalAlign="left" />
                            <ItemStyle HorizontalAlign="left" />
                        </asp:BoundField>
                        
                        <asp:TemplateField HeaderText="สถานะการใช้งาน" SortExpression="status">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkStatus" runat="server" AutoPostBack="true"
                                    OnCheckedChanged="chkStatus_CheckedChanged" />
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
                        
                    </Columns>
                    <EmptyDataTemplate>
                        ไม่พบข้อมูล
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>

            <asp:HiddenField ID="hdfSortField" runat="server" />
            <asp:HiddenField ID="hdfSortDirectoin" runat="server" />
            <p></p>
            <div class="form-inline">
                <div class="form-group">
                    <label class="control-label" for="<%=ddlPage.ClientID %>">หน้า</label>
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="ddlPage" runat="server" CssClass="form-control" AutoPostBack="true">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="control-label">จากทั้งหมด</label>
                    <asp:Label ID="lblAllPage" runat="server" CssClass="control-label"></asp:Label>
                    <label class="control-label">หน้า</label>
                </div>
            </div>


        </asp:View>
        <asp:View ID="viewadd" runat="server">
            <div class="container">
                <div class="messagealert" id="alert_container">
                </div>
            
                <h2 class="text-center">กำหนด Page Footer</h2>
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="inputLarge">
                                    ชื่อหน่วย :
                                </label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="tbnamedept" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine"></asp:TextBox>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="inputLarge">
                                    HeadFoot :
                                </label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="tbheadfoot" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine"></asp:TextBox>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="inputLarge">
                                    Middle Foot :
                                </label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="tbmidfoot" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine"></asp:TextBox>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="inputLarge">
                                    Foot :
                                </label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="tbfootfoot" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine"></asp:TextBox>
                                </div>

                            </div>

                            <hr />

                            <div class="text-center">
                                <asp:LinkButton ID="btnsave" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp;บันทึกข้อมูล
                                </asp:LinkButton>
                            </div>
                            <asp:LinkButton ID="btnback" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false">
                         <span class="glyphicon glyphicon-chevron-left"></span> &nbsp;กลับหน้าเมนู
                            </asp:LinkButton>

                        </div>

                    </div>

                </div>





            </div>
        </asp:View>
        <asp:View ID="viewedit" runat="server">
            <div class="container">
                <div class="messagealert" id="alert_container">
                </div>

                <h2 class="text-center">กำหนด Page Footer</h2>
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="inputLarge">
                                    ชื่อหน่วย :
                                </label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="tbEnamedept" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine"></asp:TextBox>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="inputLarge">
                                    HeadFoot :
                                </label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="tbEheadfoot" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine"></asp:TextBox>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="inputLarge">
                                    Middle Foot :
                                </label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="tbEmidfoot" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine"></asp:TextBox>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="inputLarge">
                                    Foot :
                                </label>
                                <div class="col-md-8">
                                    <asp:TextBox ID="tbEfootfoot" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine"></asp:TextBox>
                                </div>

                            </div>

                            <hr />

                            <div class="text-center">
                                <asp:LinkButton ID="btnEsave" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp;บันทึกข้อมูล
                                </asp:LinkButton>
                            </div>
                            <asp:LinkButton ID="btnEback" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false">
                         <span class="glyphicon glyphicon-chevron-left"></span> &nbsp;กลับหน้าเมนู
                            </asp:LinkButton>

                        </div>

                    </div>

                </div>





            </div>
        </asp:View>
    </asp:MultiView>

    
</asp:Content>
