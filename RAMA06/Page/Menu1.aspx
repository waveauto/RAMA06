<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="Menu1.aspx.vb" Inherits="RAMA06.Menu1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         <div id="Alert1" class="collapse">        
              <table class="nav-justified">
                    <tr>
                        <td>        
                            &nbsp;</td>
                        <td>        
                            <h2>แจ้งข้อมูลเพื่อการดำเนินการ</h2></td>
                        <td>        
                            &nbsp;</td>
                        <td>
                               <h2>กรุณาตอบกลับ</h2>         
                        </td>
                    </tr>
                    <tr>
                        <td>        
                            &nbsp;</td>
                        <td>        
               <div class="alert alert-dismissable alert-danger">
                   <h3>ID : 182</h3>
                   <h3>วันที่ : 17 เมษายน 2559 14:45:25</h3>
                   <h3>เรียน : ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</h3>
                   <h3>เรื่อง : แจ้งผลการพิจาณาทุน R2R เพื่อเพิ่มเติมแก้ไข</h3>
                   <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
                   <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
                   <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
                   <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
                   <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
                   <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
                   <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
                   <h3>ไฟล์แนบ</h3>           
                   <p><asp:HyperLink ID="HyperLink28" runat="server"> 1. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
                    <p><asp:HyperLink ID="HyperLink29" runat="server">2. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
                    <p><asp:HyperLink ID="HyperLink30" runat="server">3. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
                    <p><asp:HyperLink ID="HyperLink31" runat="server">4. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
                    <p><asp:HyperLink ID="HyperLink32" runat="server">5. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
                    <p><asp:HyperLink ID="HyperLink20" runat="server">6. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
                    <br />
                    <p>(ผู้แจ้ง : นางสาวสรีพร จักทองมี โทร. 2080 สนง.วิจัยฯ)</p>
               </div>
       

                        </td>
                        <td>        
                            -</td>
                        <td>
                             <div class="alert alert-dismissable alert-danger">
                               <p><asp:TextBox ID="TextBox1" runat="server" Height="290px" TextMode="MultiLine" Width="500px"></asp:TextBox></p>
                               <br />
                               <asp:FileUpload ID="FileUpload2" runat="server" />
                               <br />
                               <h3>ไฟล์แนบ</h3>           
                               <p><asp:HyperLink ID="HyperLink23" runat="server"> 1. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
                                <p><asp:HyperLink ID="HyperLink24" runat="server">2. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
                                <p><asp:HyperLink ID="HyperLink25" runat="server">3. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
                                <p><asp:HyperLink ID="HyperLink26" runat="server">4. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
                                <p><asp:HyperLink ID="HyperLink27" runat="server">5. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
                                <br />
                                <br /> 
                                <p class ="text-center ">          
                                <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="ยึนยันการส่งข้อมูล" />
                                 </p>
           </div>
                        </td>
                    </tr>
                    <tr>
                        <td>        
                            &nbsp;</td>
                        <td>        
                            &nbsp;</td>
                        <td>        
                            &nbsp;</td>
                        <td>
                             &nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>          
                            &nbsp;</td>
                    </tr>
                </table>
        </div>


    <div class="jumbotron">
     <div class="row">
            <div class="col-lg-6">
                <div class="list-group" id="G1" runat="server">
                    <a href="#" class="list-group-item active">การสนับสนุน & บริการ โครงการวิจัย</a>
                    <a href="RecordAll.aspx" id="M1" runat="server" class="list-group-item"><span class="badge">19</span> 1. โครงการวิจัย</a>
                    <a href="RecordAll02.aspx" id="M2" runat="server" class="list-group-item"><span class="badge">12</span>2. การขอเงินทุนสนับสนุนค่าตีพิมพ์ </a>
                    <a href="RecordAll03.aspx" id="M3" runat="server" class="list-group-item"><span class="badge">14</span>3. การขอรับเงินรางวัล</a>
                    <a href="RecordAll04.aspx" id="M4" runat="server" class="list-group-item"><span class="badge">10</span>4. การขอเงินทุนเพื่อการเดินทางและนำเสนอผลงาน</a>
                    <a href="RecordAll05.aspx" id="M5" runat="server" class="list-group-item"><span class="badge">13</span>5. ขอแจ้งจดทรัพย์สินทางปัญญา (จดลิขสิทธิ์/สิทธิบัตร/อนุสิทธิบัตร)</a>
                    <a href="#" id="A1" runat="server" class="list-group-item"><span class="badge">13</span>6. งานบริการอื่นๆ....(ดำเนินการใน Phase ต่อไป)</a>
                </div>
            </div>
             <div class="col-lg-6">
                <div class="list-group" id="G2" runat="server">
                    <a href="#" class="list-group-item active">ติดตาม</a>
                    <a href="StepChart.aspx" id="A3" runat="server" class="list-group-item">1. โครงการวิจัย</a>
                    <a href="#" id="A2" runat="server" class="list-group-item">2. การขอเงินทุนสนับสนุนค่าตีพิมพ์ </a>
                    <a href="#" id="A4" runat="server" class="list-group-item">3. การขอรับเงินรางวัล</a>
                    <a href="#" id="A5" runat="server" class="list-group-item">4. การขอเงินทุนเพื่อการเดินทางและนำเสนอผลงาน</a>
                    <a href="#" id="A15" runat="server" class="list-group-item">5. ขอแจ้งจดทรัพย์สินทางปัญญา (จดลิขสิทธิ์/สิทธิบัตร/อนุสิทธิบัตร)</a>
                    <a href="#" id="A16" runat="server" class="list-group-item">6. งานบริการอื่นๆ....(ดำเนินการใน Phase ต่อไป)</a> 
                </div>
            </div>
     </div>

     <div class="row">
            <div class="col-lg-6">
                <div class="list-group" id="G3" runat="server">
                    <a href="#" class="list-group-item active">กรรมการพิจารณาจริยธรรม (EC)</a>
                    <a href="~/Page/RecordAll.aspx" id="M10" runat="server" class="list-group-item"> <span class="badge">4</span> ข้อมูลเพื่อพิจารณาจริยธรรม (EC)</a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="list-group" id="G4" runat="server">
                    <a href="#" class="list-group-item active">กรรมการพิจารณาทุน รัฐ/ทุนเอกชน</a>
                    <a href="~/Page/RecordAll.aspx" id="A27" runat="server" class="list-group-item"> <span class="badge">7</span> ข้อมูลเพื่อพิจารณาทุน รัฐ/ทุนเอกชน</a>
                </div>
            </div>
    </div>

     <div class="row">
            <div class="col-lg-6">
                <div class="list-group" id="Div1" runat="server">
                    <a href="#" class="list-group-item active">ข้อมูลหลัก</a>
                    <a href="~/npage/Editperson.aspx" id="A39" runat="server" class="list-group-item">ข้อมูลส่วนตัว</a>                    
                    <a href="~/npage/Aabout.aspx" id="A17" runat="server" class="list-group-item">เกี่ยวกับระบบ</a>
                     <a href="~/npage/Aman.aspx" id="A26" runat="server" class="list-group-item">คู่มือการใช้</a>
                    <a href="~/npage/AContact.aspx" id="A18" runat="server" class="list-group-item">ติดต่อเรา</a>
                    <a href="~/npage/AhowtoProblem.aspx" id="A20" runat="server" class="list-group-item">ปัญหาและข้อเสนอแนะ</a>
                    <a href="~/npage/Anew.aspx" id="A21" runat="server" class="list-group-item">ประกาศข่าวประชาสัมพันธ์ทั่วไป</a>
                    <a href="~/npage/Agov.aspx" id="A19" runat="server" class="list-group-item">ประกาศข่าวทุนรัฐบาล</a>
                    <a href="~/npage/Apriv.aspx" id="A23" runat="server" class="list-group-item">ประกาศข่าวทุนเอกชน</a>
                    <a href="~/npage/Avideo.aspx" id="A28" runat="server" class="list-group-item">วิดีโอสอนการใช้งานระบบ</a>
                    <a href="~/npage/ADownload.aspx" id="A14" runat="server" class="list-group-item">ไฟล์ดาวน์โหลด</a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="list-group" id="Div2" runat="server">
                    <a href="#" class="list-group-item active">สำหรับ IT</a>
                    <a href="~/npage/Asecu.aspx" id="A22" runat="server" class="list-group-item">กำหนดสิทธิ์การเข้าใช้งานระบบ</a>
                    <a href="~/npage/Apss.aspx" id="A29" runat="server" class="list-group-item">สร้างรหัสผ่านกรอกข้อมูลบุคคลภายใน</a>
                    <a href="~/npage/Arit.aspx" id="A30" runat="server" class="list-group-item">กรอกข้อมูลบุคคลภายใน (โดย เจ้าหน้าที่ IT)</a>

                    
                </div>
            </div>
    </div>

     <div class="row">
            <div class="col-lg-6">
                <div class="list-group" id="Div3" runat="server">
                    <a href="#" class="list-group-item active">รายงาน ประเภทกราฟ แสดงผลการดำเนินงานด้านนต่างๆ </a>
                    <a href="~/Page/GraphReportAll.aspx" id="A6" runat="server" class="list-group-item">รายงานสถิติ การลงทะเบียนการใช้งานระบบ</a>
                    <a href="#" id="A10" runat="server" class="list-group-item">รายงานสถิติ การส่งโครงการวิจัย</a>
                    <a href="#" id="A7" runat="server" class="list-group-item">รายงานสถิติ การขอรับเงินรางวัล</a>
                    <a href="#" id="A8" runat="server" class="list-group-item">รายงานสถิติ การขอเงินทุนเพื่อการเดินทางและนำเสนอผลงาน</a>
                    <a href="#" id="A9" runat="server" class="list-group-item">รายงานสถิติ ขอแจ้งจดทรัพย์สินทางปัญญา (จดลิขสิทธิ์/สิทธิบัตร/อนุสิทธิบัตร)</a>
                    <a href="#" id="A11" runat="server" class="list-group-item">รายงานการเปรียบเทียบ ประสิทธิภาพด้านเวลาในการดำเนินงาน การขอรับเงินรางวัล</a>
                    <a href="#" id="A12" runat="server" class="list-group-item">รายงานการเปรียบเทียบ ประสิทธิภาพด้านเวลาในการดำเนินงาน การขอเงินทุนสนับสนุนค่าตีพิมพ์</a>
                    <a href="#" id="A24" runat="server" class="list-group-item">รายงานการเปรียบเทียบ ประสิทธิภาพด้านเวลาในการดำเนินงาน การขอเงินทุนเพื่อการเดินทางและนำเสนอผลงาน</a>
                    <a href="#" id="A25" runat="server" class="list-group-item">รายงานการเปรียบเทียบ ประสิทธิภาพด้านเวลาในการดำเนินงาน ขอแจ้งจดทรัพย์สินทางปัญญา (จดลิขสิทธิ์/สิทธิบัตร/อนุสิทธิบัตร)</a>
           </div>
            </div>
            <div class="col-lg-6">
                <div class="list-group" id="Div4" runat="server">
                    <a href="#" class="list-group-item active">รายงาน ผลการดำเนินงาน ตามข้อตกลงการปฏิบัติงานของส่วนงาน (KPI)</a>
                    <a href="~/Page/KPIsReport" id="A13" runat="server" class="list-group-item">รายงาน KPI ตามยุทธศาสาตร์ 1 Research and Academic Excellence</a>                    
                </div>
            </div>
    </div>
    
</div>
</asp:Content>
