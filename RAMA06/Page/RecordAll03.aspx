<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="RecordAll03.aspx.vb" Inherits="RAMA06.RecordAll03" %>
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
<h1 class="text-center">
 <a href="#" id="A2" runat="server" class="list-group-item">&nbsp;การขอรับเงินรางวัล</a></h1>
<br/>
<div class="text-left">  <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-info btn-lg" NavigateUrl="~/Page/Reward.aspx" Width="200px"><span class="glyphicon glyphicon-edit"></span>ส่งขอรับเงินรางวัล</asp:HyperLink>
    <asp:HyperLink ID="HyperLink2" runat="server" class="btn btn-info btn-lg" data-toggle="collapse" data-target="#demo" Width="150px">ค้นหาข้อมูล</asp:HyperLink>
    <asp:HyperLink ID="HyperLink3" runat="server" class="btn btn-info btn-lg" Width="150px">Export to Excel</asp:HyperLink>
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
                                  <img class="auto-style2" src="../Images/P2.jpg" /></td>
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
                              <td><a href='<%= Page.ResolveUrl("~//Page/DetailProposal.aspx")%>' target="_blank">การจัดทำคุณลักษณะที่เหมาะสมและมีประสิทธิภาพของสายสวนเพื่อขยายหลอดเลือดโคโรนารี่ด้วยบอลลูนและขดลวดค้ำยันผนังหลอดเลือด<span class="label label-default">New</span></a></td>
                              <td>
                                  <img class="auto-style2" src="../Images/P2.jpg" /></td>
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
                      </tbody>
                  </table>
    </div>

</asp:Content>