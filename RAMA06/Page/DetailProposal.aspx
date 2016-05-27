<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DetailProposal.aspx.vb" Inherits="RAMA06.DetailProposal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title> 

  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<style>

    <!-- Progress with steps -->

    ol.progtrckr {
        margin: 0;
        padding: 0;
        list-style-type: none;
    }

    ol.progtrckr li {
        display: inline-block;
        text-align: center;
        line-height: 3em;
    }

    ol.progtrckr[data-progtrckr-steps="2"] li { width: 49%; }
    ol.progtrckr[data-progtrckr-steps="3"] li { width: 33%; }
    ol.progtrckr[data-progtrckr-steps="4"] li { width: 24%; }
    ol.progtrckr[data-progtrckr-steps="5"] li { width: 19%; }
    ol.progtrckr[data-progtrckr-steps="6"] li { width: 16%; }
    ol.progtrckr[data-progtrckr-steps="7"] li { width: 14%; }
    ol.progtrckr[data-progtrckr-steps="8"] li { width: 12%; }
    ol.progtrckr[data-progtrckr-steps="9"] li { width: 11%; }

    ol.progtrckr li.progtrckr-done {
        color: black;
        border-bottom: 4px solid yellowgreen;
    }
    ol.progtrckr li.progtrckr-todo {
        color: silver; 
        border-bottom: 4px solid silver;
    }

    ol.progtrckr li:after {
        content: "\00a0\00a0";
    }
    ol.progtrckr li:before {
        position: relative;
        bottom: -2.5em;
        float: left;
        left: 50%;
        line-height: 1em;
    }
    ol.progtrckr li.progtrckr-done:before {
        content: "\2713";
        color: white;
        background-color: yellowgreen;
        height: 1.2em;
        width: 1.2em;
        line-height: 1.2em;
        border: none;
        border-radius: 1.2em;
    }
    ol.progtrckr li.progtrckr-todo:before {
        content: "\039F";
        color: silver;
        background-color: white;
        font-size: 1.5em;
        bottom: -1.6em;
    }

   </style>



</head>
<body>
<form id="form1" runat="server" enctype="multipart/form-data">
<br />
<div class="container">
    <div class ="text-right">
         <button type="button" id="button3" class="btn btn-danger"  data-toggle="collapse" data-target="#bt1"><span class="glyphicon glyphicon-remove"></span> ยกเลิกโครงการวิจัย</button>     
    </div>
     <div id="bt1" class="collapse">  
     <br />  
     <div class="alert alert-dismissable alert-danger">
         <div><h1>ยกเลิกโครงการวิจัย</h1></div>  
         <div>รายละเอียดการยกเลิกโครงการ : </div>  
         <div><textarea class="form-control" rows="3"></textarea> </div>
         <div><asp:CheckBox ID="CheckBox9" Text="ยึนยันการยกเลิกโครงการ" runat="server" /> </div>
         <br />
         <div>*** หมายเหตุ : หากมีการยกเลิกโครงการแล้ว โครงการวิจัยนั้นจะไม่สามารถดำเนินกิจกรรมใดๆ ได้ </div>  
         <div class ="text-right"><asp:Button ID="Button19" runat="server" class="btn btn-primary btn-lg" Text="ยืนยันการยกเลิกโครงการ" /> </div>
     </div>
 </div>
     <div class ="text-left"><h1>ข้อมูลโครงการวิจัย</h1></div>
     <div class="panel panel-primary">
         <br />
       <div class="text-center">
       <ol class="progtrckr" data-progtrckr-steps="6">
            <li class="progtrckr-done">1. ส่งโครงการวิจัย</li>
            <li class="progtrckr-done">2. รับเรื่อง</li>
            <li class="progtrckr-done">3. พิจารณาจริยธรรม</li>
            <li class="progtrckr-done">4. พิจารณาทุน</li>
            <li class="progtrckr-done">5. อนุมัติ</li>
            <li class="progtrckr-done">6. รายงานก้าวหน้า</li>
            <li class="progtrckr-done">7. ส่งเอกสารสมบูรณ์</li>
            <li class="progtrckr-done">8. เสร็จสิ้น</li>
        </ol>   
     </div>
       <br />
      <div class="panel-body">
                   
         <div class="panel panel-default">
           <div class="panel-heading"><h4>ข้อมูลโครงการวิจัย</h4></div>
              <div class="panel-body">                    
                  <div class="panel-group" >                   
                   <div class="panel panel-default">
                        <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse"  href="#Collapse1">ขั้นตอนที่ 1 [ส่งโครงการวิจัย]</a> </h4> </div>
                          <div id="Collapse1" class="panel-collapse collapse in">                            
                             <div class="panel-body">
                               <div class="panel panel-default">                                  
                                    <div class="panel-heading"> <strong>ข้อมูลโครงการ</strong> </div>
                                       <div class="panel-body">       
                                           <div class="panel-body">       
                                              
          <div> 
     <br /> 

                    <div class ="text-center">
                        <asp:Image ID="Image1" runat="server" Height="220px" Width="196px" ImageUrl="~/Images/P2.jpg" />
                    </div>
                     <br /> 
                    <div class ="text-center">
                           <h3> ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล </h3>
                        </div>
                        <div class ="text-center">
                            <h3>E-mail: Kriangkrai_pipit@mahidol.ac.th </h3></div>
                        <div class ="text-center">
                           <h3> เบอร์โทร : 083-0110-273</h3></div>
                        <div class ="text-center">
                           <h3> ตำแหน่ง : อาจารย์</h3>
                        </div>
                        <div class ="text-center">
                           <h3> สังกัด : ภาควิชาอายุรศาสตร์</h3>
                        </div>
             <br />
             <div><h3> รหัสโครงการ : 107 </h3></div>
             <br />             
             <div><h3> ชื่อโครงการวิจัย (Thai) :โครงการจัดทำคุณลักษณะที่เหมาะสมและมีประสิทธิภาพของสายสวนเพื่อขยายหลอดเลือดโคโรนารี่ด้วยบอลลูนและขดลวดค้ำยันผนังหลอดเลือด </h3></div>
             <br />            
             <div> <h3> ชื่อโครงการวิจัย (Eng) :Integrating of Health Care System in Community Development and Expertise
                    Development for the Clinical Instructors by Practicing in Community: A Longitudinal Study
                    2005-2007 </h3>
             </div>      
             <br />
             <div> 
                     <div> <h3>รายชื่อผู้ร่วมโครงการวิจัย : </h3></div>
                     <div><h3>1. ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล (ผู้วิจัยหลัก) (ร้อยละการมีส่วนร่วม:40) </h3></div> 
                     <div><h3>2. ดร.ภญ.ศิตาพร ยังคง (ผู้วิจัร่วม) (ร้อยละการมีส่วนร่วม:10) </h3></div>
                     <div><h3>3. นายทรงยศ พิลาสันต์ (ผู้วิจัร่วม) (ร้อยละการมีส่วนร่วม:10) </h3></div> 
                     <div><h3>4. ภญ.ศตนันทน์ มณีอ่อน (ผู้วิจัร่วม) (ร้อยละการมีส่วนร่วม:10) </h3></div> 
                     <div><h3>5. ผศ.นพ.สิท ดวงทิพย์สิริกุล (ผู้วิจัร่วม) (ร้อยละการมีส่วนร่วม:20) </h3></div> 
                     <div><h3>6. ผศ.นพ.สุรชัน ทิพย์สิริกุล (ผู้วิจัร่วม) (ร้อยละการมีส่วนร่วม:10) </h3></div>
                 
             </div>
             <br />
             <div><h3> ลักษณะโครงการวิจัย : โครงการชุดใหญ่ (ชุด ว.) </h3></div>
             <br />
             <div><h3> ประเภทโครงการวิจัย : โครงการวิจัยหลัก </h3></div>
             <br />
              <div><h3>โครงการวิจัยอยู่ในกุล่มโรคใด : โรคหัวใจและหลอดเลือด</h3> </div>
             <br />
             <div><h3>โครงการวิจัยเกี่ยวกับ (คลินิก/ไม่คลินิก) : คลินิก</h3> </div>
             <br />
             <div><h3>ประเภททุน :ทุนรายได้คณะ</h3></div>
             <br />
             <div><h3> ชื่อทุน : ทุน Biomedical research การวิจัยทางคลินกทางการแพทย์และพยาบาล</h3></div>
             <br />
             <div> 
                   <label class="control-label" for="inputLarge">เอกสารโครงการจัย :</label>  
             </div> 
            <div>
                <table class="nav-justified">
                    <tr>
                        <td><strong>ลำดับ</strong></td>
                        <td><strong>วัน เวลาที่ส่ง</strong></td>
                        <td><strong>ชื่อไฟล์</strong></td>
                        <td><strong>ประเภทเอกสาร</strong></td>
                        <td><strong>หมายเหตุ</strong></td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>7 มีนาคม 2559 14:45:30</td>
                        <td><asp:HyperLink ID="HyperLink21" runat="server">เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>7 มีนาคม 2559 14:45:30</td>
                        <td><asp:HyperLink ID="HyperLink22" runat="server"> เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>7 มีนาคม 2559 14:45:30</td>
                        <td><asp:HyperLink ID="HyperLink33" runat="server"> เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>7 มีนาคม 2559 14:45:30</td>
                        <td><asp:HyperLink ID="HyperLink34" runat="server"> เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>7 มีนาคม 2559 14:45:30</td>
                        <td><asp:HyperLink ID="HyperLink35" runat="server"> เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>7 มีนาคม 2559 14:45:30</td>
                        <td><asp:HyperLink ID="HyperLink36" runat="server"> เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>7 มีนาคม 2559 14:45:30</td>
                        <td><asp:HyperLink ID="HyperLink37" runat="server"> เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">8</td>
                        <td class="auto-style2">7 มีนาคม 2559 14:45:30</td>
                        <td class="auto-style2"><asp:HyperLink ID="HyperLink38" runat="server"> เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td class="auto-style2"></td>
                        <td class="auto-style2"></td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td>7 มีนาคม 2559 14:45:30</td>
                        <td><asp:HyperLink ID="HyperLink39" runat="server"> เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>7 มีนาคม 2559 14:45:30</td>
                        <td><asp:HyperLink ID="HyperLink40" runat="server"> เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>11</td>
                        <td>7 มีนาคม 2559 14:45:30</td>
                        <td><asp:HyperLink ID="HyperLink41" runat="server"> เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>12</td>
                        <td>7 มีนาคม 2559 14:45:30</td>
                        <td><asp:HyperLink ID="HyperLink42" runat="server"> เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>13</td>
                        <td>7 มีนาคม 2559 14:45:30</td>
                        <td><asp:HyperLink ID="HyperLink43" runat="server"> เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>14</td>
                        <td>7 มีนาคม 2559 14:45:30</td>
                        <td><asp:HyperLink ID="HyperLink44" runat="server"> เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>15</td>
                        <td>7 มีนาคม 2559 14:45:30</td>
                        <td><asp:HyperLink ID="HyperLink45" runat="server"> เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>16</td>
                        <td>7 มีนาคม 2559 14:45:30</td>
                        <td><asp:HyperLink ID="HyperLink46" runat="server"> เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></td>
                        <td>โครงการวิจัย</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
                <br />   
                <hr />
                                             
                <div class="well">ประวัติการติดต่อสือสาร เกี่ยวกับการพิจาณาจริยธรรม</div>               
                <div class="well">ประวัติการติดต่อสือสาร เกี่ยวกับการพิจารณาทุน</div>                
                <div class="well">ประวัติการติดต่อสือสาร เกี่ยวกับการอนุมัติ</div>             
                <div class="well">ประวัติการติดต่อสือสาร เกี่ยวกับเกี่ยวกับการรายงานความก้าวหน้า</div>                
                <div class="well">ประวัติการติดต่อสือสาร เกี่ยวกับส่งโครงการวิจัยสมบูณร์</div>                
                <div class="well">ประวัติการติดต่อสือสาร เกี่ยวกับเสร็จสิ้น</div>               
                               
                </div>  

                                           </div>
                                       </div>
                                   </div>
                              </div>
                        </div>
                     </div>

                  </div> 
                 
                   <div class="panel panel-default">
                      <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse"  href="#Collapse2"> ขั้นตอนที่ 2 [พิจารณรับเรื่อง]</a></h4></div>
                         <div id="Collapse2" class="panel-collapse collapse">
                           <div class="panel-body">
                              <div class="panel panel-default">
                                 <div class="panel-heading"> <strong> เจ้าหน้าที่บันทึกสรุปผลการพิจารณารับเรื่อง</strong></div>
                                    <div class="panel-body">       
                                         <div class="panel-body">       
                     <div><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong> </div>    
                     <div><textarea class="form-control" rows="6"></textarea> </div>    
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList2" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                     <asp:Button ID="Button6" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button21" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     &nbsp;
                     <button type="button" id="button1" class="btn btn-danger"  data-toggle="collapse" data-target="#bt3">แจ้งเรื่องกลับ</button>     
                     </div> 
                    
                    <div id="bt3" class="collapse" >
                   <div class="alert alert-dismissable alert-danger"> 
                   <div>บันทึกการปฏิบัติและ หมายเหตุ (แจ้งเรื่องกลับ)</div> 
                   <div> <textarea class="form-control" rows="3" cols="20" name="S1"></textarea></div>
                    <br />
                    <div> <asp:FileUpload ID="FileUpload1" runat="server" />    </div>
                    <div>ไฟล์แนบ</div>
                    <br />
                   <div class ="text-right" ><asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="ตกลง" /> 
                    </div>
                  
               </div>
           </div>                         
                                              
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
                                   </div>
                                </div>
                            </div>
                         </div>
                    </div>
                   
               <div class="panel panel-default">
               <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse"  href="#Collapse3"> ขั้นตอนที่ 3 [พิจารณาจริยธรรม (EC)]</a></h4></div>
               <div id="Collapse3" class="panel-collapse collapse">
                        <div class="panel panel-default">
               <div class="panel-heading"><h4>กำหนดกรรมการพิจารณาจริยธรรม (EC)</h4></div>
               <div class="panel-body">              
               <div class="panel panel-default">
                  <div class="panel-heading">
                      <asp:Button ID="Button4"  class="btn btn-primary" runat="server" Text="เพิ่มกรรมการ" />
                      </div>
                  <div class="panel-body">       
                      <div>
                          <table class="nav-justified">
                              <tr>
                                  <td>ลำดับ</td>
                                  <td><strong>รายชื่อกรรมการพิจารณาจริยธรรม (EC)</strong></td>
                                  <td>สถานะ</td>
                                  <td>รายละเอียด</td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>1</td>
                                  <td><strong>รศ. จินตนันท์ ศรีสุยิ่ง</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink48" data-toggle="collapse" data-target="#btReturn" runat="server">ผ่าน</asp:HyperLink>
                                  </td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink51" runat="server" NavigateUrl="~/Page/Committee01.aspx" Target="_blank">รายละเอียด</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>2</td>
                                  <td><strong>ศ.เจนภพ อธิรัตนชัย</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink49" data-toggle="collapse" data-target="#btReturn" runat="server">ไม่ผ่าน</asp:HyperLink>
                                  </td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink52" runat="server" NavigateUrl="~/Page/Committee01.aspx" Target="_blank">รายละเอียด</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>3</td>
                                  <td><strong>ศ.สุริเยนทร์ แดงทองดี</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink47" data-toggle="collapse" data-target="#btReturn" runat="server">ไม่รับพิจารณา</asp:HyperLink>
                                  </td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink53" runat="server" NavigateUrl="~/Page/Committee01.aspx" Target="_blank">รายละเอียด</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>4</td>
                                  <td><strong>ผศ.ศิริมงคล พันหว้า</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink50" data-toggle="collapse" data-target="#btReturn" runat="server">ไหม่</asp:HyperLink>
                                  </td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink54" runat="server" NavigateUrl="~/Page/Committee01.aspx" Target="_blank">รายละเอียด</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              </table>       
                       </div> 
             </div>
                    <div id="btReturn" class="collapse"> 
                      
                        <div  class="alert alert-dismissable alert-danger">                             
                            <p> ข้อมูลโครงการวิจัยไม่เกี่ยวข้องกับผู้ พิจารณา กรุณาเลือกผู้พิจารณาใหม่ 
                            </p>
                            <div class ="text-right"> <asp:Button ID="Button34"  class="btn btn-primary" runat="server" Text="ส่งพิจารณาใหม่" />
                            </div>
                        </div> 
                                              
                   </div>
              </div>
              <br /> 
               <div><h2> บันทึกสรุปผลการพิจารณาจริยธรรม (EC)</h2></div> 
              <div class="panel panel-default">
                   <div class="panel-heading"> <strong>บันทึกการปฏิบัติและ หมายเหตุ </strong>
                      </div>
                     <div class="panel-body">       
                 <div class="panel-body">                             
                     <div><textarea class="form-control" rows="10"></textarea> </div>    
                     <br />
                     <asp:FileUpload ID="FileUpload4" runat="server" />
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList3" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button7" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button22" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     &nbsp;
      <button type="button" id="button35" class="btn btn-danger"  data-toggle="collapse" data-target="#bt4">แจ้งเรื่องกลับ</button>     
                     </div> 
               <br />
               <div id="bt4" class="collapse" >
                  <div class="alert alert-dismissable alert-danger"> 
                   <div>บันทึกการปฏิบัติและ หมายเหตุ (แจ้งเรื่องกลับ)</div> 
                   <div> <textarea class="form-control" rows="3" cols="20" name="S1"></textarea></div>
                    <br />
                    <div> <asp:FileUpload ID="FileUpload3" runat="server" />    </div>
                    <div>ไฟล์แนบ</div>
                    <br />
                   <div class ="text-right" ><asp:Button ID="Button23" class="btn btn-primary" runat="server" Text="ตกลง" /> 
                    </div>
                  
               </div>
            </div>  
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
              </div>

             </div>
            
              
            </div>                  
         </div> 
               </div>
                    </div>

                   <div class="panel panel-default">
                      <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse"  href="#Collapse4"> ขั้นตอนที่ 4 [พิจารณาทุน]</a></h4></div>
                         <div id="Collapse4" class="panel-collapse collapse">
                                     <div class="panel panel-default">
               <div class="panel-heading"><h4>กำหนดกรรมการพิจารณาทุน</h4></div>
               <div class="panel-body">              
               <div class="panel panel-default">
                  <div class="panel-heading">
                      <asp:Button ID="Button5"  class="btn btn-primary" runat="server" Text="เพิ่มกรรมการ" />
                      </div>
                  <div class="panel-body">       
                      <div>
                          <table class="nav-justified">
                              <tr>
                                  <td>ลำดับ</td>
                                  <td><strong>รายชื่อกรรมการพิจารณาทุน</strong></td>
                                  <td>สถานะ</td>
                                  <td>รายละเอียด</td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>1</td>
                                  <td><strong>รศ. จินตนันท์ ศรีสุยิ่ง</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink1" data-toggle="collapse" data-target="#btReturn" runat="server">ผ่าน</asp:HyperLink>
                                  </td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Page/Committee02.aspx" Target="_blank">รายละเอียด</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>2</td>
                                  <td><strong>ศ.เจนภพ อธิรัตนชัย</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink3" data-toggle="collapse" data-target="#btReturn" runat="server">ไม่ผ่าน</asp:HyperLink>
                                  </td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Page/Committee02.aspx" Target="_blank">รายละเอียด</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>3</td>
                                  <td><strong>ศ.สุริเยนทร์ แดงทองดี</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink5" data-toggle="collapse" data-target="#btReturn" runat="server">ไม่รับพิจารณา</asp:HyperLink>
                                  </td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Page/Committee02.aspx" Target="_blank">รายละเอียด</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>4</td>
                                  <td><strong>ผศ.ศิริมงคล พันหว้า</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink7" data-toggle="collapse" data-target="#btReturn2" runat="server">ใหม่</asp:HyperLink>
                                  </td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Page/Committee02.aspx" Target="_blank">รายละเอียด</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              </table>       
                       </div> 
             </div>
                    <div id="btReturn2" class="collapse">                       
                        <div  class="alert alert-dismissable alert-danger">                             
                            <p> ข้อมูลโครงการวิจัยไม่เกี่ยวข้องกับผู้ พิจารณา กรุณาเลือกผู้พิจารณาใหม่ 
                            </p>
                            <div class ="text-right"> <asp:Button ID="Button8"  class="btn btn-primary" runat="server" Text="ส่งพิจารณาใหม่" />
                            </div>
                        </div> 
                                              
                   </div>

                   <div class ="text-right" ><h3>จำนวนเงินทุนที่ขอ :  560,000 บาท </h3></div> 
                   <div class ="text-right" ><h3>รวมจำนวนเงินที่อนุมัติ :  500,000 บาท </h3></div>

              </div>
              <br /> 
               <div><h2> บันทึกสรุปผลการพิจารณาทุน </h2></div> 
              <div class="panel panel-default">
                   <div class="panel-heading"> <strong>บันทึกการปฏิบัติและ หมายเหตุ </strong>
                      </div>
                     <div class="panel-body">       
                 <div class="panel-body">                             
                     <div><textarea class="form-control" rows="10"></textarea> </div>    
                     <br />
                     <asp:FileUpload ID="FileUpload9" runat="server" />
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList1" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button9" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button10" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     &nbsp;
      <button type="button" id="button36" class="btn btn-danger"  data-toggle="collapse" data-target="#bt5">แจ้งเรื่องกลับ</button>     
                     </div> 
               <br />
               <div id="bt5" class="collapse" >
                  <div class="alert alert-dismissable alert-danger"> 
                   <div>บันทึกการปฏิบัติและ หมายเหตุ (แจ้งเรื่องกลับ)</div> 
                   <div> <textarea class="form-control" rows="3" cols="20" name="S1"></textarea></div>
                    <br />
                    <div> <asp:FileUpload ID="FileUpload5" runat="server" />    </div>
                    <div>ไฟล์แนบ</div>
                    <br />
                   <div class ="text-right" ><asp:Button ID="Button11" class="btn btn-primary" runat="server" Text="ตกลง" /> 
                    </div>
                  
               </div>
            </div>  
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
              </div>

             </div>
            
              
            </div>                  
         </div> 
                         </div>
                    </div>

                   <div class="panel panel-default">
                      <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse"  href="#Collapse5"> ขั้นตอนที่ 5 [อนุมัติ]</a></h4></div>
                         <div id="Collapse5" class="panel-collapse collapse">
                             <div class="panel-body">
                              <div class="panel panel-default">
                                 <div class="panel-heading"> <strong> เจ้าหน้าที่บันทึกสรุปผลการพิจารณา การอนุมัติโครงการวิจัย</strong></div>
                                    <div class="panel-body">       
                                         <div class="panel-body">       
                     <div><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong> </div>    
                     <div><textarea class="form-control" rows="10"></textarea> </div>    
                     <br />
                     <asp:FileUpload ID="FileUpload10" runat="server" />
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList4" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button12" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button13" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     &nbsp;
                      <button type="button" id="button6" class="btn btn-danger"  data-toggle="collapse" data-target="#bt6">แจ้งเรื่องกลับ</button>     
                     </div> 
                      <br />   
                      <div id="bt6" class="collapse" >
                      <div class="alert alert-dismissable alert-danger"> 
                   <div>บันทึกการปฏิบัติและ หมายเหตุ (แจ้งเรื่องกลับ)</div> 
                   <div> <textarea class="form-control" rows="3" cols="20" name="S1"></textarea></div>
                    <br />
                    <div> <asp:FileUpload ID="FileUpload6" runat="server" />    </div>
                    <div>ไฟล์แนบ</div>
                    <br />
                   <div class ="text-right" ><asp:Button ID="Button14" class="btn btn-primary" runat="server" Text="ตกลง" /> 
                    </div>
                  
               </div>
            </div>   
                                             
                                             
                                                       
                                              
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
                                   </div>
                                </div>
                            </div>
                         </div>
                    </div>

                   <div class="panel panel-default">
                      <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse"  href="#Collapse6"> ขั้นตอนที่ 6 [รายงานความก้าวหน้า / การชำระเงิน]</a></h4></div>
                         <div id="Collapse6" class="panel-collapse collapse">
                                <br />
                                <div class="panel panel-default">
               <div class="panel-heading"><h4>ข้อมูลการรายงานความก้าวหน้า </h4></div>
               <div class="panel-body">              
               <div class="panel panel-default">
                  <div class="panel-heading">
                      <asp:Button ID="Button15"  class="btn btn-primary" runat="server" Text="เพิ่มการรายงานความก้าวหน้า" />
                      </div>
                  <div class="panel-body">       
                      <div>
                          <table class="nav-justified">
                              <tr>
                                  <td>ลำดับ</td>
                                  <td>วันที่</td>
                                  <td><strong>เรื่อง</strong></td>
                                  <td>ครั้งที่</td>
                                  <td>รายละเอียด</td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>1</td>
                                  <td>10/01/2016</td>
                                  <td><strong>รายงานความก้าวหน้า</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink9" data-toggle="collapse" data-target="#btReturn" runat="server">1</asp:HyperLink>
                                  </td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/Page/Progress01.aspx" Target="_blank">รายละเอียด</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>2</td>
                                  <td>10/05/2016</td>
                                  <td><strong>รายงานความก้าวหน้า</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink11" data-toggle="collapse" data-target="#btReturn" runat="server">2</asp:HyperLink>
                                  </td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/Page/Progress01.aspx" Target="_blank">รายละเอียด</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>3</td>
                                  <td>10/09/2016</td>
                                  <td><strong>รายงานความก้าวหน้า</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink13" data-toggle="collapse" data-target="#btReturn" runat="server">3</asp:HyperLink>
                                  </td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="~/Page/Progress01.aspx" Target="_blank">รายละเอียด</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              </table>       
                       </div> 
             </div>
                    <div id="btReturn" class="collapse"> 
                      
                        <div  class="alert alert-dismissable alert-danger">                             
                            <p> ข้อมูลโครงการวิจัยไม่เกี่ยวข้องกับผู้ พิจารณา กรุณาเลือกผู้พิจารณาใหม่ 
                            </p>
                            <div class ="text-right"> <asp:Button ID="Button16"  class="btn btn-primary" runat="server" Text="ส่งพิจารณาใหม่" />
                            </div>
                        </div> 
                                              
                   </div>
              </div>
              <br /> 
               <div><h2> บันทึกสรุปผล การรายงานความก้าวหน้า</h2></div> 
              <div class="panel panel-default">
                   <div class="panel-heading"> <strong>บันทึกการปฏิบัติและ หมายเหตุ </strong>
                      </div>
                     <div class="panel-body">       
                 <div class="panel-body">                             
                     <div><textarea class="form-control" rows="10"></textarea> </div>    
                     <br />
                     <asp:FileUpload ID="FileUpload7" runat="server" />
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList5" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button17" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button28" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     &nbsp;
      <button type="button" id="button37" class="btn btn-danger"  data-toggle="collapse" data-target="#bt44">แจ้งเรื่องกลับ</button>     
                     </div> 
               <br />
               <div id="bt44" class="collapse" >
                  <div class="alert alert-dismissable alert-danger"> 
                   <div>บันทึกการปฏิบัติและ หมายเหตุ (แจ้งเรื่องกลับ)</div> 
                   <div> <textarea class="form-control" rows="3" cols="20" name="S1"></textarea></div>
                    <br />
                    <div> <asp:FileUpload ID="FileUpload11" runat="server" />    </div>
                    <div>ไฟล์แนบ</div>
                    <br />
                   <div class ="text-right" ><asp:Button ID="Button29" class="btn btn-primary" runat="server" Text="ตกลง" /> 
                    </div>
                  
               </div>
            </div>  
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
              </div>

             </div>
            
              
            </div>                  
         </div> 
                                                             <br />
                                <div class="panel panel-default">
               <div class="panel-heading"><h4>ข้อมูลการชำระเงิน </h4></div>
               <div class="panel-body">              
               <div class="panel panel-default">
                  <div class="panel-heading">
                      <asp:Button ID="Button30"  class="btn btn-primary" runat="server" Text="เพิ่มรายการชำระเงิน" />
                      </div>
                  <div class="panel-body">       
                      <div>
                          <table class="nav-justified">
                              <tr>
                                  <td>ลำดับ</td>
                                  <td>วันที่</td>
                                  <td><strong>เรื่อง</strong></td>
                                  <td>ครั้งที่</td>
                                  <td>จำนวน</td>
                                  <td>รายละเอียด</td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>1</td>
                                  <td>10/01/2016 </td>
                                  <td><strong>ชำระเงิน</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink15" data-toggle="collapse" data-target="#btReturn" runat="server">1</asp:HyperLink>
                                  </td>
                                  <td>
                                      150,000-</td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="~/Page/Pay-Money.aspx" Target="_blank">รายละเอียด</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>2</td>
                                  <td>10/05/2016</td>
                                  <td><strong>ชำระเงิน</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink17" data-toggle="collapse" data-target="#btReturn" runat="server">2</asp:HyperLink>
                                  </td>
                                  <td>
                                      80,000</td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink18" runat="server" NavigateUrl="~/Page/Pay-Money.aspx" Target="_blank">รายละเอียด</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>3</td>
                                  <td>10/08/2016</td>
                                  <td><strong>ชำระเงิน</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink19" data-toggle="collapse" data-target="#btReturn" runat="server">3</asp:HyperLink>
                                  </td>
                                  <td>
                                      100,000</td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink20" runat="server" NavigateUrl="~/Page/Pay-Money.aspx" Target="_blank">รายละเอียด</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              </table>       
                       </div> 
             </div>
              <br />
                   <div class ="text-right" ><h3>จำนวนเงินทุนที่ได้รับทั้งหมด :  500,000 บาท </h3></div> 
                   <div class ="text-right" ><h3>รวมจำนวนเงินที่ชำระไป :  330,000 บาท </h3></div> 
                   <div class ="text-right"><h3>รวมจำนวนเงินคงเหลือ : 170,000 บาท </h3></div> 
                   
                   
              </div>
              <br /> 
               <div><h2> บันทึกสรุปผล การการชำระเงิน</h2></div> 
              <div class="panel panel-default">
                   <div class="panel-heading"> <strong>บันทึกการปฏิบัติและ หมายเหตุ </strong>
                      </div>
                     <div class="panel-body">       
                 <div class="panel-body">                             
                     <div><textarea class="form-control" rows="10"></textarea> </div>    
                     <br />
                     <asp:FileUpload ID="FileUpload12" runat="server" />
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList9" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button32" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button33" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     &nbsp;
      <button type="button" id="button38" class="btn btn-danger"  data-toggle="collapse" data-target="#bt45">แจ้งเรื่องกลับ</button>     
                     </div> 
               <br />
               <div id="bt45" class="collapse" >
                  <div class="alert alert-dismissable alert-danger"> 
                   <div>บันทึกการปฏิบัติและ หมายเหตุ (แจ้งเรื่องกลับ)</div> 
                   <div> <textarea class="form-control" rows="3" cols="20" name="S1"></textarea></div>
                    <br />
                    <div> <asp:FileUpload ID="FileUpload13" runat="server" />    </div>
                    <div>ไฟล์แนบ</div>
                    <br />
                   <div class ="text-right" ><asp:Button ID="Button38" class="btn btn-primary" runat="server" Text="ตกลง" /> 
                    </div>
                  
               </div>
            </div>  
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
              </div>

             </div>
            
              
            </div>                  
         </div> 

                         </div>
                    </div>

                   <div class="panel panel-default">
                      <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse"  href="#Collapse7"> ขั้นตอนที่ 7 [ส่งเอกสารฉบับสมบูรณ์]</a></h4></div>
                         <div id="Collapse7" class="panel-collapse collapse">
                               <div class="panel-body">
                              <div class="panel panel-default">
                                 <div class="panel-heading"> <strong> เจ้าหน้าที่บันทึกสรุปผลการพิจารณา รับเอกสารฉบับสมบูรณ์</strong></div>
                                    <div class="panel-body">       
                                         <div class="panel-body">       
                     <div><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong> </div>    
                     <div><textarea class="form-control" rows="10"></textarea> </div>
                     <br />
                     <div>    </div>                           
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList6" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>รายงานครั้งที่ 1</asp:ListItem>
                         <asp:ListItem>รายงานครั้งที่ 2</asp:ListItem>
                         <asp:ListItem>รายงานครั้งที่ 3</asp:ListItem>
                         <asp:ListItem>รายงานครั้งที่ 4</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button18" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button24" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     &nbsp;
                      <button type="button" id="button8" class="btn btn-danger"  data-toggle="collapse" data-target="#bt8">แจ้งเรื่องกลับ</button>     
                     </div> 
                      <br />   
                      <div id="bt8" class="collapse" >
                             <div class="alert alert-dismissable alert-danger"> 
                   <div>บันทึกการปฏิบัติและ หมายเหตุ (แจ้งเรื่องกลับ)</div> 
                   <div> <textarea class="form-control" rows="3" cols="20" name="S1"></textarea></div>
                    <br />
                    <div> <asp:FileUpload ID="FileUpload8" runat="server" />    </div>
                    <div>ไฟล์แนบ</div>
                    <br />
                   <div class ="text-right" ><asp:Button ID="Button25" class="btn btn-primary" runat="server" Text="ตกลง" /> 
                    </div>
                  
               </div>
                      </div>   
                                            
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
                                   </div>
                                </div>
                            </div> 


                         </div>
                    </div>

                                      <div class="panel panel-default">
                      <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse"  href="#Collapse88"> ขั้นตอนที่ 8 [เสร็จสิ้น]</a></h4></div>
                         <div id="Collapse88" class="panel-collapse collapse">
                               <div class="panel-body">
                              <div class="panel panel-default">
                                 <div class="panel-heading"> <strong> เจ้าหน้าที่บันทึกสรุปผลการดำเนินงาน เสร็จสิ้น</strong></div>
                                    <div class="panel-body">       
                                         <div class="panel-body">       
                     <div><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong> </div>    
                     <div><textarea class="form-control" rows="10"></textarea> </div>
                     <br />
                     <div>    </div>                           
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList8" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>รายงานครั้งที่ 1</asp:ListItem>
                         <asp:ListItem>รายงานครั้งที่ 2</asp:ListItem>
                         <asp:ListItem>รายงานครั้งที่ 3</asp:ListItem>
                         <asp:ListItem>รายงานครั้งที่ 4</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button20" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button26" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     &nbsp;
                      <button type="button" id="button9" class="btn btn-danger"  data-toggle="collapse" data-target="#bt9">แจ้งเรื่องกลับ</button>     
                     </div> 
                      <br />   
                      <div id="bt9" class="collapse" >
                             <div class="alert alert-dismissable alert-danger"> 
                   <div>บันทึกการปฏิบัติและ หมายเหตุ (แจ้งเรื่องกลับ)</div> 
                   <div> <textarea class="form-control" rows="3" cols="20" name="S1"></textarea></div>
                    <br />
                    <div> <asp:FileUpload ID="FileUpload2" runat="server" />    </div>
                    <div>ไฟล์แนบ</div>
                    <br />
                   <div class ="text-right" ><asp:Button ID="Button27" class="btn btn-primary" runat="server" Text="ตกลง" /> 
                    </div>
                  
               </div>
                      </div>   
                                            
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
                                   </div>
                                </div>
                            </div> 


                         </div>
                    </div> 

                   <div class="panel panel-default">
                      <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse"  href="#Collapse16"> กำหนดคุณสมบัติทั่วไป</a></h4></div>
                         <div id="Collapse16" class="panel-collapse collapse">
                           <div class="panel-body">
                              <div class="panel panel-default">
                                                     <div class="panel panel-default">
                      <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse"  href="#Collapse18"> การขอเงินทุนสนับสนุนค่าตีพิมพ์</a></h4></div>
                         <div id="Collapse18" class="panel-collapse collapse">
                           <div class="panel-body">
                              <div class="panel panel-default">
                                 <div class="panel-heading"> <strong> XXXXXXXXXXXXXXXXXXXX</strong></div>
                                    <div class="panel-body">       
                                       <div class="panel-body">       
                                          <br />
                                          <div class ="text-center"><h1>Phase ที่ 2</h1></div>
                                          <div></div>
                                          <div></div>
                                               




                                       </div>
                                   </div>
                                </div>
                            </div>
                         </div>
                    </div>

                   <div class="panel panel-default">
                      <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse"  href="#Collapse19"> การขอรับเงินรางวัล</a></h4></div>
                         <div id="Collapse19" class="panel-collapse collapse">
                           <div class="panel-body">
                              <div class="panel panel-default">
                                 <div class="panel-heading"> <strong> XXXXXXXXXXXXXXXXXXXX</strong></div>
                                    <div class="panel-body">       
                                       <div class="panel-body">       
                                           <br />
                                          <div class ="text-center"><h1>Phase ที่ 2</h1></div>
                                          <div></div>
                                          <div></div>
                                       </div>
                                   </div>
                                </div>
                            </div>
                         </div>
                    </div>

                   <div class="panel panel-default">
                      <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse"  href="#Collapse20"> การขอเงินทุนเพื่อการเดินทางและนำเสนอผลงาน</a></h4></div>
                         <div id="Collapse20" class="panel-collapse collapse">
                           <div class="panel-body">
                              <div class="panel panel-default">
                                 <div class="panel-heading"> <strong> XXXXXXXXXXXXXXXXXXXX</strong></div>
                                    <div class="panel-body">       
                                       <div class="panel-body">       
                                           <br />
                                          <div class ="text-center"><h1>Phase ที่ 2</h1></div>
                                          <div></div>
                                          <div></div>
                                       </div>
                                   </div>
                                </div>
                            </div>
                         </div>
                    </div>

                   <div class="panel panel-default">
                      <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse"  href="#Collapse21"> ขอแจ้งจดทรัพย์สินทางปัญญา (จดลิขสิทธิ์/สิทธิบัตร/อนุสิทธิบัตร)</a></h4></div>
                         <div id="Collapse21" class="panel-collapse collapse">
                           <div class="panel-body">
                              <div class="panel panel-default">
                                 <div class="panel-heading"> <strong> XXXXXXXXXXXXXXXXXXXX</strong></div>
                                    <div class="panel-body">       
                                       <div class="panel-body">       
                                           <br />
                                          <div class ="text-center"><h1>Phase ที่ 2</h1></div>
                                          <div></div>
                                          <div></div>
                                       </div>
                                   </div>
                                </div>
                            </div>
                         </div>
                    </div>

                   <div class="panel panel-default">
                      <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse"  href="#Collapse22"> การกำหนดคุณสมบัติเฉพาะด้าน</a></h4></div>
                         <div id="Collapse22" class="panel-collapse collapse">
                            <div class="panel-body">
                              <div class="panel panel-default">
                                                        <div class="panel panel-default">
                     <div class="panel-heading"><h4>กำหนด คุณสมบัติเฉพาะ ผลงานวิจัยที่ได้รับการจดทะเบียน</h4></div>
                      <div class="panel-body">       
                           <div class="row">
                                 <div class="col-md-4"> <span class="glyphicon glyphicon-flag"></span> สิทธิบัตร : <asp:CheckBox ID="CheckBox1" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> อนุสิทธิบัตร : <asp:CheckBox ID="CheckBox2" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ความลับทางการค้า : <asp:CheckBox ID="CheckBox3" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เครื่องหมายการค้า : <asp:CheckBox ID="CheckBox4" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> สิ่งบ่งชี้ทางภูมิศาสตร์ : <asp:CheckBox ID="CheckBox5" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> แผงผังระบบวงจรรวม : <asp:CheckBox ID="CheckBox6" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> คุ้มครองพันธุ์พืช : <asp:CheckBox ID="CheckBox7" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ภูมิปัญญาท้องถิ่น : <asp:CheckBox ID="CheckBox8" runat="server" /></div>
                           </div>
  
                      </div>
                   </div>  
                    <br />
                    <div class="panel panel-default">
                     <div class="panel-heading"><h4>กำหนด คุณสมบัติเฉพาะ ผลงานวิจัยที่อยู่ระหว่างดำเนินการยืนขอจดทะเบียน</h4></div>
                      <div class="panel-body">       
                           <div class="row">
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> สิทธิบัตร : <asp:CheckBox ID="CheckBox15" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> อนุสิทธิบัตร : <asp:CheckBox ID="CheckBox16" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ความลับทางการค้า : <asp:CheckBox ID="CheckBox17" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เครื่องหมายการค้า : <asp:CheckBox ID="CheckBox18" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> สิ่งบ่งชี้ทางภูมิศาสตร์ : <asp:CheckBox ID="CheckBox19" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> แผงผังระบบวงจรรวม : <asp:CheckBox ID="CheckBox20" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> คุ้มครองพันธุ์พืช : <asp:CheckBox ID="CheckBox21" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ภูมิปัญญาท้องถิ่น : <asp:CheckBox ID="CheckBox22" runat="server" /></div>
                           </div>
  
                      </div>
                   </div>
                    <br />
                    <div class="panel panel-default">
                    <div class="panel-heading"><h4>กำหนด คุณสมบัติเฉพาะอื่นๆ</h4></div>
                      <div class="panel-body">       
                           <div class="row">
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ตีพิมพ์ในวารสารวิชาการระดับนานาชาติ ที่เป็นที่ยอมรับต่อจำนวนบุคลากรสายวิชาการในการแต่ละปีปฏิทิน : <asp:CheckBox ID="CheckBox29" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ตีพิมพ์ในวารสารวิชาการระดับนานาชาติ : <asp:CheckBox ID="CheckBox30" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นดัชนีการอ้างอิงต่อบทความวิจัยในแต่ละปีปฏิทิน : <asp:CheckBox ID="CheckBox31" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นดัชนีการอ้างอิง : <asp:CheckBox ID="CheckBox32" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> สิ่งบ่งชี้ทางภูมิศาสตร์ : <asp:CheckBox ID="CheckBox33" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> แผงผังระบบวงจรรวม : <asp:CheckBox ID="CheckBox34" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> คุ้มครองพันธุ์พืช : <asp:CheckBox ID="CheckBox35" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ภูมิปัญญาท้องถิ่น : <asp:CheckBox ID="CheckBox36" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นโครงการวิจัยที่มีการถ่ายทอดเทคโนโลยีหรือองค์ความรู้ต่อภาครัฐ : <asp:CheckBox ID="CheckBox37" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นโครงการวิจัยที่มีการถ่ายทอดเทคโนโลยีหรือองค์ความรู้ต่อภาคเอกชน : <asp:CheckBox ID="CheckBox38" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นโครงการวิจัย/ผลงานวิจัย/ผลงานทางวิชาการที่ทำให้มหาวิทยาลัยมหิดลมีรายได้ : <asp:CheckBox ID="CheckBox39" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นผลงานวิจัยใหม่ที่นำไปสู่การปรับนโยบายการบริหารระดับส่วนงานกระทรวงหรือระดับประเทศและที่มีผลกระทบต่อสังคม : <asp:CheckBox ID="CheckBox40" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นดัชนีการอ้างอิง : <asp:CheckBox ID="CheckBox41" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> แสดงถึงประโยชน์จากผลกระทบของงานวิจัยต่อสังคมไทย/สังคม โลก (ในช่วง 5 ปีที่ผ่านมา) : <asp:CheckBox ID="CheckBox42" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นค่า h-index ของส่วนงาน : <asp:CheckBox ID="CheckBox57" runat="server" /></div>
                           </div>
  
                      </div>
                   </div> 
                   <br />
                    <div class="panel panel-default">
                     <div class="panel-heading"><h4>กำหนดคุณสมบัติเฉพาะ ทุน</h4></div>
                      <div class="panel-body">       
                           <div class="row">
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นเงินทุนวิจัยจากภายในมหาวิทยาลัย : <asp:CheckBox ID="CheckBox43" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เงินรายได้ส่วนงานที่เป็นทุนวิจัย : <asp:CheckBox ID="CheckBox44" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นเงินทุนวิจัยที่ได้รับจากหน่วยงานภาครัฐภายในประเทศ : <asp:CheckBox ID="CheckBox45" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นเงินทุนวิจัยที่ได้รับจากหน่วยงานภาครัฐต่างประเทศ : <asp:CheckBox ID="CheckBox46" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นเงินทุนวิจัยที่ได้รับจากภาคเอกชนภายในประเทศ : <asp:CheckBox ID="CheckBox47" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> เป็นเงินทุนวิจัยที่ได้รับจากภาคเอกชนต่างประเทศ : <asp:CheckBox ID="CheckBox48" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> คุ้มครองพันธุ์พืช : <asp:CheckBox ID="CheckBox49" runat="server" /></div>
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> ภูมิปัญญาท้องถิ่น : <asp:CheckBox ID="CheckBox50" runat="server" /></div>
                                 
                           </div>
  
                      </div>
                   </div>   
                    <br />
                    <div class="panel panel-default">
                     <div class="panel-heading"><h4>กำหนดคุณสมบัติเฉพาะ ประเภทการตีพิมพ์</h4></div>
                      <div class="panel-body">       
                           <div class="row">
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> บทความตีพิมพ์ในวารสารวิชาการระดับนานาชาติ : <asp:DropDownList ID="DropDownList7" class="form-control" runat="server"  placeholder="ชื่อวารสาร"> </asp:DropDownList></div>
                                
                           </div>
  
                      </div>
                   </div>    
                                </div>
                            </div>
                         </div>
                         </div>
                    </div>

                                </div>
                            </div>
                         </div>
                
                </div>
             </div>
         </div>
      </div>
   </div>                                
</div>



</form>
</body>
</html>
