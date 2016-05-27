﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="Epriv.aspx.vb" Inherits="RAMA06.Epriv" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../ckeditor/ckeditor.js"></script>
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

     <script>
         $(function () {
             CKEDITOR.replace('<%=tbprivdetail.ClientID%>', { filebrowserImageUploadUrl: '../ckeditor/Upload.ashx' });
         });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="messagealert" id="alert_container">
        </div>
        <asp:HiddenField ID="hdfid" runat="server" />
        <asp:HiddenField ID="hdfrid" runat="server" />
        <h2 class="text-center">ข่าวทุนเอกชน</h2>
        <div class="panel panel-primary">
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-3 control-label required">ชื่อทุนเอกชน :</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="tbprivHead" runat="server" CssClass="form-control input-lg" placeholder="ชื่อทุน"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqfvtxtName" runat="server" ControlToValidate="tbprivHead" Display="Dynamic" CssClass="label label-danger">
                             กรุณากรอกชื่อทุนเอกชน
                            </asp:RequiredFieldValidator>
                        </div>

                    </div>
                    <hr />

                    <div class="form-group">
                        <label class="col-md-3 control-label" for="inputLarge">
                            รายละเอียดข่าว :
                        </label>
                    </div>


                    <asp:Literal ID="Literal1" runat="server" Visible="false"></asp:Literal>
                    <asp:TextBox ID="tbprivdetail" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine"></asp:TextBox>


                    <hr />

                    <div class="form-group">
                        <label class="col-md-3" for="comment">แนบไฟล์ (ถ้ามี)</label>
                        <asp:FileUpload ID="FileUpload4" class="form-control input-lg" runat="server" />
                        <hr />
                        <div class="col-md-4">
                            <asp:LinkButton ID="btnupload" runat="server" CssClass="btn btn-primary btn-lg" CausesValidation="false">
                                    <span class="glyphicon glyphicon-circle-arrow-down"></span> &nbsp;Upload File
                            </asp:LinkButton>
                        </div>

                    </div>

                    <div class="table-responsive">
                        <asp:GridView ID="gvpic" DataKeyNames="id_imgoss_foundpriv" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" AllowPaging="True" PageSize="20">
                            <Columns>
                                <asp:BoundField HeaderText="ลำดับ" DataField="row">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="ขื่อไฟล์" HeaderStyle-Width="1300px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnnamefile" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "namefile") %>' CommandName="aviewfile" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>" ItemStyle-Width="1800px"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDel" runat="server" Text="ลบ" CommandName="aDel" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </div>
                    <hr />



                    <div class="form-group">
                        <label class=" col-md-3 control-label" for="inputLarge">
                            กำหนด i-con New :</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlstatusdate" class="form-control input-lg" runat="server">
                                <asp:ListItem>1 วัน</asp:ListItem>
                                <asp:ListItem>2 วัน</asp:ListItem>
                                <asp:ListItem>3 วัน</asp:ListItem>
                                <asp:ListItem>แสดงตลอด</asp:ListItem>
                                <asp:ListItem>ไม่แสดง</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                    </div>

                    <hr />
                    <div class="text-center">
                        <%-- <asp:LinkButton ID="btnview" runat="server" CssClass="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                         <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp;Preview
                                </asp:LinkButton>--%>

                        <asp:LinkButton ID="btnsave" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp;บันทึกข้อมูล
                        </asp:LinkButton>
                    </div>
                    <asp:LinkButton ID="btnback" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false">
                         <span class="glyphicon glyphicon-chevron-left"></span> &nbsp;กลับหน้าเมนู
                    </asp:LinkButton>



                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">ตัวอย่าง</h4>
                                </div>
                                <div class="modal-body">
                                    <label class="col-md-3" for="comment"></label>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control input-lg"></asp:TextBox>
                                    <asp:Literal ID="ltrpre" runat="server"></asp:Literal>


                                </div>
                                <%-- <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>--%>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>





    </div>
</asp:Content>
