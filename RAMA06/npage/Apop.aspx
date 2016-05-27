<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Apop.aspx.vb" Inherits="RAMA06.Apop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <br />
            <div class="panel panel-primary">
                <div class="panel-body">
                    <div class="form-horizontal">

                        <div class="row">


                            <div class="col-md-8">
                                <div class="form-group">
                                    <label class="control-label col-md-6" for="inputLarge">
                                        รหัสบุคคล :</label>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="tbcodestaff" runat="server" class="form-control input-lg" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>

                                <br />
                                <div class="form-group">
                                    <label class="control-label col-md-6" for="inputLarge">
                                        ตำแหน่งทางวิชาการ (ถ้ามี) : เช่น ผศ. รศ. ศ. ฯลฯ :</label>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="tbposition" runat="server" placeholder="ตำแหน่งทางวิชาการ" class="form-control input-lg" ReadOnly="true"></asp:TextBox>

                                    </div>

                                </div>



                            </div>
                            <div class="col-md-4">
                                <asp:Image ID="Image1" Height="170px" Width="150px" class="img-thumbnail" runat="server" />
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="control-label col-md-4" for="inputLarge">
                                ยศ (ถ้ามี) :</label>
                            <div class="col-md-3 col-sm-3">


                                <asp:TextBox ID="tbrank" runat="server" placeholder="ยศ" class="form-control input-lg" ReadOnly="true"></asp:TextBox>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="inputLarge">
                                วุฒิการศึกษาระดับปริญญาดุษฎีบัณฑิต: เช่น ดร. :</label>
                            <div class="col-md-3">


                                <asp:TextBox ID="tbeducation" runat="server" placeholder="วุฒิการศึกษาระดับปริญญาดุษฎีบัณฑิต" class="form-control input-lg" ReadOnly="true"></asp:TextBox>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="inputLarge">
                                ตำแหน่งวิชาชีพ (ถ้ามี) : เช่น นพ. พญ.&nbsp; ฯลฯ</label>
                            <div class="col-md-2">


                                <asp:TextBox ID="tbprofession" runat="server" placeholder="ตำแหน่งวิชาชีพ" class="form-control input-lg" ReadOnly="true"></asp:TextBox>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="inputLarge">
                                ฐานันดรศักดิ์ หรือ คำนำหน้าสตรี (ถ้ามี) :</label>
                            <div class="col-md-2">


                                <asp:TextBox ID="tbdignity" runat="server" placeholder="ฐานันดรศักดิ์" class="form-control input-lg" ReadOnly="true"></asp:TextBox>

                            </div>
                        </div>


                        <div class="form-group">
                            <label class="control-label col-md-4" for="inputLarge">
                                คำนำหน้า :</label>
                            <div class="col-md-2">


                                <asp:TextBox ID="tbfname" runat="server" placeholder="คำนำหน้า" class="form-control input-lg" ReadOnly="true"></asp:TextBox>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="inputLarge">
                                ชื่อ-สกุล :</label>
                            <div class="col-md-4">


                                <asp:TextBox ID="tbname" runat="server" placeholder="ชื่อ-สกุล" class="form-control input-lg" ReadOnly="true"></asp:TextBox>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="inputLarge">
                                เบอร์โทรหน่วยงาน :</label>
                            <div class="col-md-4">


                                <asp:TextBox ID="tbtel" runat="server" placeholder="เบอร์โทรหน่วยงาน" class="form-control input-lg" ReadOnly="true"></asp:TextBox>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="inputLarge">
                                เบอร์โทรมือถือ :</label>
                            <div class="col-md-4">


                                <asp:TextBox ID="tbmobile" runat="server" placeholder="เบอร์โทรมือถือ" class="form-control input-lg" ReadOnly="true"></asp:TextBox>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="inputLarge">
                                E-mail :</label>
                            <div class="col-md-4">


                                <asp:TextBox ID="tbemail" runat="server" placeholder="E-mail" class="form-control input-lg" ReadOnly="true"></asp:TextBox>

                            </div>
                        </div>


                    </div>

                </div>

            </div>


        </div>
    </form>
</body>
</html>
