<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="NewResiter.aspx.vb" Inherits="RAMA06.NewResiter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<div class="container">
<br />  
    <h1 class ="text-center">ลงทะเบียน นักวิจัย</h1>
    <br />
    <div class="panel panel-primary">
             <br />  
        <div class="container">   
              <div class="row">
                 <div class="col-md-6">
                     <h2>ลงทะเบียน นักวิจัยภายใน</h2>
                         <p><strong>นักวิจัยภายใน</strong> หมายถึง บุคคลที่เป็น พนักงานมหาวิทยาลัยสังกัด (ส่วนงาน) หรือ พนักงาน </p>
                         <p>มหาวิทยาลัย หรือ Resident/Fellow ที่สังกัดคณะแพทยศาสตร์โรงพยาบาลรามาธิบดี </p>
                         <p>เช่น อาจารย์ แพทย์ พยาบาล เจ้าหน้าที่ต่างๆ </p>
                         <p> <a class="btn btn-primary btn-xs" href="npage/nlogregis.aspx">ลงทะเบียน</a></p>
                 </div>
                 
                 <div class="col-md-6">
                     <h2>ลงทะเบียน นักวิจัยภายนอก</h2>
                         <p><strong>นักวิจัยภายนอก</strong> หมายถึง นักศีกษา ป.โท ป.เอก บุคคลภายนอก</p>
                         <p>คณะแพทยศาสตร์โรงพยาบาลรามาธิบดี     </p>
                         <p>เช่น นักศีกษา ป.โท ป.เอก หรือบุคคลภายนอกคณะ </p>
                         <p> <a class="btn btn-primary btn-xs" href="NewResiterOut.aspx">ลงทะเบียน</a></p>
                 </div>
          
              </div>
        </div>    
             <br />  
    </div> 
</div>
<br />  
<br />
<br />
</asp:Content>
