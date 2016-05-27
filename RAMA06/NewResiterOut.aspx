<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="NewResiterOut.aspx.vb" Inherits="RAMA06.NewResiterOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
<div class="container">
  <h2 class ="text-center">ลงทะเบียน นักวิจัยภายนอก (โท-เอก) </h2>
    <div class="panel panel-primary">
<br />

 <div class="container"> 
    <div class="form-group">
    <h3> กรุณาบันทึกข้อมูลล่าสุด</h3>
       <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">คำนำหน้า : <asp:TextBox ID="TextBox13" runat="server" placeholder="รหัสพนักงาน" class="form-control input-lg" Font-Bold="True">นาย</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>
       <br />
       <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">ชื่อ-สกุล : <asp:TextBox ID="txtCode" runat="server" placeholder="รหัสพนักงาน" class="form-control input-lg" Font-Bold="True">เกรียงไกร พิพิธหิรัญการ</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>
       <br />
       <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">เพศ :<asp:TextBox ID="TextBox1" runat="server" placeholder="" class="form-control input-lg" Font-Bold="True">ชาย</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>
       <br />
       <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">เบอร์โทรมือถือ : <asp:TextBox ID="TextBox2" runat="server" placeholder="" class="form-control input-lg" Font-Bold="True">0830110273</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>
       <br />
        <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">E-Mail : <asp:TextBox ID="TextBox11" runat="server" placeholder="" class="form-control input-lg" Font-Bold="True">Kriangkrai.pit@mahidol.ac.th</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>   
        <br />

<div class="panel panel-default">
   <div class="panel-heading">ข้อมูลการศึกษา</div>
        <div class="panel-body">       
            <div>&nbsp;<div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">ปริญญา/วุฒิ : <asp:TextBox ID="TextBox9" runat="server" placeholder="" class="form-control input-lg" Font-Bold="True">โท</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>
        <br />
        
       <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">สาขาวิชา : <asp:TextBox ID="TextBox10" runat="server" placeholder="" class="form-control input-lg" Font-Bold="True">พยายบาล</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>
        <br />
           <div class="row">
           <div class="col-xs-12 col-sm-6 col-md-8">คณะ : <asp:TextBox ID="TextBox12" runat="server" placeholder="" class="form-control input-lg" Font-Bold="True">แพทศาสตร์โรงพยาบาลรามาธิบดี</asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtCode" Display="Dynamic" CssClass="label label-danger">
                        กรุณากรอก
                </asp:RequiredFieldValidator> 
                </div>
       </div>
        <br />

             </div> 
       </div>
</div>

       <br />

      <div><asp:Label ID="Label1" runat="server" Text="***  หมายเหตุ : ระบบจะส่ง User Name  และ Password ทาง E-Mail  ของท่านที่ระบบุในะรบบ" Font-Bold="True" ForeColor="#CC0000"></asp:Label></div>

     </div>
    
    </div>   
   
    </div> 
    <div class="text-center"><asp:Button ID="Button1" class="btn btn-primary btn-lg" runat="server" Text="ยึนยันการลงทะเบียน" Width="232px" /></div>

 <hr />  
</div>
</asp:Content>
