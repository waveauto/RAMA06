<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Apm.aspx.vb" Inherits="RAMA06.Apm" %>

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
                            <h4>แบบประเมินผลการเข้าร่วมโครงการแลกเปลี่ยนนักศึกษาฯ</h4>
                        </div>
                        <hr />
                        <p>คำชี้แจง แบบประเมินนี้สำหรับนักศึกษาที่เข้าร่วมโครงการแลกเปลี่ยน โดยขอให้นักศึกษาให้ข้อมูลและความคิดเห็นเพื่อเป็นประโยชน์ต่อการนำไปปรับปรุงการดำเนินงานให้มีประสิทธิภาพมากขึ้น</p>
                        <p></p>
                        <p></p>
                        
                        <label>1. ข้อมูลพื้นฐาน</label>
                        <div class="form-group">
                            <div class="col-sm-1"></div>
                                <%--<p>1.1 	สถาบันการศึกษาที่ไปฝึกอบรม</p>--%>
                                <label>1.1 	สถาบันการศึกษาที่ไปฝึกอบรม</label>
                            <div class="row">
                                <label for="<%=tbnationnal.ClientID%>" class="col-xs-6 col-md-3 control-label">ประเทศ :</label>
                                <div class="col-xs-6 col-md-3">
                                    <asp:TextBox ID="tbnationnal" CssClass="form-control" placeholder="ประเทศ" runat="server"></asp:TextBox>
                                </div>
                                <label for="<%=tbinstitution.ClientID%>" class="col-xs-2 col-sm-1 control-label">สถาบัน :</label>
                                <div class="col-xs-4 col-md-3">
                                    <asp:TextBox ID="tbinstitution" CssClass="form-control" placeholder="สถาบัน" runat="server"></asp:TextBox>
                                </div>

                            </div>

                        </div>

                        <div class="form-group">
                            <div class="col-sm-1"></div>
                            <label>1.2 สาขาวิชาที่ไปฝึกอบรม</label>
                            <div class="row">
                                 <label for="<%=tbnationnal.ClientID%>" class="col-xs-6 col-md-3 control-label"></label>
                                <div class="col-xs-6 col-md-8">
                                    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="สาขาวิชาที่ไปฝึกอบรม" runat="server"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <hr />
                        <label>2. ความคิดเห็นต่อการเข้าร่วมโครงการแลกเปลี่ยนนักศึกษาฯ</label>
                        
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th style="width: 40%">รายละเอียด</th>
                                    <th style="width: 6%">มากที่สุด</th>
                                    <th style="width: 3%">มาก</th>
                                    <th style="width: 5%">ปานกลาง</th>
                                    <th style="width: 3%">น้อย</th>
                                    <th style="width: 6%">น้อยที่สุด</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>
                                        <p>1. ช่วงเวลาไปฝึกอบรมเหมาะสม </p>
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
                                        <p>2. ความรู้ที่ได้รับจากการไปฝึกอบรม </p>
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
                                        <p>3. การบริหารจัดการ/การดำเนินงานของงานวิเทศสัมพันธ์ </p>
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
                                        <p>4. โอกาสการพัฒนาทักษะภาษาต่างประเทศ </p>
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
                                        <p>5. ความพึงพอใจต่อการเข้าร่วมโครงการแลกเปลี่ยนนักศึกษาฯ </p>
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

                            </tbody>

                        </table>

                        <hr />
                        <label>3. ความคิดเห็นหรือข้อเสนอแนะอื่นๆ </label>

                        <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="ความคิดเห็นหรือข้อเสนอแนะอื่นๆ" runat="server" TextMode="MultiLine"></asp:TextBox>

                        <hr />

                       <div class="text-center">
                           <p>ขอขอบคุณสำหรับทุกความเห็น</p>
                           <p>งานวิเทศสัมพันธ์ สำนักงานคณบดี</p>
                           <p>คณะแพทยศาสตร์โรงพยาบาลรามาธิบดี มหาวิทยาลัยมหิดล</p>
                       </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
