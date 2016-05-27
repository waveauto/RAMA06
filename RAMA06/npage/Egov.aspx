<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="Egov.aspx.vb" Inherits="RAMA06.Egov" ValidateRequest="false" %>
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
         $(document).ready(function () {

             $('#<%=tbdatefound.ClientID%>').datetimepicker({
                 format: "m/d/Y",
                 timepicker: false
             });
         });
         $(document).ready(function () {

             $('#<%=tbendfound.ClientID%>').datetimepicker({
                 format: "m/d/Y",
                 timepicker: false
             });
         });
    </script>

     <script>
         $(function () {
             CKEDITOR.replace('<%=tbdetailfound.ClientID%>', { filebrowserImageUploadUrl: '../ckeditor/Upload.ashx' });
         });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="messagealert" id="alert_container">
        </div>
        <asp:HiddenField ID="hdfmode" runat="server" />
        <asp:HiddenField ID="hdfid" runat="server" />
        <asp:HiddenField ID="hdfrid" runat="server" />
        <h2 class="text-center">ทุนรัฐบาล</h2>
        <div class="panel panel-primary">
            <div class="panel-body">
                <div class="form-horizontal">

                    <div class="form-group">
                        <label class="col-md-3 control-label required">ชื่อทุน :</label>
                        <div class="col-md-7">
                            <asp:TextBox ID="tbnamefound" runat="server" CssClass="form-control input-lg" placeholder="ชื่อทุน"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqfvtxtName" runat="server" ControlToValidate="tbnamefound" Display="Dynamic" CssClass="label label-danger">
                             กรุณากรอกชื่อทุน
                            </asp:RequiredFieldValidator>
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" for="inputLarge">
                            รายละเอียดข่าว :
                        </label>
                    </div>


                    <asp:Literal ID="Literal1" runat="server" Visible="false"></asp:Literal>
                    <asp:TextBox ID="tbdetailfound" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine"></asp:TextBox>


                    <hr />

                    <div class="form-group">
                        <label class="col-md-3 control-label required">จำนวนทุน :</label>
                        <div class="col-md-2">
                            <asp:TextBox ID="tbnumfound" runat="server" CssClass="form-control input-lg" placeholder="จำนวนทุน"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbnumfound" Display="Dynamic" CssClass="label label-danger">
                             กรุณากรอกจำนวนทุน
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbnumfound"
                                ErrorMessage="กรุณากรอกตัวเลขค่ะ" CssClass="label label-danger"
                                SetFocusOnError="true" Display="Dynamic" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label required">จำนวนเงินต่อทุน :</label>
                        <div class="col-md-3">
                            <asp:TextBox ID="tbnummoneyfound" runat="server" CssClass="form-control input-lg" placeholder="จำนวนเงินต่อทุน"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbnummoneyfound" Display="Dynamic" CssClass="label label-danger">
                             กรุณากรอกจำนวนเงินต่อทุน 
                            </asp:RequiredFieldValidator>
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label required">วันที่เริ่มให้ทุน :</label>
                        <div class="col-md-2">
                            <asp:TextBox ID="tbdatefound" runat="server" CssClass="form-control input-lg" placeholder="วันที่เริ่มให้ทุน"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbdatefound" Display="Dynamic" CssClass="label label-danger">
                             กรุณากรอกวันที่เริ่มให้ทุน
                            </asp:RequiredFieldValidator>
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label required">วันที่สิ้นสุดให้ทุน :</label>
                        <div class="col-md-2">
                            <asp:TextBox ID="tbendfound" runat="server" CssClass="form-control input-lg" placeholder="วันที่สิ้นสุดให้ทุน"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbendfound" Display="Dynamic" CssClass="label label-danger">
                             กรุณากรอกวันที่สิ้นสุดให้ทุน
                            </asp:RequiredFieldValidator>
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label required">ประเภททุน :</label>
                        <div class="col-md-6">
                            <asp:TextBox ID="tbtypefound" runat="server" CssClass="form-control input-lg" placeholder="ประเภททุน"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbtypefound" Display="Dynamic" CssClass="label label-danger">
                             กรุณากรอกประเภททุน
                            </asp:RequiredFieldValidator>
                        </div>

                    </div>


                    <hr />

                    <div class="form-group">
                        <label class="col-md-3 control-label required">แนบไฟล์ (ถ้ามี) :</label>
                        <div class="col-md-4">
                            <asp:FileUpload ID="FileUpload4" class="form-control input-lg" runat="server" />
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-md-3"></label>

                        <div class="col-md-4">
                            <asp:LinkButton ID="btnupload" runat="server" CssClass="btn btn-primary btn-lg" CausesValidation="false">
                                    <span class="glyphicon glyphicon-circle-arrow-down"></span> &nbsp;Upload File
                            </asp:LinkButton>
                        </div>
                        <hr />


                    </div>

                    <div class="table-responsive">
                        <asp:GridView ID="gvpic" DataKeyNames="ID_imgfound" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" AllowPaging="True" PageSize="20">
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
