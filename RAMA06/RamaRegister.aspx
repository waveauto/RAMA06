<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="RamaRegister.aspx.vb" Inherits="RAMA06.RamaRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
   <h2 class ="text-center">ลงทะลงทะเบียน นักวิจัยภายใน (กรุณาตรวจสอบข้อมูลล่าสุด)</h2>
      <div class="panel panel-primary">
           <div class="panel-heading">
                 <h3 class="panel-title">ข้อมูลผู้ทำวิจัย >
           </div>

<div class ="text-Center">
     <br />
      <asp:Image ID="Image1" runat="server" Height="220px" Width="196px" ImageUrl="~/data/001.jpg" /><br />
      <asp:Button ID="Button2" runat="server" Text="..." />
</div> 

<div class="container"> 
    <div class="form-group">
       <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">รหัส (HR) : <asp:TextBox ID="txtCode" runat="server" placeholder="รหัสพนักงาน" class="form-control input-lg" Font-Bold="True">011695</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>
       <br />
       <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">ตำแหน่งทางวิชาการ (HR) : <asp:TextBox ID="TextBox1" runat="server" placeholder="" class="form-control input-lg" Font-Bold="True">รศ.</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>
       <br />
       <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">ตำแหน่งประจำ (HR) : <asp:TextBox ID="TextBox2" runat="server" placeholder="" class="form-control input-lg" Font-Bold="True">อาจารย์</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>
       <br />
        <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">ชื่อ-สกุล (HR) : <asp:TextBox ID="TextBox11" runat="server" placeholder="" class="form-control input-lg" Font-Bold="True">เกรียงไกร พิพิธหิรัญการ</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>   
        <br />
       <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">เพศ (HR) : <asp:TextBox ID="TextBox3" runat="server" placeholder="" class="form-control input-lg" Font-Bold="True">ชาย</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>
        <br />
       <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">หน่วยงานที่สังกัด (HR) : <asp:TextBox ID="TextBox4" runat="server" placeholder="" class="form-control input-lg" Font-Bold="True">ภาควิชากุมารศาสตร์</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>
       <br />
        <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">เบอร์โทรหน่วยงาน (HR) : <asp:TextBox ID="TextBox5" runat="server" placeholder="" class="form-control input-lg" Font-Bold="True">0208</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>
        <br />
        <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">เบอร์โทรมือถือ (HR) : <asp:TextBox ID="TextBox6" runat="server" placeholder="" class="form-control input-lg" Font-Bold="True">0830110273</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>
        <br />
      <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">E-mail (HR) : <asp:TextBox ID="TextBox7" runat="server" placeholder="" class="form-control input-lg" Font-Bold="True">kriangkrai.pit@mahidol.ac.th</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>
        <br />

     </div>
    
    </div>
</div>

</div>


 <div class="text-center"> <asp:Button ID="Button1" class="btn btn-primary btn-lg" runat="server" Text="ยืนยันการลงทะเบียน" Width="200px" />   </div>

    
    <br />
</asp:Content>
