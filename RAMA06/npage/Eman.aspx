<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="Eman.aspx.vb" Inherits="RAMA06.Eman" ValidateRequest="false" %>
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

            CKEDITOR.replace('<%=tbdetailmanual.ClientID%>', { filebrowserImageUploadUrl: '../ckeditor/Upload.ashx' });

        });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="messagealert" id="alert_container">
        </div>
        <asp:HiddenField ID="hdfIDmanual" runat="server" />
        <h2 class="text-center">แก้ไขคู่มือ</h2>
        <div class="panel panel-primary">
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-3 control-label required">ชื่อคู่มือ :</label>
                        <div class="col-md-5">
                            <asp:TextBox ID="tbHeadmanual" runat="server" CssClass="form-control input-lg"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqfvtxtName" runat="server" ControlToValidate="tbHeadmanual" Display="Dynamic" CssClass="label label-danger">
                             กรุณากรอกชื่อคู่มือ
                            </asp:RequiredFieldValidator>
                        </div>

                    </div>
                    <hr />

                    <div class="form-group">
                        <label class="col-md-3 control-label" for="inputLarge">
                            รายละเอียดคู่มือ :
                        </label>
                    </div>


                    <asp:Literal ID="Literal1" runat="server" Visible="false"></asp:Literal>
                    <asp:TextBox ID="tbdetailmanual" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine"></asp:TextBox>


                    <hr />


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





                </div>

            </div>

        </div>





    </div>
</asp:Content>
