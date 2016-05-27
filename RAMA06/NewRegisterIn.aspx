<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="NewRegisterIn.aspx.vb" Inherits="RAMA06.NewResiterIn" %>
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
    <br />
    <div class="container">
        <h2 class="text-center">ลงทะเบียน นักวิจัยภายใน</h2>
        <div class="panel panel-primary">
            <br />
            <div class="messagealert" id="alert_container">
            </div>
            <div class="container">

                <div class="form-horizontal">

                    <div class="form-group">
                        <label class="control-label col-md-4" for="inputLarge">
                            รหัสบุคคล :</label>
                        <div class="col-md-2">


                            <asp:TextBox ID="tbcodestaff" runat="server" class="form-control input-lg"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-4" for="inputLarge">
                            ตำแหน่งทางวิชาการ (ถ้ามี) : เช่น ผศ. รศ. ศ. ฯลฯ :</label>
                        <div class="col-md-3 col-sm-3">
                            <asp:TextBox ID="tbposition" runat="server" placeholder="ตำแหน่งทางวิชาการ" class="form-control input-lg"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbposition" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอกตำแหน่งทางวิชาการ
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-4" for="inputLarge">
                            ยศ (ถ้ามี) :</label>
                        <div class="col-md-3 col-sm-3">


                            <asp:TextBox ID="tbrank" runat="server" placeholder="ยศ" class="form-control input-lg"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbrank" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอกยศ
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-4" for="inputLarge">
                            วุฒิการศึกษาระดับปริญญาดุษฎีบัณฑิต: เช่น ดร. :</label>
                        <div class="col-md-3">


                            <asp:TextBox ID="tbeducation" runat="server" placeholder="วุฒิการศึกษาระดับปริญญาดุษฎีบัณฑิต" class="form-control input-lg"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatortbeducation" runat="server" ControlToValidate="tbeducation" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอกวุฒิการศึกษาระดับปริญญาดุษฎีบัณฑิต
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-4" for="inputLarge">
                            ตำแหน่งวิชาชีพ (ถ้ามี) : เช่น นพ. พญ.&nbsp; ฯลฯ</label>
                        <div class="col-md-2">


                            <asp:TextBox ID="tbprofession" runat="server" placeholder="ตำแหน่งวิชาชีพ" class="form-control input-lg"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tbprofession" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอกตำแหน่งวิชาชีพ
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-4" for="inputLarge">
                            ฐานันดรศักดิ์ หรือ คำนำหน้าสตรี (ถ้ามี) :</label>
                        <div class="col-md-2">


                            <asp:TextBox ID="tbdignity" runat="server" placeholder="ฐานันดรศักดิ์" class="form-control input-lg"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbdignity" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอกฐานันดรศักดิ์ หรือ คำนำหน้าสตรี
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-4" for="inputLarge">
                            คำนำหน้า:
                        </label>
                        <div class="col-md-2">

                            <asp:DropDownList ID="ddlfname" class="form-control input-lg" runat="server">
                                <asp:ListItem>นาย</asp:ListItem>
                                <asp:ListItem>นางสาว</asp:ListItem>
                                <asp:ListItem>นาง</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div>


                    <div class="form-group">
                        <label class="control-label col-md-4" for="inputLarge">
                            ชื่อ-สกุล :</label>
                        <div class="col-md-4">


                            <asp:TextBox ID="tbname" runat="server" placeholder="ชื่อ-สกุล" class="form-control input-lg"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbname" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอกชื่อ-สกุล
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="control-label col-md-4" for="inputLarge">
                            อัพโหลดรูปถ่าย :</label>
                        <div class="col-md-4">

                            <asp:FileUpload ID="FileUpload1" class="form-control input-lg" runat="server" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-4" for="inputLarge">
                            เบอร์โทรหน่วยงาน :</label>
                        <div class="col-md-4">


                            <asp:TextBox ID="tbtel" runat="server" placeholder="เบอร์โทรหน่วยงาน" class="form-control input-lg"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="tbtel" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอกเบอร์โทรหน่วยงาน
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-4" for="inputLarge">
                            เบอร์โทรมือถือ :</label>
                        <div class="col-md-4">


                            <asp:TextBox ID="tbmobile" runat="server" placeholder="เบอร์โทรมือถือ" class="form-control input-lg"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbmobile" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอกเบอร์โทรมือถือ
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-4" for="inputLarge">
                            E-mail :</label>
                        <div class="col-md-4">


                            <asp:TextBox ID="tbemail" runat="server" placeholder="E-mail" class="form-control input-lg"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbemail" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอกE-mail
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1"
                                ControlToValidate="tbemail"
                                Text="(Emailไม่ถูกต้อง)"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                CssClass="label label-danger"
                                SetFocusOnError="true" Display="Dynamic"
                                runat="server" />
                        </div>
                    </div>


                </div>


            </div>

        </div>
        <div class="text-center">
            <asp:LinkButton ID="btnsave" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp;ยืนยันการลงทะเบียน
            </asp:LinkButton>
        </div>

        <hr />
    </div>
</asp:Content>
