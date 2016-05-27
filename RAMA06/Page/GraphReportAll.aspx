<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="GraphReportAll.aspx.vb" Inherits="RAMA06.GraphReportAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <br />
<div class="container"> 
   <div class ="text-left"><h1>รายผลการดำเนินงานประเภทกราฟ</h1></div>
      <br />
     <div class="panel panel-default">
       <div class="panel-heading"> <strong> สรุป แท่งฐานข้อมูลสารสนเทศ (สนง.วิจัย วิชาการ และนวัฒกรรม)</strong> </div>
            <div class="panel-body">  
                              
                <div class ="text-center "><asp:Image ID="Image2" runat="server" Height="400px" ImageUrl="~/Images/G1.jpg" Width="900px" />
                </div>
                
            </div>
       </div>
     <br />
     <div class="panel panel-default">
       <div class="panel-heading"> <strong> รายงานสถิติ การลงทะเบียนการใช้งานระบบ</strong> </div>
            <div class="panel-body">                
                
                <div class ="text-center "><asp:Image ID="Image5" runat="server" Height="400px" ImageUrl="~/Images/G2.jpg" Width="900px" />
                </div>
            </div>
       </div>
     <br />
     <div class="panel panel-default">
       <div class="panel-heading"> <strong> รายงานสถิติ การส่งโครงการวิจัย</strong> </div>
            <div class="panel-body"> 
                                
                <div class ="text-center "><asp:Image ID="Image6" runat="server" Height="400px" ImageUrl="~/Images/G3.jpg" Width="900px" />
                   </div>             
            </div>
       </div> 
     <br />
     <div class="panel panel-default">
       <div class="panel-heading"> <strong> รายงานสถิติ การขอรับเงินรางวัล</strong> </div>
            <div class="panel-body"> 
                                
                <div class ="text-center "><asp:Image ID="Image7" runat="server" Height="400px" ImageUrl="~/Images/G4.jpg" Width="900px" />
                  </div>              
            </div>
       </div>
      <br />
     <div class="panel panel-default">
       <div class="panel-heading"> <strong> รายงานสถิติ การขอเงินทุนเพื่อการเดินทางและนำเสนอผลงาน</strong> </div>
            <div class="panel-body"> 
                                
                <div class ="text-center "><asp:Image ID="Image8" runat="server" Height="400px" ImageUrl="~/Images/G5.jpg" Width="900px" />
                  </div>              
            </div>
       </div>
    <br />
     <div class="panel panel-default">
       <div class="panel-heading"> <strong> รายงานสถิติ ขอแจ้งจดทรัพย์สินทางปัญญา (จดลิขสิทธิ์/สิทธิบัตร/อนุสิทธิบัตร)</strong> </div>
            <div class="panel-body"> 
                                
               <div class ="text-center "> <asp:Image ID="Image9" runat="server" Height="400px" ImageUrl="~/Images/G6.jpg" Width="900px" />
                  </div>              
            </div>
       </div>
    <br />
     <div class="panel panel-default">
       <div class="panel-heading"> <strong> ภาพรวมเปรียบเทียบประสิทธิภาพ การส่งโครงการวิจัยด้านเวลา(การติดต่อสื่อสาร)ในการดำเนินงาน (ระหว่างระบบเดิม กับ ระบบใหม่ (Paperless))</strong> </div>
            <div class="panel-body"> 
                                
                    <div class ="text-center "> <asp:Image ID="Image1" runat="server" Height="500px" ImageUrl="~/Images/G7.jpg" Width="860px" />
                  </div>    
            </div>
       </div> 
     <br />
     <div class="panel panel-default">
       <div class="panel-heading"> <strong> รายงานปรเภทอื่นๆ </strong> </div>
            <div class="panel-body"> 
                                
                <div>....</div>  
                   
            </div>
       </div> 
     <br />
</div>
<br />
</asp:Content>
