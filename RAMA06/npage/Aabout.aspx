<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="Aabout.aspx.vb" Inherits="RAMA06.Aabout" ValidateRequest="false"%>
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
            CKEDITOR.replace('<%=tbdetaildetailabout.ClientID%>', { filebrowserImageUploadUrl: '../ckeditor/Upload.ashx' });

        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-group">
            <div class="messagealert" id="alert_container">
            </div>
        </div>
        <br />
      

        <h1 align="center">บันทึกเกี่ยวกับระบบ About</h1>
        <div class="panel panel-primary">
            <div class="panel-body">
                <asp:HiddenField ID="hdfmode" runat="server" />
                <asp:HiddenField ID="hdfid" runat="server" />
                <div class="form-group">
                    <label class="control-label" for="inputLarge">
                    </label>
                    <asp:Literal ID="Literal1" runat="server" Visible="false"></asp:Literal>
                    <asp:TextBox ID="tbdetaildetailabout" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine"></asp:TextBox>

                </div>

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
</asp:Content>
