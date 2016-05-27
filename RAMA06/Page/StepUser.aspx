<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="StepUser.aspx.vb" Inherits="RAMA06.StepUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 
    <link href="../../Content/bootstrap.css" rel="stylesheet" />

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

    </style>
</head>
<body>
<form id="form1" runat="server">
 <div class="container">
        <div class="page-header">
             <h1>นักวิจัย</h1>
        </div>
   <br />
   <button type="button" class="btn btn-info"  data-toggle="collapse" data-target="#demo"><span class="glyphicon glyphicon-user"></span><span class="badge">1</span></button>
  <br />
   <div id="demo" class="collapse">        
<%--    <div class="alert alert-dismissable alert-danger">   --%> 
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


    <%--</div>--%>  
  </div>

 <%--   <h2>แจ้งข้อมูลเพื่อการดำเนินการ</h2>  
   <div class="alert alert-dismissable alert-danger">  
           <h3>เรื่อง : แจ้งข้อมูลเพื่อแก้ไขข้อมูลเพื่อการการวิจัยให้ถูกต้อง</h3>
           <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
           <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
           <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
           <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
           <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
           <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
           <h3>ไฟล์แนบ</h3>           
           <p><asp:HyperLink ID="HyperLink18" runat="server"> 1. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
            <p><asp:HyperLink ID="HyperLink19" runat="server">2. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
            <p><asp:HyperLink ID="HyperLink20" runat="server">3. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
            <p><asp:HyperLink ID="HyperLink21" runat="server">4. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
            <p><asp:HyperLink ID="HyperLink22" runat="server">5. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
         </div> 
    <h2>กรุณาส่งข้อมูลกลับ</h2>   
   <div class="alert alert-dismissable alert-danger">       
       <p><asp:TextBox ID="TextBox12" runat="server" Height="150px" TextMode="MultiLine" Width="600px"></asp:TextBox></p>
       <br />
       <asp:FileUpload ID="FileUpload1" runat="server" />
       <br />
       <h3>ไฟล์แนบ</h3>           
       <p><asp:HyperLink ID="HyperLink33" runat="server"> 1. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
        <p><asp:HyperLink ID="HyperLink34" runat="server">2. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
        <p><asp:HyperLink ID="HyperLink35" runat="server">3. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
        <p><asp:HyperLink ID="HyperLink36" runat="server">4. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
        <p><asp:HyperLink ID="HyperLink37" runat="server">5. เอกสาร XXXXXXXXXXXXXXXXXXXXXXX </asp:HyperLink></p>
       <p class ="text-center ">          
          <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="ยึนยันการส่งข้อมูล" />
       </p>
   </div>--%>
<br />
<hr />
<div class ="text-right"> 
    <asp:HyperLink ID="HyperLink19" class="btn btn-primary btn-lg" runat="server" NavigateUrl="~/Page/MainRecord/HistoryCommunication.aspx" Target="_blank">ประวัติการติดต่อสื่อสาร/การส่งเอกสารเพิ่มเติม</asp:HyperLink>
</div>
 
<br />

<div class="panel panel-primary">
   <div class="panel-body">        
         <div class="text-center">
            <ol class="progtrckr" data-progtrckr-steps="6">
            <li class="progtrckr-done">1. ส่งโครงการวิจัย</li>
            <li class="progtrckr-done">2. เจ้าหน้าที่รับเรื่อง</li>
            <li class="progtrckr-done">3. อนุมัติทำวิจัย</li>
            <li class="progtrckr-todo">4. รายงานความก้าวหน้า</li>
            <li class="progtrckr-todo">5. ส่งเอกสารฉบับสมบูรณ์</li>
            <li class="progtrckr-todo">6. เสร็จสิ้น</li>
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
<%-- <div class="container">--%>
              <h2>ข้อมูลโครงการวิจัย</h2>
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
                 <h4>ขั้นตอนที่ 2 : เจ้าหน้าที่รับเรื่อง </h4> </div>
              <div class="panel-body">       
                   <div> 

                          <table class="nav-justified">
                              <tr>
                                  <td>นาย อภิเดช พรสังสีหากร</td>
                                  <td><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong></td>
                              </tr>
                              <tr>
                                  <td>หน่วยงาน โทร : 1025</td>
                                  <td>&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>สนง.วิจัย วิชาการ และนวัมตกรรม&nbsp;&nbsp;</td>
                                  <td>&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>วันที่ 7 มีนาคม 2559 14:45:30</td>
                                  <td><strong>สถานะ : รับเรื่อง</strong></td>
                              </tr>
                              <tr>
                                  <td>ผู้บันทึก</td>
                                  <td>&nbsp;</td>
                              </tr>
                          </table>

                   </div> 

             </div>
           </div>
     
       <div  class ="text-center"></div>
               <div class="panel panel-default">
             <div class="panel-heading">
               <br />  
                 <h4>2.1 : พิจารณาจริยธรรม EC (ถ้ามี)</h4></div>
              <div class="panel-body">       
                   <div> 
                          <table class="nav-justified">
                              <tr>
                                  <td>นาย อภิเดช พรสังสีหากร</td>
                                  <td><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong></td>
                              </tr>
                              <tr>
                                  <td>หน่วยงาน โทร : 1025</td>
                                  <td>&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>สนง.วิจัย วิชาการ และนวัมตกรรม&nbsp;&nbsp;</td>
                                  <td>&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>วันที่ 7 มีนาคม 2559 14:45:30</td>
                                  <td><strong>สถานะ : ผ่าน</strong></td>
                              </tr>
                              <tr>
                                  <td>ผู้บันทึก</td>
                                  <td>&nbsp;</td>
                              </tr>
                          </table>

                   </div>
                 <br />

             </div>
           </div>

       <div  class ="text-center"></div>
               <div class="panel panel-default">
             <div class="panel-heading"><h4>2.2 : พิจารณา ทุนต่างๆ (ถ้ามี)</h4></div>
              <div class="panel-body">       
                   <div> 
                         
                          <table class="nav-justified">
                              <tr>
                                  <td>นาย อภิเดช พรสังสีหากร</td>
                                  <td><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong></td>
                              </tr>
                              <tr>
                                  <td>หน่วยงาน โทร : 1025</td>
                                  <td>&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>สนง.วิจัย วิชาการ และนวัมตกรรม&nbsp;&nbsp;</td>
                                  <td>&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>วันที่ 7 มีนาคม 2559 14:45:30</td>
                                  <td><strong>สถานะ : ผ่าน</strong></td>
                              </tr>
                              <tr>
                                  <td>ผู้บันทึก</td>
                                  <td>&nbsp;</td>
                              </tr>
                          </table>

                   </div>
                 <br />

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
                                  <td><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong></td>
                              </tr>
                              <tr>
                                  <td>หน่วยงาน โทร : 1025</td>
                                  <td>&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>สนง.วิจัย วิชาการ และนวัมตกรรม&nbsp;&nbsp;</td>
                                  <td>&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>วันที่ 7 มีนาคม 2559 14:45:30</td>
                                  <td><strong>สถานะ : อนุมัติทำวิจัย</strong></td>
                              </tr>
                              <tr>
                                  <td>ผู้บันทึก</td>
                                  <td>&nbsp;</td>
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
                                  <td><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong></td>
                              </tr>
                              <tr>
                                  <td>หน่วยงาน โทร : 1025</td>
                                  <td>&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>สนง.วิจัย วิชาการ และนวัมตกรรม&nbsp;&nbsp;</td>
                                  <td>&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>วันที่ 7 มีนาคม 2559 14:45:30</td>
                                  <td><strong>สถานะ : รายงานความก้าวหน้า ครั้งที่ 1</strong></td>
                              </tr>
                              <tr>
                                  <td>ผู้บันทึก</td>
                                  <td>&nbsp;</td>
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
                                  <td><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong></td>
                              </tr>
                              <tr>
                                  <td>หน่วยงาน โทร : 1025</td>
                                  <td>&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>สนง.วิจัย วิชาการ และนวัมตกรรม&nbsp;&nbsp;</td>
                                  <td>&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>วันที่ 7 มีนาคม 2559 14:45:30</td>
                                  <td><strong>สถานะ : ส่งรายงานฉบับสมบูรณ์</strong></td>
                              </tr>
                              <tr>
                                  <td>ผู้บันทึก</td>
                                  <td>&nbsp;</td>
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
                                  <td><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong></td>
                              </tr>
                              <tr>
                                  <td>หน่วยงาน โทร : 1025</td>
                                  <td>&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>สนง.วิจัย วิชาการ และนวัมตกรรม&nbsp;&nbsp;</td>
                                  <td>&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;&nbsp;&nbsp; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td>วันที่ 7 มีนาคม 2559 14:45:30</td>
                                  <td><strong>สถานะ : เสร็จสิ้น</strong></td>
                              </tr>
                              <tr>
                                  <td>ผู้บันทึก</td>
                                  <td>&nbsp;</td>
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


           <%--</div>--%>


    </form>
</body>
</html>

