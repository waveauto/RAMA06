<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="RecordAll.aspx.vb" Inherits="RAMA06.RecordAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 76px;
        }
        .auto-style2 {
            width: 76px;
            height: 86px;
        }
    </style>
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
                                <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="ยึนยันการส่งข้อมูล" />
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

<br />
<h1 class="text-center">ข้อมูลโครงการวิจัย</h1>
<br/>
<div class="text-left">  <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-info btn-lg" NavigateUrl="~/Page/InputProposal.aspx" Width="200px"><span class="glyphicon glyphicon-edit"></span>ส่งโครงการวิจัย</asp:HyperLink>
    <asp:HyperLink ID="HyperLink2" runat="server" class="btn btn-info btn-lg" data-toggle="collapse" data-target="#demo" Width="150px">ค้นหาข้อมูล</asp:HyperLink>
    <asp:HyperLink ID="HyperLink3" runat="server" class="btn btn-info btn-lg" Width="150px">Export to Excel</asp:HyperLink>
 </div>
<div id="demo" class="collapse">        
      <table class="nav-justified">
            <tr>
                <td class="auto-style3">        
                    <h2>ค้นหาข้อมูล</h2></td>
                <td>        
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">        
       <div class="alert alert-dismissable alert-success">
            <div>วันที่เริ่มต้น :<input class="form-control" placeholder="วันที่เริ่มต้น" type="text" /></div>
            <div>วันที่สิ้นสุด :<input class="form-control" placeholder="วันที่สิ้นสุด" type="text" /></div>
            <div>รหัสโครงการวิจัย :<input class="form-control" placeholder="รหัสโครงการวิจัย" type="text" /></div>
            <div>ชื่อโครงการ (Thai) : <input class="form-control" placeholder="ชื่อโครงการ (Thai)" type="text" /></div>
            <div>ชื่อโครงการ (Eng) : <input class="form-control" placeholder="ชื่อโครงการ (Eng)" type="text" /></div>
            <div>รหัสผู้วิจัย : <input class="form-control" placeholder="รหัสผู้วิจัย" type="text" /></div>
            <div>ชื่อ-สกุลผู้วิจัย : <input class="form-control" placeholder="ชื่อ-สกุลผู้วิจัย" type="text" /></div>
            <div>รหัสผู้ร่วมวิจัย : <input class="form-control" placeholder="รหัสผู้ร่วมวิจัย" type="text" /></div>
            <div>ชื่อ-สกุลผู้ร่วมวิจัย : <input class="form-control" placeholder="ชื่อ-สกุลผู้ร่วมวิจัย" type="text" /></div>
           <div>สถานะการดำเนินงาน : 
               <asp:DropDownList ID="DropDownList10" class="form-control" runat="server">
                   <asp:ListItem></asp:ListItem>
                   <asp:ListItem>รับเริ่องโครงการจัย</asp:ListItem>
                   <asp:ListItem>ส่งเรื่องกลับ</asp:ListItem>
                   <asp:ListItem>อนุมัติโครางการ</asp:ListItem>
                   <asp:ListItem>รายงานความก้าวหน้า</asp:ListItem>
                   <asp:ListItem>ส่งเอกสารฉบับสมบูรณ์</asp:ListItem>
                   <asp:ListItem>เสร็จสิ้น</asp:ListItem>
               </asp:DropDownList>
            </div>
           <hr />
                               <div class="panel panel-default">
                     <div class="panel-heading"><h4>กำหนด คุณสมบัติเฉพาะ ผลงานวิจัยที่ได้รับการจดทะเบียน</h4></div>
                      <div class="panel-body">       
                           <div class="row">
                                 <div class="col-md-4"> <span class="glyphicon glyphicon-flag"></span> สิทธิบัตร : <asp:CheckBox ID="CheckBox9" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> อนุสิทธิบัตร : <asp:CheckBox ID="CheckBox10" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ความลับทางการค้า : <asp:CheckBox ID="CheckBox11" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เครื่องหมายการค้า : <asp:CheckBox ID="CheckBox12" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> สิ่งบ่งชี้ทางภูมิศาสตร์ : <asp:CheckBox ID="CheckBox13" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> แผงผังระบบวงจรรวม : <asp:CheckBox ID="CheckBox14" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> คุ้มครองพันธุ์พืช : <asp:CheckBox ID="CheckBox23" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ภูมิปัญญาท้องถิ่น : <asp:CheckBox ID="CheckBox24" runat="server" /></div>
                           </div>
  
                      </div>
                   </div>  
                    <br />
                    <div class="panel panel-default">
                     <div class="panel-heading"><h4>กำหนด คุณสมบัติเฉพาะ ผลงานวิจัยที่อยู่ระหว่างดำเนินการยืนขอจดทะเบียน</h4></div>
                      <div class="panel-body">       
                           <div class="row">
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> สิทธิบัตร : <asp:CheckBox ID="CheckBox25" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> อนุสิทธิบัตร : <asp:CheckBox ID="CheckBox26" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ความลับทางการค้า : <asp:CheckBox ID="CheckBox27" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เครื่องหมายการค้า : <asp:CheckBox ID="CheckBox28" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> สิ่งบ่งชี้ทางภูมิศาสตร์ : <asp:CheckBox ID="CheckBox51" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> แผงผังระบบวงจรรวม : <asp:CheckBox ID="CheckBox52" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> คุ้มครองพันธุ์พืช : <asp:CheckBox ID="CheckBox53" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ภูมิปัญญาท้องถิ่น : <asp:CheckBox ID="CheckBox54" runat="server" /></div>
                           </div>
  
                      </div>
                   </div>
                    <br />
                    <div class="panel panel-default">
                    <div class="panel-heading"><h4>กำหนด คุณสมบัติเฉพาะอื่นๆ</h4></div>
                      <div class="panel-body">       
                           <div class="row">
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ตีพิมพ์ในวารสารวิชาการระดับนานาชาติ ที่เป็นที่ยอมรับต่อจำนวนบุคลากรสายวิชาการในการแต่ละปีปฏิทิน : <asp:CheckBox ID="CheckBox55" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ตีพิมพ์ในวารสารวิชาการระดับนานาชาติ : <asp:CheckBox ID="CheckBox56" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นดัชนีการอ้างอิงต่อบทความวิจัยในแต่ละปีปฏิทิน : <asp:CheckBox ID="CheckBox58" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นดัชนีการอ้างอิง : <asp:CheckBox ID="CheckBox59" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> สิ่งบ่งชี้ทางภูมิศาสตร์ : <asp:CheckBox ID="CheckBox60" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> แผงผังระบบวงจรรวม : <asp:CheckBox ID="CheckBox61" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> คุ้มครองพันธุ์พืช : <asp:CheckBox ID="CheckBox62" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ภูมิปัญญาท้องถิ่น : <asp:CheckBox ID="CheckBox63" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นโครงการวิจัยที่มีการถ่ายทอดเทคโนโลยีหรือองค์ความรู้ต่อภาครัฐ : <asp:CheckBox ID="CheckBox64" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นโครงการวิจัยที่มีการถ่ายทอดเทคโนโลยีหรือองค์ความรู้ต่อภาคเอกชน : <asp:CheckBox ID="CheckBox65" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นโครงการวิจัย/ผลงานวิจัย/ผลงานทางวิชาการที่ทำให้มหาวิทยาลัยมหิดลมีรายได้ : <asp:CheckBox ID="CheckBox66" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นผลงานวิจัยใหม่ที่นำไปสู่การปรับนโยบายการบริหารระดับส่วนงานกระทรวงหรือระดับประเทศและที่มีผลกระทบต่อสังคม : <asp:CheckBox ID="CheckBox67" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นดัชนีการอ้างอิง : <asp:CheckBox ID="CheckBox68" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> แสดงถึงประโยชน์จากผลกระทบของงานวิจัยต่อสังคมไทย/สังคม โลก (ในช่วง 5 ปีที่ผ่านมา) : <asp:CheckBox ID="CheckBox69" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นค่า h-index ของส่วนงาน : <asp:CheckBox ID="CheckBox70" runat="server" /></div>
                           </div>
  
                      </div>
                   </div> 
                   <br />
                    <div class="panel panel-default">
                     <div class="panel-heading"><h4>กำหนดคุณสมบัติเฉพาะ ทุน</h4></div>
                      <div class="panel-body">       
                           <div class="row">
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นเงินทุนวิจัยจากภายในมหาวิทยาลัย : <asp:CheckBox ID="CheckBox71" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เงินรายได้ส่วนงานที่เป็นทุนวิจัย : <asp:CheckBox ID="CheckBox72" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นเงินทุนวิจัยที่ได้รับจากหน่วยงานภาครัฐภายในประเทศ : <asp:CheckBox ID="CheckBox73" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นเงินทุนวิจัยที่ได้รับจากหน่วยงานภาครัฐต่างประเทศ : <asp:CheckBox ID="CheckBox74" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นเงินทุนวิจัยที่ได้รับจากภาคเอกชนภายในประเทศ : <asp:CheckBox ID="CheckBox75" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นเงินทุนวิจัยที่ได้รับจากภาคเอกชนต่างประเทศ : <asp:CheckBox ID="CheckBox76" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> คุ้มครองพันธุ์พืช : <asp:CheckBox ID="CheckBox77" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ภูมิปัญญาท้องถิ่น : <asp:CheckBox ID="CheckBox78" runat="server" /></div>
                                 
                           </div>
  
                      </div>
                   </div>   
                    <br />
                    <div class="panel panel-default">
                     <div class="panel-heading"><h4>กำหนดคุณสมบัติเฉพาะ ประเภทการตีพิมพ์</h4></div>
                      <div class="panel-body">       
                           <div class="row">
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> บทความตีพิมพ์ในวารสารวิชาการระดับนานาชาติ : <asp:DropDownList ID="DropDownList9" class="form-control" runat="server"  placeholder="ชื่อวารสาร"> </asp:DropDownList></div>
                                
                           </div>
  
                      </div>
                   </div>      


           <hr />
           <br />
           <asp:Button ID="Button2" class="btn btn-primary btn-lg" runat="server" Text="ค้นหาข้อมูล" />
       </div>
       </td>
                <td>        
                    -</td>
            </tr>
            <tr>
                <td class="auto-style3">        
                    &nbsp;</td>
                <td>        
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">          
                        &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
  </div>
<br />
<div class ="text-right "></div>

        <div class="panel panel-primary">
                  <div class="panel-heading">
                      <h1 class="panel-title">ชื่อโครงการ</h1>
                  </div>
                  <table class="table table-striped table-hover">
                      <thead>
                          <tr>
                              <th class="auto-style2">NO.</th>
                              <th class="auto-style1">รหัส</th>
                              <th class="auto-style1">วันที่ส่ง</th>
                              <th class="auto-style1">ชื่อโครงการ</th>
                              <th class="auto-style1">&nbsp;</th>
                              <th class="auto-style1">ผู้วิจัยหลัก</th>
                              <th class="auto-style1">สถานะ</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr class="success">
                              <td class="auto-style3">1</td>
                              <td>2559/001</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">โครงการประเมินหัวข้อปัญหาและเทคโนโลยีด้านสุขภาพ เพื่อประกอบการพิจารณาเป็นสิทธิประโยชน์ในระบบหลักประกันสุขภาพถ้วนหน้า <span class="label label-default">New</span></a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P1.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a></td>
                              <td>
                                  <p>
                                    ฉบับร่าง :5%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:5%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr >
                              <td class="auto-style3">2</td>
                              <td>2559/002</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">โครงการศึกษาการวัดสมรรถภาพของปอดด้วย spirometry ในโรงพยาบาลชุมชน<span class="label label-default">New</span></a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P2.jpg" /></td>
                              <td>
                                  <p>
                                      <a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a>
                                  </p>
                              </td>
                              <td>
                                  <p>
                                    ส่งโครงการวิจัย :10%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:10%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr class="success">
                              <td class="auto-style3">3</td>
                              <td>2559/003</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~//Page/DetailProposal.aspx")%>' target="_blank">โครงการจัดทำคุณลักษณะที่เหมาะสมและมีประสิทธิภาพของสายสวนเพื่อขยายหลอดเลือดโคโรนารี่ด้วยบอลลูนและขดลวดค้ำยันผนังหลอดเลือด<span class="label label-default">New</span></a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P3.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a></td>
                              <td>
                                  <p>
                                    เจ้าหน้าที่รับเรื่อง :30%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:30%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr >
                              <td class="auto-style3">4</td>
                              <td>2559/004</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~//Page/DetailProposal.aspx")%>' target="_blank">โครงการศึกษาระบบบริการหลังการให้เครื่องช่วยฟังและการใช้เครื่องช่วยฟังของผู้พิการทางการได้ยินในระบบหลักประกันสุขภาพถ้วนหน้า</a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P4.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a></td>
                              <td>
                                  <p>
                                    อนุมัติการทำวิจัย :40%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:40%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr class="success">
                              <td class="auto-style3" >5</td>
                              <td >2559/005</td>
                              <td >2014-08-25 11:30:41</td>
                              <td ><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">การประเมินบริการอนามัยโรงเรียนระดับประถมศึกษา</a></td>
                              <td >
                                  <img class="auto-style2" src="../Images/P5.jpg" /></td>
                              <td ><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a></td>
                              <td >
                                  <p>
                                      รายงานความก้าวหน้า :50%
                                  </p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:50%">
                                      </div>
                                  </div>
                              </td>
                          </tr >
                          <tr>
                              <td class="auto-style3">6</td>
                              <td>2559/006</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">การประเมินความคุ้มค่าทางเศรษฐศาสตร์ของการคัดกรองมะเร็งช่องปาก</a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P6.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a>
                              </td>
                              <td>
                                  <p>
                                    ส่งเอกสารฉบับสมบูรณ์ :80%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:80%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr class="success">
                              <td class="auto-style3">7</td>
                              <td>2559/007</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">โครงการพัฒนาข้อเสนอเกี่ยวกับระบบและโครงสร้างการคุ้มครองผู้บริโภคด้านผลิตภัณฑ์สุขภาพของประเทศไทยในอนาคต</a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P7.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a>
                              </td>
                              <td>
                                  <p>
                                    เสร็จสิ้น :100%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:100%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr >
                              <td class="auto-style3">8</td>
                              <td>2559/008</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">การประเมินความคุ้มค่าของยา lodized oil fluid injection (Lipiodol Ultra Fluid) สำหรับการรักษามะเร็งตับ (Hepatocellular carcinoma) </a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P8.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a> </td>
                              <td>
                                  <p>
                                    ปิดโครงการ :100%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:100%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr class="success">
                              <td class="auto-style3">9</td>
                              <td>2559/001</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">โครงการประเมินหัวข้อปัญหาและเทคโนโลยีด้านสุขภาพ เพื่อประกอบการพิจารณาเป็นสิทธิประโยชน์ในระบบหลักประกันสุขภาพถ้วนหน้า <span class="label label-default">New</span></a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P9.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a></td>
                              <td>
                                  <p>
                                    ปิดโครงการ :100%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:100%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr >
                              <td class="auto-style3">10</td>
                              <td>2559/002</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">โครงการศึกษาการวัดสมรรถภาพของปอดด้วย spirometry ในโรงพยาบาลชุมชน<span class="label label-default">New</span></a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P10.jpg" /></td>
                              <td>
                                  <p>
                                      <a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a>
                                  </p>
                              </td>
                              <td>
                                  <p>
                                    ฉบับร่าง :5%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:5%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr class="success">
                              <td class="auto-style3">11</td>
                              <td>2559/003</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~//Page/DetailProposal.aspx")%>' target="_blank">โครงการจัดทำคุณลักษณะที่เหมาะสมและมีประสิทธิภาพของสายสวนเพื่อขยายหลอดเลือดโคโรนารี่ด้วยบอลลูนและขดลวดค้ำยันผนังหลอดเลือด<span class="label label-default">New</span></a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P11.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a></td>
                              <td>
                                  <p>
                                    พิจารณา EC :60%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:60%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr >
                              <td class="auto-style3">12</td>
                              <td>2559/004</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~//Page/DetailProposal.aspx")%>' target="_blank">โครงการศึกษาระบบบริการหลังการให้เครื่องช่วยฟังและการใช้เครื่องช่วยฟังของผู้พิการทางการได้ยินในระบบหลักประกันสุขภาพถ้วนหน้า</a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P12.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a></td>
                              <td>
                                  <p>
                                    รายงานความก้าวหน้า :80%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:80%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr class="success">
                              <td class="auto-style3" >13</td>
                              <td >2559/005</td>
                              <td >2014-08-25 11:30:41</td>
                              <td ><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">การประเมินบริการอนามัยโรงเรียนระดับประถมศึกษา</a></td>
                              <td >
                                  <img class="auto-style2" src="../Images/P1.jpg" /></td>
                              <td ><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a></td>
                              <td >
                                  <p>
                                      รายงานความก้าวหน้า :15%
                                  </p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:15%">
                                      </div>
                                  </div>
                              </td>
                          </tr >
                          <tr>
                              <td class="auto-style3">14</td>
                              <td>2559/006</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">การประเมินความคุ้มค่าทางเศรษฐศาสตร์ของการคัดกรองมะเร็งช่องปาก</a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P2.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a>
                              </td>
                              <td>
                                  <p>
                                    รายงานความก้าวหน้า :80%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:80%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr class="success">
                              <td class="auto-style3">15</td>
                              <td>2559/007</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">โครงการพัฒนาข้อเสนอเกี่ยวกับระบบและโครงสร้างการคุ้มครองผู้บริโภคด้านผลิตภัณฑ์สุขภาพของประเทศไทยในอนาคต</a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P3.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a>
                              </td>
                              <td>
                                  <p>
                                    ส่งเรื่อง :30%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:30%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr >
                              <td class="auto-style3">16</td>
                              <td>2559/008</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">การประเมินความคุ้มค่าของยา lodized oil fluid injection (Lipiodol Ultra Fluid) สำหรับการรักษามะเร็งตับ (Hepatocellular carcinoma) </a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P4.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a> </td>
                              <td>
                                  <p>
                                    ปิดโครงการ :100%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:100%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr class="success">
                              <td class="auto-style3">17</td>
                              <td>2559/001</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">โครงการประเมินหัวข้อปัญหาและเทคโนโลยีด้านสุขภาพ เพื่อประกอบการพิจารณาเป็นสิทธิประโยชน์ในระบบหลักประกันสุขภาพถ้วนหน้า <span class="label label-default">New</span></a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P5.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a></td>
                              <td>
                                  <p>
                                    ปิดโครงการ :100%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:100%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr >
                              <td class="auto-style3">18</td>
                              <td>2559/002</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">โครงการศึกษาการวัดสมรรถภาพของปอดด้วย spirometry ในโรงพยาบาลชุมชน<span class="label label-default">New</span></a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P6.jpg" /></td>
                              <td>
                                  <p>
                                      <a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a>
                                  </p>
                              </td>
                              <td>
                                  <p>
                                    ฉบับร่าง :5%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:5%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr class="success">
                              <td class="auto-style3">19</td>
                              <td>2559/003</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~//Page/DetailProposal.aspx")%>' target="_blank">โครงการจัดทำคุณลักษณะที่เหมาะสมและมีประสิทธิภาพของสายสวนเพื่อขยายหลอดเลือดโคโรนารี่ด้วยบอลลูนและขดลวดค้ำยันผนังหลอดเลือด<span class="label label-default">New</span></a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P7.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a></td>
                              <td>
                                  <p>
                                    พิจารณา EC :60%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:60%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr >
                              <td class="auto-style3">20</td>
                              <td>2559/004</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~//Page/DetailProposal.aspx")%>' target="_blank">โครงการศึกษาระบบบริการหลังการให้เครื่องช่วยฟังและการใช้เครื่องช่วยฟังของผู้พิการทางการได้ยินในระบบหลักประกันสุขภาพถ้วนหน้า</a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P8.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a></td>
                              <td>
                                  <p>
                                    รายงานความก้าวหน้า :80%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:80%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style3">22</td>
                              <td>2559/006</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">การประเมินความคุ้มค่าทางเศรษฐศาสตร์ของการคัดกรองมะเร็งช่องปาก</a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P9.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a>
                              </td>
                              <td>
                                  <p>
                                    รายงานความก้าวหน้า :80%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:80%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr class="success">
                              <td class="auto-style3">23</td>
                              <td>2559/007</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">โครงการพัฒนาข้อเสนอเกี่ยวกับระบบและโครงสร้างการคุ้มครองผู้บริโภคด้านผลิตภัณฑ์สุขภาพของประเทศไทยในอนาคต</a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P10.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a>
                              </td>
                              <td>
                                  <p>
                                    ส่งเรื่อง :30%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:30%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr >
                              <td class="auto-style3">24</td>
                              <td>2559/008</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">การประเมินความคุ้มค่าของยา lodized oil fluid injection (Lipiodol Ultra Fluid) สำหรับการรักษามะเร็งตับ (Hepatocellular carcinoma) </a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P11.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a> </td>
                              <td>
                                  <p>
                                    ปิดโครงการ :100%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:100%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr class="success">
                              <td class="auto-style3">25</td>
                              <td>2559/001</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">โครงการประเมินหัวข้อปัญหาและเทคโนโลยีด้านสุขภาพ เพื่อประกอบการพิจารณาเป็นสิทธิประโยชน์ในระบบหลักประกันสุขภาพถ้วนหน้า <span class="label label-default">New</span></a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P12.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a></td>
                              <td>
                                  <p>
                                    ปิดโครงการ :100%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:100%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr >
                              <td class="auto-style3">26</td>
                              <td>2559/002</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">โครงการศึกษาการวัดสมรรถภาพของปอดด้วย spirometry ในโรงพยาบาลชุมชน<span class="label label-default">New</span></a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P4.jpg" /></td>
                              <td>
                                  <p>
                                      <a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a>
                                  </p>
                              </td>
                              <td>
                                  <p>
                                    ฉบับร่าง :5%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:5%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr class="success">
                              <td class="auto-style3">27</td>
                              <td>2559/003</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~//Page/DetailProposal.aspx")%>' target="_blank">โครงการจัดทำคุณลักษณะที่เหมาะสมและมีประสิทธิภาพของสายสวนเพื่อขยายหลอดเลือดโคโรนารี่ด้วยบอลลูนและขดลวดค้ำยันผนังหลอดเลือด<span class="label label-default">New</span></a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P1.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a></td>
                              <td>
                                  <p>
                                    พิจารณา EC :60%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:60%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr >
                              <td class="auto-style3">28</td>
                              <td>2559/004</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~//Page/DetailProposal.aspx")%>' target="_blank">โครงการศึกษาระบบบริการหลังการให้เครื่องช่วยฟังและการใช้เครื่องช่วยฟังของผู้พิการทางการได้ยินในระบบหลักประกันสุขภาพถ้วนหน้า</a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P2.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a></td>
                              <td>
                                  <p>
                                    รายงานความก้าวหน้า :80%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:80%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style3">30</td>
                              <td>2559/006</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">การประเมินความคุ้มค่าทางเศรษฐศาสตร์ของการคัดกรองมะเร็งช่องปาก</a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P3.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a>
                              </td>
                              <td>
                                  <p>
                                    รายงานความก้าวหน้า :80%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:80%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr class="success">
                              <td class="auto-style3">31</td>
                              <td>2559/007</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">โครงการพัฒนาข้อเสนอเกี่ยวกับระบบและโครงสร้างการคุ้มครองผู้บริโภคด้านผลิตภัณฑ์สุขภาพของประเทศไทยในอนาคต</a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P4.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a>
                              </td>
                              <td>
                                  <p>
                                    ส่งเรื่อง :30%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:30%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr >
                              <td class="auto-style3">32</td>
                              <td>2559/008</td>
                              <td>2014-08-25 11:30:41</td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/DetailProposal.aspx")%>' target="_blank">การประเมินความคุ้มค่าของยา lodized oil fluid injection (Lipiodol Ultra Fluid) สำหรับการรักษามะเร็งตับ (Hepatocellular carcinoma) </a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P5.jpg" /></td>
                              <td><a href='<%= Page.ResolveUrl("~/Page/ViewPersonResearch.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a> </td>
                              <td>
                                  <p>
                                    ปิดโครงการ :100%</p>
                                  <div class="progress">
                                      <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" class="progress-bar progress-bar-success" role="progressbar" style="width:100%">
                                      </div>
                                  </div>
                              </td>
                          </tr>
                      </tbody>
                  </table>
    </div>

</asp:Content>
