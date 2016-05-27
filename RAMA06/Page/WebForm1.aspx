<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="RAMA06.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 
  <%--<link href="../../Content/bootstrap.css" rel="stylesheet" />--%>
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

        .auto-style2 {
            height: 22px;
        }

        .auto-style3 {
            width: 100%;
        }

    </style>
</head>
<body>
<form id="form1" runat="server">
 <div class="container">
<h2>ข้อมูลโครงการวิจัย</h2>
      <div class ="text-right">
      <button type="button" id="button1" class="btn btn-danger"  data-toggle="collapse" data-target="#bt1"><span class="glyphicon glyphicon-remove"></span> ยกเลิกโครงการวิจัย</button>     
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
<hr />
 <div class ="text-right">    
     <button type="button" id="button2" class="btn btn-primary btn-lg"  data-toggle="collapse" data-target="#bt2"><span class="glyphicon glyphicon-user"></span> แจ้งข้อมูลการวิจัย</button>
     <button type="button" id="button3" class="btn btn-primary btn-lg"  data-toggle="collapse" data-target="#bt3">ข้อมูลการวิจัย</button>
     <button type="button" id="button4" class="btn btn-primary btn-lg"  data-toggle="collapse" data-target="#bt4">ข้อมูลนักวิจัย</button>
     <button type="button" id="button5" class="btn btn-primary btn-lg"  data-toggle="collapse" data-target="#bt5">ประวัติการติดต่อสื่อสาร <span class="badge">1</span></button>
 </div>
<br />
   
     

   <div id="bt2" class="collapse">        
<%--    <div class="alert alert-dismissable alert-danger">   --%> 
      <table class="nav-justified">
            <tr>
                <td class="auto-style3">        
                    <h2>แจ้งข้อมูลเพื่อการดำเนินการ</h2></td>
                <td>        
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">        
       <div class="alert alert-dismissable alert-danger">
           <h3>ID : 182</h3>
           <h3>วันที่ : 17 เมษายน 2559 14:45:25</h3>
           <h3>เรียน : ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</h3>
           <h3>เรื่อง :
           <asp:TextBox ID="TextBox3" runat="server" Width="435px" Height="24px"></asp:TextBox>
           </h3>
           <p><asp:TextBox ID="TextBox2" runat="server" Height="200px" TextMode="MultiLine" Width="600px"></asp:TextBox>
            </p>
               <br /> 
               <asp:FileUpload ID="FileUpload2" runat="server" />
                <br />      
          <h3>ไฟล์แนบ</h3>           
             <p><asp:HyperLink ID="HyperLink28" runat="server"> 1. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
            <p><asp:HyperLink ID="HyperLink29" runat="server">2. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
            <p><asp:HyperLink ID="HyperLink30" runat="server">3. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
            <br />
            <p>(ผู้แจ้ง : นางสาวสรีพร จักทองมี โทร. 2080 สนง.วิจัยฯ)</p>
           <br />
           <asp:Button ID="Button2" class="btn btn-primary btn-lg" runat="server" Text="ยึนยันการส่งข้อมูล" />
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


    <%--</div>--%>  
  </div>
   
   <div id="bt3" class="collapse">    
       <div class="alert alert-dismissable alert-danger">
           

           demo2


       </div>
  </div>    

   <div id="bt4" class="collapse">    
       <div class="alert alert-dismissable alert-danger">
           

           demo3


       </div>
  </div>  

   <div id="bt5" class="collapse">    
       <div class="alert alert-dismissable alert-danger">
           

           demo4


       </div>
  </div>  

<br />
<div class="panel panel-primary">
   <div class="panel-body">        
         <div class="text-center">
            <ol class="progtrckr" data-progtrckr-steps="6">
            <li class="progtrckr-done">1. ส่งโครงการวิจัย</li>
            <li class="progtrckr-done">2. เจ้าหน้าที่รับเรื่อง</li>
            <li class="progtrckr-done">3. อนุมัติทำวิจัย</li>
            <li class="progtrckr-done">4. รายงานความก้าวหน้า</li>
            <li class="progtrckr-done">5. ส่งเอกสารฉบับสมบูรณ์</li>
            <li class="progtrckr-done">6. เสร็จสิ้น</li>
        </ol>   
<br />
         </div>
            <br />
              <div class ="text-center">
                        <asp:Image ID="Image1" runat="server" Height="220px" Width="196px" ImageUrl="~/data/001.jpg" />
                    </div>
                    <div class ="text-center">
                            ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล
                        </div>
                        <div class ="text-center">
                            E-mail: Kriangkrai_pipit@mahidol.ac.th</div>
                        <div class ="text-center">
                            เบอร์โทร : 083-0110-273</div>
                        <div class ="text-center">
                            ตำแหน่ง : อาจารย์
                        </div>
                        <div class ="text-center">
                            สังกัด : ภาควิชาอายุรศาสตร์
                        </div>
             <br />
             <hr />
<h3>รายละเอียดโครงการ</h3>
              <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">ส่งโครงการวิจัย 1 <span class="glyphicon glyphicon-arrow-right"></span></a></li>
                <li><a data-toggle="tab" href="#menu1">เจ้าหน้าที่รับเรื่อง 2 <span class="glyphicon glyphicon-arrow-right"></span></a></li>
                <li><a data-toggle="tab" href="#menu3">อนุมัติทำวิจัย 3 <span class="glyphicon glyphicon-arrow-right"></span></a></li>
                <li><a data-toggle="tab" href="#menu4">รายงานความก้าวหน้า 4 <span class="glyphicon glyphicon-arrow-right"></span></a></li>
                <li><a data-toggle="tab" href="#menu5">ส่งเอกสารฉบับสมบูรณ์ 5 <span class="glyphicon glyphicon-arrow-right"></span></a></li>
                <li><a data-toggle="tab" href="#menu6">เสร็จสิ้น 6 <span class="glyphicon glyphicon-asterisk"></span></a></li>
                <li><a data-toggle="tab" href="#menu7">คุณสมบัติเฉพาะ</a></li>
              </ul>

              <div class="tab-content">
             <div id="home" class="tab-pane fade in active">             
             <div class="panel panel-default">
             <div class="panel-heading">
            <br />
                 <h4>ขั้นตอนที่ 1 : ส่งโครงการวิจัย </h4></div>
              <div class="panel-body">       
                   <div> 
<div> 
     <br /> 
             <label class="control-label" for="inputLarge">รหัสโครงการ : XXXXXXXXXXX</label></div>
            <br /> 
             <label class="control-label" for="inputLarge">ชื่อโครงการวิจัย (Thai) :</label></div>
             <div> <p>โครงการจัดทำคุณลักษณะที่เหมาะสมและมีประสิทธิภาพของสายสวนเพื่อขยายหลอดเลือดโคโรนารี่ด้วยบอลลูนและขดลวดค้ำยันผนังหลอดเลือด</p> </div>
             <br />
             <div> 
                   <label class="control-label" for="inputLarge">ชื่อโครงการวิจัย (Eng) :</label></div>
             <div> <p>Integrating of Health Care System in Community Development and Expertise
                    Development for the Clinical Instructors by Practicing in Community: A Longitudinal Study
                    2005-2007</p> 
             </div>      
             <br />
             <div> 
                   <label class="control-label" for="inputLarge">รายชื่อผู้ร่วมโครงการวิจัย :</label>
                     <p>1. ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล (ผู้วิจัยหลัก) (ร้อยละการมีส่วนร่วม:40) </p> 
                     <p>2. ดร.ภญ.ศิตาพร ยังคง (ผู้วิจัร่วม) (ร้อยละการมีส่วนร่วม:10) </p> 
                     <p>3. นายทรงยศ พิลาสันต์ (ผู้วิจัร่วม) (ร้อยละการมีส่วนร่วม:10) </p> 
                     <p>4. ภญ.ศตนันทน์ มณีอ่อน (ผู้วิจัร่วม) (ร้อยละการมีส่วนร่วม:10) </p> 
                     <p>5. ผศ.นพ.สิท ดวงทิพย์สิริกุล (ผู้วิจัร่วม) (ร้อยละการมีส่วนร่วม:20) </p> 
                     <p>6. ผศ.นพ.สุรชัน ทิพย์สิริกุล (ผู้วิจัร่วม) (ร้อยละการมีส่วนร่วม:10) </p> 
             </div>
             <br />
                     <div> 
                   <label class="control-label" for="inputLarge">ประเภทโครงการวิจัย :</label>
                   <p>โครงการวิจัยหลัก</p> 
             </div>
             <br />

              <div> 
                   <label class="control-label" for="inputLarge">โครงการวิจัยอยู่ในกุล่มโรคใด :</label>
                   <p>โรคหัวใจและหลอดเลือด</p> 
             </div>
             <br />
             <div> 
                   <label class="control-label" for="inputLarge">โครงการวิจัยเกี่ยวกับ (คลินิก/ไม่คลินิก) :</label>
                   <p>คลินิก</p> 
             </div>
             <br />
                     <div> 
                   <label class="control-label" for="inputLarge"> ประเภททุน :</label>
                   <p>ทุนรายได้คณะ</p> 
             </div>
             <br />
             <div> 
                   <label class="control-label" for="inputLarge"> ชื่อทุน :</label>
                   <p>ทุน Biomedical research การวิจัยทางคลินกทางการแพทย์และพยาบาล</p> 
             </div>
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
                   </div>   
                   </div>
             </div>
         </div>

         <div id="menu1" class="tab-pane fade">              
            <div class="panel panel-default">
             <div class="panel-heading">
               <br />    

         <div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Collapsible Group 1</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Collapsible Group 2</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Collapsible Group 3</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
      </div>
    </div>
  </div> 









            <div class="panel panel-default">
             <div class="panel-heading"><h4>ขั้นตอนที่ 2 : เจ้าหน้าที่รับเรื่อง </h4> </div>
                 <div class="panel-body">       
                     <div><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong> </div>    
                     <div><textarea class="form-control" rows="3"></textarea> </div>    
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList1" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button20" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button21" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     </div>  
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
             </div>
                       
              <div class="panel panel-default">
             <div class="panel-heading"><h4>2.1 : พิจารณาจริยธรรม EC (ถ้ามี)</h4></div>
              <div class="panel-body">              
              <div class="panel panel-default">
                  <div class="panel-heading">กำหนดกรรมการพิจารณาจริยธรรม (EC)
                      <asp:Button ID="Button3"  class="btn btn-primary" runat="server" Text="เพิ่มกรรมการ" />
                      </div>
                  <div class="panel-body">       
                      <div>
                          <table class="nav-justified">
                              <tr>
                                  <td>ลำดับ</td>
                                  <td><strong>รายชื่อกรรมการพิจารณาจริยธรรม (EC)</strong></td>
                                  <td>สถานะ</td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>1</td>
                                  <td><strong>รศ. จินตนันท์ ศรีสุยิ่ง</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink48" data-toggle="collapse" data-target="#btReturn" runat="server">ผ่าน</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>2</td>
                                  <td><strong>ศ.เจนภพ อธิรัตนชัย</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink49" data-toggle="collapse" data-target="#btReturn" runat="server">ไม่ผ่าน</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>3</td>
                                  <td><strong>ศ.สุริเยนทร์ แดงทองดี</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink47" data-toggle="collapse" data-target="#btReturn" runat="server">ไม่รับพิจารณา</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>4</td>
                                  <td><strong>ผศ.ศิริมงคล พันหว้า</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink50" data-toggle="collapse" data-target="#btReturn" runat="server">...</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              </table>       
                       </div> 
             </div>
                    <div id="btReturn" class="collapse">  
                          <div>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</div>
                          <div>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx<asp:Button ID="Button34"  class="btn btn-primary" runat="server" Text="ส่งพิจารณาใหม่" />
                          </div>                      
                   </div>  

              </div>
        
              <div class="panel panel-default">
                  <div class="panel-heading"> <strong> บันทึกผล การพิจารณาจริยธรรม (EC) โดย : รศ. จินตนันท์ ศรีสุยิ่ง</strong>
                      </div>
                     <div class="panel-body">       
                 <div class="panel-body">       
                     <div><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong> </div>    
                     <div><textarea class="form-control" rows="3"></textarea> </div>    
                     <br />
                     <div class ="text-right"> <asp:FileUpload ID="FileUpload1" runat="server" />    </div>
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList3" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button6" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button7" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     </div>  
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
              </div>

             </div>
            
              <div class="panel panel-default">
                  <div class="panel-heading"> <strong> บันทึกผล การพิจารณาจริยธรรม (EC) โดย : ศ.เจนภพ อธิรัตนชัย</strong>
                      </div>
                     <div class="panel-body">       
                 <div class="panel-body">       
                     <div><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong> </div>    
                     <div><textarea class="form-control" rows="3"></textarea> </div>    
                     <br />
                     <div class ="text-right"> <asp:FileUpload ID="FileUpload3" runat="server" />    </div>
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList9" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button22" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button23" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     </div>  
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
              </div>

             </div>
      
              <div class="panel panel-default">
                  <div class="panel-heading"> <strong> บันทึกผล การพิจารณาจริยธรรม (EC) โดย : ศ.สุริเยนทร์ แดงทองดี</strong>
                      </div>
                     <div class="panel-body">       
                 <div class="panel-body">       
                     <div><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong> </div>    
                     <div><textarea class="form-control" rows="3"></textarea> </div>    
                     <br />
                     <div class ="text-right"> <asp:FileUpload ID="FileUpload4" runat="server" />    </div>
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList10" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button24" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button25" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     </div>  
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
              </div>

             </div>
       
              <div class="panel panel-default">
                  <div class="panel-heading"> <strong> บันทึกผล การพิจารณาจริยธรรม (EC) โดย : ผศ.ศิริมงคล พันหว้า</strong>
                      </div>
                     <div class="panel-body">       
                 <div class="panel-body">       
                     <div><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong> </div>    
                     <div><textarea class="form-control" rows="3"></textarea> </div>    
                     <br />
                     <div class ="text-right"> <asp:FileUpload ID="FileUpload5" runat="server" />    </div>
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList11" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button26" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button27" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     </div>  
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
              </div>

             </div>
            </div>                  
         </div> 

              <div class="panel panel-default">
             <div class="panel-heading"><h4>2.2 : พิจารณา ทุนต่างๆ (ถ้ามี)</h4></div>
              <div class="panel-body">              
              <div class="panel panel-default">
                  <div class="panel-heading">กำหนดกรรมการพิจารณาทุน
                      <asp:Button ID="Button8"  class="btn btn-primary" runat="server" Text="เพิ่มกรรมการ" />
                      </div>
                  <div class="panel-body">       
                      <div>
                          <table class="nav-justified">
                              <tr>
                                  <td>ลำดับ</td>
                                  <td><strong>รายชื่อกรรมการพิจารณาทุน</strong></td>
                                  <td>สถานะ</td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>1</td>
                                  <td><strong>รศ. จินตนันท์ ศรีสุยิ่ง</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink51" data-toggle="collapse" data-target="#btReturn" runat="server">ผ่าน</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>2</td>
                                  <td><strong>ศ.เจนภพ อธิรัตนชัย</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink52" data-toggle="collapse" data-target="#btReturn" runat="server">ไม่ผ่าน</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>3</td>
                                  <td><strong>ศ.สุริเยนทร์ แดงทองดี</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink53" data-toggle="collapse" data-target="#btReturn" runat="server">ไม่รับพิจาณา</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              <tr>
                                  <td>4</td>
                                  <td><strong>ผศ.ศิริมงคล พันหว้า</strong></td>
                                  <td>
                                      <asp:HyperLink ID="HyperLink54" data-toggle="collapse" data-target="#btReturn" runat="server">...</asp:HyperLink>
                                  </td>
                                  <td>ลบ</td>
                              </tr>
                              </table>


                      </div> 
           </div>
              </div>
        
              <div class="panel panel-default">
                  <div class="panel-heading"> <strong> บันทึกผล การพิจารณาทุน โดย : รศ. จินตนันท์ ศรีสุยิ่ง</strong>
                      </div>
                     <div class="panel-body">       
                 <div class="panel-body">       
                     <div><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong> </div>    
                     <div><textarea class="form-control" rows="3"></textarea> </div>    
                     <br />
                     <div class ="text-right"> <asp:FileUpload ID="FileUpload6" runat="server" />    </div>
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList4" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button9" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button10" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     </div>  
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
              </div>

             </div>
            
              <div class="panel panel-default">
                  <div class="panel-heading"> <strong> บันทึกผล การพิจารณาทุน โดย : ศ.เจนภพ อธิรัตนชัย</strong>
                      </div>
                     <div class="panel-body">       
                 <div class="panel-body">       
                     <div><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong> </div>    
                     <div><textarea class="form-control" rows="3"></textarea> </div>    
                     <br />
                     <div class ="text-right"> <asp:FileUpload ID="FileUpload7" runat="server" />    </div>
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList12" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button28" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button29" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     </div>  
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
              </div>

             </div>
      
              <div class="panel panel-default">
                  <div class="panel-heading"> <strong> บันทึกผล การพิจารณา โดย : ศ.สุริเยนทร์ แดงทองดี</strong>
                      </div>
                     <div class="panel-body">       
                 <div class="panel-body">       
                     <div><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong> </div>    
                     <div><textarea class="form-control" rows="3"></textarea> </div>    
                     <br />
                     <div class ="text-right"> <asp:FileUpload ID="FileUpload8" runat="server" />    </div>
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList13" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button30" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button31" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     </div>  
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
              </div>

             </div>
       
              <div class="panel panel-default">
                  <div class="panel-heading"> <strong> บันทึกผล การพิจารณา โดย : ผศ.ศิริมงคล พันหว้า</strong>
                      </div>
                     <div class="panel-body">       
                 <div class="panel-body">       
                     <div><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong> </div>    
                     <div><textarea class="form-control" rows="3"></textarea> </div>    
                     <br />
                     <div class ="text-right"> <asp:FileUpload ID="FileUpload9" runat="server" />    </div>
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList14" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button32" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button33" class="btn btn-primary" runat="server" Text="บันทึก" /> 
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
            </div>
                <div id="menu3" class="tab-pane fade">
            <div class="panel panel-default">
             <div class="panel-heading"><h4>ขั้นตอนที่ 3 : อนุมัติทำวิจัย</h4> </div>
              <div class="panel-body">       
                   <div> 
                        
                          <table class="nav-justified">
                              <tr>
                                  <td>นาย อภิเดช พรสังสีหากร</td>
                                  <td><strong>บันทึกสรุปผลการพิจาณา</strong></td>
                              </tr>
                              <tr>
                                  <td>หน่วยงาน โทร : 1025</td>
                                  <td rowspan="4">
                                      <asp:TextBox ID="TextBox6" runat="server" Height="80px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                      &nbsp;&nbsp; 
                                  </td>
                              </tr>
                              <tr>
                                  <td>สนง.วิจัย และนวัมตกรรม&nbsp;&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>วันที่ 7 มีนาคม 2559 14:45:30</td>
                                  <td><strong>สถานะ :  
                                      <asp:DropDownList ID="DropDownList5" runat="server">
                                          <asp:ListItem></asp:ListItem>
                                          <asp:ListItem>อนุมัติการทำวิจัย</asp:ListItem>
                                          <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                                          <asp:ListItem>ผ่านแบบมีเงื่อนไข</asp:ListItem>
                                      </asp:DropDownList>
                                      </strong></td>
                              </tr>
                              <tr>
                                  <td>ผู้บันทึก</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>
                                   <asp:Button ID="Button11"  class="btn btn-primary" runat="server" Text="แก้ไข" />
                                   <asp:Button ID="Button12"  class="btn btn-primary" runat="server" Text="บันทึก" />
                                  </td>
                              </tr>
                          </table>

                   </div>
                 <br />

             </div>
           </div>
                </div>
                <div id="menu4" class="tab-pane fade">
               <div class="panel panel-default">
             <div class="panel-heading"><h4>ขั้นตอนที่ 4 : รายงานความก้าวหน้า</h4> </div>
              <div class="panel-body">       
                   <div> 
                 
                          <table class="nav-justified">
                              <tr>
                                  <td>นาย อภิเดช พรสังสีหากร</td>
                                  <td><strong>บันทึกการปฏิบัติ และหมายเหตุ</strong></td>
                              </tr>
                              <tr>
                                  <td>หน่วยงาน โทร : 1025</td>
                                  <td rowspan="4">
                                      <asp:TextBox ID="TextBox7" runat="server" Height="80px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                      &nbsp;&nbsp; 
                                  </td>
                              </tr>
                              <tr>
                                  <td>สนง.วิจัย และนวัมตกรรม&nbsp;&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>วันที่ 7 มีนาคม 2559 14:45:30</td>
                                  <td><strong>สถานะ :  
                                      <asp:DropDownList ID="DropDownList6" runat="server">
                                          <asp:ListItem></asp:ListItem>
                                          <asp:ListItem>รายงานความก้าวหน้า</asp:ListItem>
                                          <asp:ListItem>ยังไม่รายงาน</asp:ListItem>
                                      </asp:DropDownList>
                                      </strong></td>
                              </tr>
                              <tr>
                                  <td>ผู้บันทึก</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>
                                   <asp:Button ID="Button13"  class="btn btn-primary" runat="server" Text="แก้ไข" />
                                   <asp:Button ID="Button14"  class="btn btn-primary" runat="server" Text="บันทึก" />
                                  </td>
                              </tr>
                          </table>

                   </div>
            

             </div>
           </div>
                </div>
                <div id="menu5" class="tab-pane fade">
               <div class="panel panel-default">
             <div class="panel-heading"><h4>ขั้นตอนที่ 5 : ส่งเอกสารฉบับสมบูรณ์</h4></div>
              <div class="panel-body">       
                   <div> 
                 
                          <table class="nav-justified">
                              <tr>
                                  <td>นาย อภิเดช พรสังสีหากร</td>
                                  <td><strong>บันทึกการปฏิบัติ และหมายเหตุ</strong></td>
                              </tr>
                              <tr>
                                  <td>หน่วยงาน โทร : 1025</td>
                                  <td rowspan="4">
                                      <asp:TextBox ID="TextBox8" runat="server" Height="80px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                      &nbsp;&nbsp; 
                                  </td>
                              </tr>
                              <tr>
                                  <td>สนง.วิจัย และนวัมตกรรม&nbsp;&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>วันที่ 7 มีนาคม 2559 14:45:30</td>
                                  <td><strong>สถานะ :  
                                      <asp:DropDownList ID="DropDownList7" runat="server">
                                          <asp:ListItem></asp:ListItem>
                                          <asp:ListItem>ส่งเอกสารฉบับสมบูรณ์</asp:ListItem>
                                          <asp:ListItem>ยังไม่ส่งเอกสาร</asp:ListItem>
                                      </asp:DropDownList>
                                      </strong></td>
                              </tr>
                              <tr>
                                  <td>ผู้บันทึก</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>
                                   <asp:Button ID="Button15"  class="btn btn-primary" runat="server" Text="แก้ไข" />
                                   <asp:Button ID="Button16"  class="btn btn-primary" runat="server" Text="บันทึก" />
                                  </td>
                              </tr>
                          </table>

                   </div>
                 <br />

             </div>
           </div> 
                </div>
                <div id="menu6" class="tab-pane fade">
                     <div class="panel panel-default">
             <div class="panel-heading"><h4>ขั้นตอนที่ 6 : เสร็จสิ้น</h4></div>
              <div class="panel-body">       
                   <div> 
                      
                          <table class="nav-justified">
                              <tr>
                                  <td>นาย อภิเดช พรสังสีหากร</td>
                                  <td><strong>บันทึกการปฏิบัติ และหมายเหตุ</strong></td>
                              </tr>
                              <tr>
                                  <td>หน่วยงาน โทร : 1025</td>
                                  <td rowspan="4">
                                      <asp:TextBox ID="TextBox9" runat="server" Height="80px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                      &nbsp;&nbsp; 
                                  </td>
                              </tr>
                              <tr>
                                  <td>สนง.วิจัย และนวัมตกรรม&nbsp;&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>วันที่ 7 มีนาคม 2559 14:45:30</td>
                                  <td><strong>สถานะ :  
                                      <asp:DropDownList ID="DropDownList8" runat="server">
                                          <asp:ListItem></asp:ListItem>
                                          <asp:ListItem>เสร็จสิ้น</asp:ListItem>
                                          <asp:ListItem>ยังไม่เสร็จสิ้น</asp:ListItem>
                                      </asp:DropDownList>
                                      </strong></td>
                              </tr>
                              <tr>
                                  <td>ผู้บันทึก</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>
                                   <asp:Button ID="Button17"  class="btn btn-primary" runat="server" Text="แก้ไข" />
                                   <asp:Button ID="Button18"  class="btn btn-primary" runat="server" Text="บันทึก" />
                                  </td>
                              </tr>
                          </table>

                   </div>
              </div>
           </div>  
                </div>
                <div id="menu7" class="tab-pane fade">
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
                                 <div class="col-md-4"><span class="glyphicon glyphicon-flag"></span> บทความตีพิมพ์ในวารสารวิชาการระดับนานาชาติ : <asp:DropDownList ID="DropDownList2" class="form-control" runat="server"  placeholder="ชื่อวารสาร"> </asp:DropDownList></div>
                                
                           </div>
  
                      </div>
                   </div>      

                </div>
              </div>
            </div>
        

       <hr />              
                                                        
     </div>
<div class="panel panel-primary">
    <div class="panel-body">   
           <asp:HyperLink ID="HyperLink7" runat="server">View</asp:HyperLink>
     </div>
</div>
</div>
</form>
</body>
</html>
