<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Apmm.aspx.vb" Inherits="RAMA06.Apmm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <p></p>
            <div class="panel panel-primary">
                <div class="panel panel-body">
                    <div class="form-horizontal">
                        <div class="text-center">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/logo_150.png" />
                            <h4>แบบประเมินนักศึกษาแพทย์เข้าร่วมโครงการแลกเปลี่ยน คณะแพทยศาสตร์โรงพยาบาลรามาธิบดี
                            </h4>
                            <h4>กับสถาบันการศึกษาในต่างประเทศที่มีบันทึกข้อตกลงความร่วมมือ ประจำปี 2559</h4>
                        </div>
                        <hr />

                       
                        <div class="row">
                            <label for="<%=tbnationnal.ClientID%>" class="col-xs-6 col-md-3 control-label">ชื่อ – นามสกุล นักศึกษาผู้ถูกประเมิน :</label>
                            <div class="col-xs-5 col-md-4">
                                <asp:TextBox ID="tbnationnal" CssClass="form-control" placeholder="ชื่อ – นามสกุล นักศึกษาผู้ถูกประเมิน" runat="server"></asp:TextBox>
                            </div>
                            <label for="<%=tbinstitution.ClientID%>" class="col-sm-2 control-label">รหัสนักศึกษา :</label>
                            <div class="col-xs-4 col-md-2">
                                <asp:TextBox ID="tbinstitution" CssClass="form-control" placeholder="รหัสนักศึกษา" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <p></p>
                        <div class="row">
                            <label for="<%=tbrank.ClientID%>" class="col-xs-6 col-md-3 control-label">ชั้นปี :</label>
                            <div class="col-xs-5 col-md-2">
                                <asp:TextBox ID="tbrank" CssClass="form-control" placeholder="ชั้นปี" runat="server"></asp:TextBox>
                            </div>
                            <label for="<%=tbreciept.ClientID%>" class="col-sm-2 control-label">สมัครรับทุน :</label>
                            <div class="col-xs-4 col-md-4">
                                <asp:TextBox ID="tbreciept" CssClass="form-control" placeholder="สมัครรับทุน" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <p></p>
                        <div class="row">
                            <label for="<%=tbnum.ClientID%>" class="col-xs-6 col-md-3 control-label">รับจำนวน :</label>
                            <div class="col-xs-5 col-md-2">
                                <asp:TextBox ID="tbnum" CssClass="form-control" placeholder="รับจำนวน" runat="server"></asp:TextBox>
                            </div>
                            <label for="<%=tbnumhuman.ClientID%>" class="col-sm-2 control-label">จำนวนผู้สมัคร :</label>
                            <div class="col-xs-4 col-md-2">
                                <asp:TextBox ID="tbnumhuman" CssClass="form-control" placeholder="จำนวนผู้สมัคร" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <p></p>
                        <div class="row">
                            <label for="<%=tbnamesend.ClientID%>" class="col-xs-6 col-md-3 control-label">ชื่อ – นามสกุล ผู้ประเมิน :</label>
                            <div class="col-xs-5 col-md-4">
                                <asp:TextBox ID="tbnamesend" CssClass="form-control" placeholder="ชื่อ – นามสกุล ผู้ประเมิน" runat="server"></asp:TextBox>
                            </div>
                            <label for="<%=tbdept.ClientID%>" class="col-sm-2 control-label">ภาควิชา :</label>
                            <div class="col-xs-4 col-md-2">
                                <asp:TextBox ID="tbdept" CssClass="form-control" placeholder="ภาควิชา" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <br />
                        <hr />
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th style="width: 40%">
                                        <p>รายละเอียด</p>
                                       
                                    </th>
                                    <th style="width: 6%"><p>น้อยมาก</p><p>(1)</p></th>
                                    <th style="width: 3%"><p>น้อย</p><p>(2)</p></th>
                                    <th style="width: 5%"><p>ปานกลาง</p><p>(3)</p></th>
                                    <th style="width: 3%"><p>มาก</p><p>(4)</p></th>
                                    <th style="width: 6%"><p>มากที่สุด</p><p>(5)</p></th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>
                                        <p>1. ความรู้ทางด้านวิชาการแพทย์ </p>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox5" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox4" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox3" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox2" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                        </div>
                                    </td>

                                </tr>


                                <tr>
                                    <td>
                                        <p>2.ความสามารถในการเรียนรู้และประยุกต์วิชาการ </p>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox6" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox7" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox8" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox9" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox10" runat="server" />
                                        </div>
                                    </td>

                                </tr>

                                <tr>
                                    <td>
                                        <p>3.ทักษะการสื่อสาร การพูด การเขียน และนำเสนองาน </p>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox11" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox12" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox13" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox14" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox15" runat="server" />
                                        </div>
                                    </td>

                                </tr>

                                <tr>
                                    <td>
                                        <p>4. การแก้ไขปัญหาเฉพาะหน้า  </p>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox16" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox17" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox18" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox19" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox20" runat="server" />
                                        </div>
                                    </td>

                                </tr>

                                <tr>
                                    <td>
                                        <p>5. ความสามารถในการใช้ภาษาอังกฤษ </p>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox21" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox22" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox23" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox24" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox25" runat="server" />
                                        </div>
                                    </td>

                                </tr>





                                <tr>
                                    <td>
                                        <p>6.การมีส่วนร่วมกับกิจกรรมเพื่อส่วนรวม </p>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox26" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox27" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox28" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox29" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox30" runat="server" />
                                        </div>
                                    </td>

                                </tr>


                                <tr>
                                    <td>
                                        <p>7.บุคลิกภาพและการวางตัว ทัศนคติ วุฒิภาวะ </p>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox31" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox32" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox33" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox34" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox35" runat="server" />
                                        </div>
                                    </td>

                                </tr>

                                <tr>
                                    <td>
                                        <p>8.มนุษยสัมพันธ์ </p>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox36" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox37" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox38" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox39" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox40" runat="server" />
                                        </div>
                                    </td>

                                </tr>

                                <tr>
                                    <td>
                                        <p>9.ความมีระเบียบวินัย ตรงต่อเวลา </p>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox41" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox42" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox43" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox44" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox45" runat="server" />
                                        </div>
                                    </td>

                                </tr>

                                <tr>
                                    <td>
                                        <p>10.คุณธรรมและจริยธรรม </p>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox46" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox47" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox48" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox49" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox50" runat="server" />
                                        </div>
                                    </td>

                                </tr>

                                <tr>
                                    <td>
                                        <p>11.นักศึกษาแพทย์สมควรได้รับทุน </p>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox51" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox52" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox53" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox54" runat="server" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <asp:CheckBox ID="CheckBox55" runat="server" />
                                        </div>
                                    </td>

                                </tr>

                                <tr>
                                    <td>
                                        <div class="text-center">
                                            <p>คะแนนรวม</p>
                                        </div>
                                    </td>
                                    
                                    <td>
                                        
                                    </td>

                                    <td>
                                        
                                    </td>

                                    <td>
                                        
                                    </td>

                                    <td>
                                        
                                    </td>

                                    <td>
                                        
                                    </td>

                                </tr>

                            </tbody>

                        </table>

                        <hr />
                        <label>จุดเด่นของนักศึกษา </label>

                        <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="จุดเด่นของนักศึกษา" runat="server" TextMode="MultiLine"></asp:TextBox>

                        <hr />
                        <br />
                        <br />
                        <br />
                        <div class="row">
                            <label for="<%=tbnamesend.ClientID%>" class="col-md-8 control-label">ลงชื่อผู้ประเมิน :</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="ลงชื่อผู้ประเมิน" runat="server"></asp:TextBox>
                            </div>
                           
                        </div>
                        <p></p>
                        <div class="row">
                            <label for="<%=tbnamesend.ClientID%>" class="col-md-8 control-label">วันที่ :</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="TextBox3" CssClass="form-control" placeholder="วันที่" runat="server"></asp:TextBox>
                            </div>
                           
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
