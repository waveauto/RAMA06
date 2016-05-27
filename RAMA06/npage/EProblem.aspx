<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="EProblem.aspx.vb" Inherits="RAMA06.EProblem" ValidateRequest="false" %>
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

            CKEDITOR.replace('<%=tbEProblemsdetial.ClientID%>', { filebrowserImageUploadUrl: '../ckeditor/Upload.ashx' });

        });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="messagealert" id="alert_container">
        </div>
        <asp:HiddenField ID="hdfid" runat="server" />
        <asp:HiddenField ID="hdfrid" runat="server" />
        
        <h2 class="text-center">แก้ไขปัญหาและข้อเสนอแนะ</h2>

        <div class="panel panel-primary">
            <div class="panel-body">
                <div class="form-horizontal">



                    <div class="form-group">
                        <label class="col-md-3 control-label required">ชื่อปัญหาและข้อเสนอแนะ :</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="tbEProblemshead" runat="server" CssClass="form-control input-lg" ReadOnly="true"></asp:TextBox>
                         
                        </div>

                    </div>
                    <hr />
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="inputLarge">
                            รายละเอียดปัญหาและข้อเสนอแนะ :
                        </label>
                    </div>


                    <asp:Literal ID="ltrEProblems" runat="server" Visible="false"></asp:Literal>
                    <asp:TextBox ID="tbEProblemsdetial" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine" ReadOnly="true" Enabled="false"></asp:TextBox>

                    <hr />
                    <div class="form-group">
                        <div class="form-group">
                            <label class="col-md-3 control-label required">วันที่ลงข้อมูล :</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="tbEdatesend" runat="server" CssClass="form-control input-lg" ReadOnly="true"></asp:TextBox>

                            </div>

                        </div>
                    </div>
                    <hr />

                    <hr />
                    <div class="table-responsive">
                        <asp:GridView ID="gvpic" DataKeyNames="id_imgoss_Problems" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" AllowPaging="True" PageSize="20">
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

                               <%-- <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDel" runat="server" Text="ลบ" CommandName="aDel" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                            </Columns>

                        </asp:GridView>
                    </div>


                            <hr />



                    <div class="text-center">
                        <asp:LinkButton ID="btnEsave" runat="server" CssClass="btn btn-primary btn-lg" Visible="false">
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
</asp:Content>
